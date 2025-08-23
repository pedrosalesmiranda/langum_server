import subprocess
import datetime
import os

# 👇 set your video file here
VIDEO_FILENAME = "seinfeld_1_1.mkv"

def extract_audio(video_path: str) -> str:
    """
    Extracts audio from a video file and saves it as WAV with a timestamp.
    Returns the output audio file path.
    """
    if not os.path.isfile(video_path):
        raise FileNotFoundError(f"File not found: {video_path}")

    base, _ = os.path.splitext(video_path)
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    output_file = f"{base}_audio_{timestamp}.wav"

    command = [
        "ffmpeg", "-y",
        "-i", video_path,
        "-vn",
        "-acodec", "pcm_s16le",
        "-ar", "44100",
        "-ac", "2",
        output_file
    ]

    subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return output_file


if __name__ == "__main__":
    output = extract_audio(VIDEO_FILENAME)
    print(f"Audio extracted to: {output}")
