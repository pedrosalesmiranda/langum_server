import subprocess
import datetime
import os
from pywhispercpp.model import Model

# ------------------ CONFIG ------------------
VIDEO_FOLDER = "./videos/duck_tales/season1"
SUBTITLES_FOLDER = "./subtitles"
AUDIO_FOLDER = "./audios"
MODEL_PATH = "./models/ggml-large-v3-turbo.bin"
VIDEO_EXTENSIONS = (".mp4", ".mov", ".mkv", ".avi", ".flv", ".wmv")


# ------------------ UTILS ------------------

def extract_audio(video_path: str, audio_folder: str) -> str:
    """Extract audio from a video file and saves it as WAV with a timestamp."""
    os.makedirs(audio_folder, exist_ok=True)

    filename = os.path.splitext(os.path.basename(video_path))[0]
    timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
    output_file = os.path.join(audio_folder, f"{filename}_{timestamp}.wav")

    command = [
        "ffmpeg", "-y",
        "-i", video_path,
        "-vn",
        "-acodec", "pcm_s16le",  # WAV PCM 16-bit
        "-ar", "16000",          # sample rate 16kHz
        "-ac", "1",              # mono
        output_file
    ]

    subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return output_file


def format_timestamp(seconds: float) -> str:
    """Convert float seconds to SRT timestamp (hh:mm:ss,ms)."""
    millis = int((seconds - int(seconds)) * 1000)
    hours = int(seconds // 3600)
    minutes = int((seconds % 3600) // 60)
    secs = int(seconds % 60)
    return f"{hours:02}:{minutes:02}:{secs:02},{millis:03}"


def transcribe_to_srt(
    audio_path: str,
    model_path: str = MODEL_PATH,
    output_srt: str = None,
    language: str = "ru",
    translate: bool = False,
    n_threads: int = 12
) -> str:
    """Transcribe the given audio file to SRT format."""
    if output_srt is None:
        os.makedirs(SUBTITLES_FOLDER, exist_ok=True)
        filename = os.path.splitext(os.path.basename(audio_path))[0]
        output_srt = os.path.join(SUBTITLES_FOLDER, filename + ".srt")

    model = Model(model_path, n_threads=n_threads, print_progress=True, print_realtime=False)
    segments = model.transcribe(audio_path, language=language, translate=translate)

    srt_lines = []
    for i, segment in enumerate(segments, start=1):
        start_ts = format_timestamp(segment.t0 / 100.0)  # centiseconds → seconds
        end_ts = format_timestamp(segment.t1 / 100.0)
        srt_lines.append(f"{i}\n{start_ts} --> {end_ts}\n{segment.text.strip()}\n")

    srt_content = "\n".join(srt_lines)

    with open(output_srt, "w", encoding="utf-8") as f:
        f.write(srt_content)

    return output_srt


def list_videos(folder=VIDEO_FOLDER) -> list[str]:
    """Return a list of all video files in a folder."""
    if not os.path.isdir(folder):
        return []
    return [
        os.path.join(folder, f)
        for f in os.listdir(folder)
        if f.lower().endswith(VIDEO_EXTENSIONS)
    ]


def list_audios(folder=AUDIO_FOLDER) -> list[str]:
    """Return a list of all WAV files in a folder."""
    if not os.path.isdir(folder):
        return []
    return [
        os.path.join(folder, f)
        for f in os.listdir(folder)
        if f.lower().endswith(".wav")
    ]


# ------------------ MENU ACTIONS ------------------

def option_extract_wav():
    """Extract WAV from all videos in VIDEO_FOLDER."""
    videos = list_videos()
    if not videos:
        print(f"⚠️ No video files found in {VIDEO_FOLDER}")
        return
    for video_file in videos:
        print(f"Processing: {video_file}")
        try:
            output = extract_audio(video_file, AUDIO_FOLDER)
            print(f"✅ Extracted audio: {output}")
        except Exception as e:
            print(f"❌ Failed for {video_file}: {e}")


def option_wav_to_srt():
    """Convert a WAV file to SRT."""
    audios = list_audios()
    if not audios:
        print(f"⚠️ No WAV files found in {AUDIO_FOLDER}")
        return

    print("\nAvailable WAV files:")
    for i, audio in enumerate(audios, 1):
        print(f"{i}. {audio}")

    choice = input("Select file number (or press Enter for latest): ").strip()
    if not choice:
        audio_path = sorted(audios)[-1]  # most recent (lexicographic by name)
    else:
        try:
            idx = int(choice) - 1
            audio_path = audios[idx]
        except (ValueError, IndexError):
            print("⚠️ Invalid choice.")
            return

    try:
        output_srt = transcribe_to_srt(audio_path)
        print(f"✅ Transcript saved: {output_srt}")
    except Exception as e:
        print(f"❌ Failed transcription: {e}")


def option_movie_to_srt():
    """Extract WAV + Transcribe to SRT from a chosen movie in VIDEO_FOLDER."""
    videos = list_videos()
    if not videos:
        print(f"⚠️ No video files found in {VIDEO_FOLDER}")
        return

    print("\nAvailable video files:")
    for i, video in enumerate(videos, 1):
        print(f"{i}. {video}")

    choice = input("Select file number (or press Enter for latest): ").strip()
    if not choice:
        video_path = sorted(videos)[-1]  # pick most recent lexicographically
    else:
        try:
            idx = int(choice) - 1
            video_path = videos[idx]
        except (ValueError, IndexError):
            print("⚠️ Invalid choice.")
            return

    try:
        wav_path = extract_audio(video_path, AUDIO_FOLDER)
        print(f"✅ Extracted audio: {wav_path}")
        output_srt = transcribe_to_srt(wav_path)
        print(f"✅ Transcript saved: {output_srt}")
    except Exception as e:
        print(f"❌ Failed: {e}")



# ------------------ MAIN ------------------

def main():
    while True:
        print("\n🎬 Whisper Automation Menu:")
        print("1 - Extract WAV from all movies in folder")
        print("2 - Convert a WAV to SRT")
        print("3 - Create SRT directly from a movie (extract + transcribe)")
        print("0 - Exit\n")

        choice = input("Select option: ").strip()

        if choice == "1":
            option_extract_wav()
        elif choice == "2":
            option_wav_to_srt()
        elif choice == "3":
            option_movie_to_srt()
        elif choice == "0":
            print("👋 Exiting...")
            break
        else:
            print("⚠️ Invalid choice.")


if __name__ == "__main__":
    main()
