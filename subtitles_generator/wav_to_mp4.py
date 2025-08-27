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

wav_to_mp4("./audios/vocals.wav")