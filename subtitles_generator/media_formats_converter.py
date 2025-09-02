import os
import subprocess


def wav_to_mp4(audio_file, output_file="output.mp4", width=640, height=360):
    if not os.path.isfile(audio_file):
        print(f"Audio file '{audio_file}' does not exist.")
        return

    cmd = [
        "ffmpeg",
        "-f", "lavfi",
        "-i", f"color=c=black:s={width}x{height}",
        "-i", audio_file,
        "-c:v", "libx264",
        "-c:a", "aac",
        "-b:a", "192k",
        "-shortest",
        output_file
    ]

    try:
        subprocess.run(cmd, check=True)
        print(f"MP4 video created: {output_file}")
    except subprocess.CalledProcessError as e:
        print("Error during conversion:", e)


def mp3_to_wav(mp3_file, sample_rate=16000):
    if not os.path.isfile(mp3_file):
        print(f"MP3 file '{mp3_file}' does not exist.")
        return

    # same filename, but .wav extension
    base, _ = os.path.splitext(mp3_file)
    wav_file = base + ".wav"

    cmd = [
        "ffmpeg",
        "-i", mp3_file,
        "-ar", str(sample_rate),   # 16kHz sample rate (Whisper default)
        "-ac", "1",                # mono channel
        "-c:a", "pcm_s16le",       # 16-bit PCM
        wav_file
    ]

    try:
        subprocess.run(cmd, check=True)
        print(f"WAV file created: {wav_file}")
        return wav_file
    except subprocess.CalledProcessError as e:
        print("Error during conversion:", e)
        return None

# wav_to_mp4("./audios/vocals.wav")
mp3_to_wav("./audios/813_c2-20-1-1.mp3")
