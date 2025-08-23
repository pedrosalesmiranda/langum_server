import subprocess
import datetime
import os

from sympy import false

# 👇 set your folders here
VIDEO_FOLDER = "./videos"
AUDIO_FOLDER = "./audios"

# Allowed video extensions
VIDEO_EXTENSIONS = (".mp4", ".mov", ".mkv", ".avi", ".flv", ".wmv")

def extract_audio(video_path: str, audio_folder: str) -> str:
    """
    Extracts audio from a video file and saves it as WAV with a timestamp.
    Returns the output audio file path.
    """
    # Ensure output folder exists
    os.makedirs(audio_folder, exist_ok=True)

    # Get base filename only (no path, no extension)
    filename = os.path.splitext(os.path.basename(video_path))[0]

    # Add timestamp
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")

    # Build output path inside AUDIO_FOLDER
    output_file = os.path.join(audio_folder, f"{filename}_audio_{timestamp}.wav")

    command = [
        "ffmpeg", "-y",
        "-i", video_path,
        "-vn",
        "-acodec", "pcm_s16le",
        # WAV PCM 16-bit
        "-ar", "16000",
        # sample rate 16kHz
        "-ac", "1",
        # mono
        output_file
    ]

    subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return output_file


from pywhispercpp.model import Model

# Global variable with your audio file
audio_filename: str = "./audios/seinfeld_1_1_audio_20250823_022120.wav"
model_path: str = "./models/ggml-large-v3-turbo.bin"
is_to_translate: bool = false
language_2_char: str = "ru"

def format_timestamp(seconds: float) -> str:
    """
    Convert float seconds to SRT timestamp (hh:mm:ss,ms)
    """
    millis = int((seconds - int(seconds)) * 1000)
    hours = int(seconds // 3600)
    minutes = int((seconds % 3600) // 60)
    secs = int(seconds % 60)
    return f"{hours:02}:{minutes:02}:{secs:02},{millis:03}"

def transcribe_to_srt(model_name=model_path, output_srt="transcript.srt"):
    """
    Transcribe the global audio file to SRT format using whisper.cpp via pywhispercpp.
    """
    model = Model(model_name, n_threads=12, print_progress=True, print_realtime=False)
    segments = model.transcribe(audio_filename, language = language_2_char, translate = is_to_translate)

    srt_lines = []
    for i, segment in enumerate(segments, start=1):
        start_ts = format_timestamp(segment.t0 / 100.0)  # pywhispercpp gives centiseconds
        end_ts = format_timestamp(segment.t1 / 100.0)
        srt_lines.append(f"{i}\n{start_ts} --> {end_ts}\n{segment.text.strip()}\n")

    srt_content = "\n".join(srt_lines)

    with open(output_srt, "w", encoding="utf-8") as f:
        f.write(srt_content)

    return srt_content


if __name__ == "__main__":
    if not os.path.isdir(VIDEO_FOLDER):
        raise NotADirectoryError(f"Folder not found: {VIDEO_FOLDER}")

    videos = [
        os.path.join(VIDEO_FOLDER, f)
        for f in os.listdir(VIDEO_FOLDER)
        if f.lower().endswith(VIDEO_EXTENSIONS)
    ]

    if not videos:
        print(f"No video files found in {VIDEO_FOLDER}")
    else:
        for video_file in videos:
            print(f"Processing: {video_file}")
            try:
                output = extract_audio(video_file, AUDIO_FOLDER)
                print(f"✅ Extracted audio: {output}")
            except Exception as e:
                print(f"❌ Failed for {video_file}: {e}")

    srt = transcribe_to_srt()
    print("SRT transcript saved.")
