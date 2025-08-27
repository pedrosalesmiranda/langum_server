import os
import subprocess
import soundfile as sf
import torch
import torchaudio
import warnings
warnings.filterwarnings("ignore", category=UserWarning, module="torchaudio")

# --- CONFIG ---
song_file = "./musics/socrat.mp3"
output_dir = "output"
model_name = "htdemucs"  # Demucs model
target_sr = 16000         # Whisper sample rate
os.makedirs(output_dir, exist_ok=True)

# --- STEP 1: Run Demucs (vocals + no_vocals) ---
subprocess.run([
    "demucs",
    "-n", model_name,
    "--two-stems=vocals",  # outputs vocals + no_vocals
    song_file
])

# Demucs output folder
song_name = os.path.splitext(os.path.basename(song_file))[0]
demucs_out_dir = os.path.join("separated", model_name, song_name)

vocals_file = os.path.join(output_dir, "vocals.wav")
instrumental_file = os.path.join(output_dir, "instrumental.wav")

# --- STEP 2: Process vocals for Whisper ---
vocals_src = os.path.join(demucs_out_dir, "vocals.wav")
data, sr = sf.read(vocals_src)  # [samples, channels]

# Convert to mono
if data.ndim > 1:
    data = data.mean(axis=1)

# Convert to tensor and resample
vocals_audio = torch.tensor(data, dtype=torch.float32).unsqueeze(0)
if sr != target_sr:
    resampler = torchaudio.transforms.Resample(orig_freq=sr, new_freq=target_sr)
    vocals_audio = resampler(vocals_audio)
    sr = target_sr

# Save vocals with soundfile (no torchaudio warnings)
sf.write(vocals_file, vocals_audio.squeeze(0).numpy(), sr)
print(f"Vocals ready for Whisper: {vocals_file}")

# --- STEP 3: Convert no_vocals (instrumental) to mono 16kHz 16-bit WAV with ffmpeg ---
no_vocals_src = os.path.join(demucs_out_dir, "no_vocals.wav")
subprocess.run([
    "ffmpeg",
    "-y",                     # overwrite
    "-i", no_vocals_src,      # Demucs output
    "-ac", "1",               # mono
    "-ar", str(target_sr),    # 16 kHz
    "-c:a", "pcm_s16le",      # 16-bit PCM
    instrumental_file
])
print(f"Instrumental (karaoke) saved: {instrumental_file}")

# --- STEP 4: Whisper usage example ---
# import whisper
# model = whisper.load_model("medium")
# result = model.transcribe(vocals_file)
# print(result["text"])
