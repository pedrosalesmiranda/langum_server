import subprocess
import datetime
import os
import re
from pywhispercpp.model import Model
import sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from database_api import save_srt_to_database, get_subtitles_by_criteria, initialize_subtitle_tables, search_segments_by_text, get_segment_by_id
from qc_runner import run_qc

# ------------------ CONFIG ------------------
VIDEO_FOLDER = "./videos/better_than_people"
SUBTITLES_FOLDER = "./subtitles"
AUDIO_FOLDER = "./audios"
VIDEO_SEGMENTS_FOLDER = "./segments"
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


def _create_model_with_vad_settings(model_path: str, n_threads: int):
    return Model(
        model_path, 
        n_threads=n_threads, 
        print_progress=True, 
        print_realtime=False
    )


def _filter_phantom_segments(segments, max_segment_duration: float = 10.0):
    filtered_segments = []
    for segment in segments:
        duration = (segment.t1 - segment.t0) / 100.0
        text = segment.text.strip()
        
        if duration > max_segment_duration and len(text) < 20:
            continue
            
        if not text or len(text) < 3:
            continue
            
        filtered_segments.append(segment)
    return filtered_segments


def _validate_segment_durations(segments, max_duration: float = 10.0):
    return [seg for seg in segments if (seg.t1 - seg.t0) / 100.0 <= max_duration]


def _split_oversized_segments(segments, max_duration: float = 10.0):
    result_segments = []
    for segment in segments:
        duration = (segment.t1 - segment.t0) / 100.0
        if duration <= max_duration:
            result_segments.append(segment)
            continue
            
        words = segment.text.strip().split()
        if len(words) <= 1:
            result_segments.append(segment)
            continue
            
        mid_point = len(words) // 2
        duration_per_word = duration / len(words)
        split_time = segment.t0 + (mid_point * duration_per_word * 100.0)
        
        class MockSegment:
            def __init__(self, t0, t1, text):
                self.t0 = t0
                self.t1 = t1
                self.text = text
        
        first_half = MockSegment(segment.t0, split_time, " ".join(words[:mid_point]))
        second_half = MockSegment(split_time, segment.t1, " ".join(words[mid_point:]))
        
        result_segments.extend([first_half, second_half])
    
    return result_segments


def _convert_segments_to_srt(segments):
    srt_lines = []
    for i, segment in enumerate(segments, start=1):
        start_ts = format_timestamp(segment.t0 / 100.0)
        end_ts = format_timestamp(segment.t1 / 100.0)
        srt_lines.append(f"{i}\n{start_ts} --> {end_ts}\n{segment.text.strip()}\n")
    return "\n".join(srt_lines)

def _select_srt_file(default_latest=True):
    """
    Private helper to let user select an SRT file from SUBTITLES_FOLDER.

    Returns:
        str: selected SRT path, or None if cancelled/invalid
    """
    subtitles = list_subtitles()
    if not subtitles:
        print(f"⚠️ No SRT files found in {SUBTITLES_FOLDER}")
        return None

    print("\nAvailable SRT files:")
    for i, subtitle in enumerate(subtitles, 1):
        print(f"{i}. {subtitle}")

    choice = input("Select file number (or press Enter for latest): ").strip()
    if not choice:
        if default_latest:
            srt_path = sorted(subtitles)[-1]
        else:
            print("⚠️ No selection made.")
            return None
    else:
        try:
            idx = int(choice) - 1
            srt_path = subtitles[idx]
        except (ValueError, IndexError):
            print("⚠️ Invalid choice.")
            return None

    print(f"\n🎯 Selected: {srt_path}")
    return srt_path

def transcribe_to_srt(
    audio_path: str,
    model_path: str = MODEL_PATH,
    output_srt: str = None,
    language: str = "ru",
    translate: bool = False,
    n_threads: int = 12,
    max_segment_duration: float = 10.0
) -> str:
    if output_srt is None:
        os.makedirs(SUBTITLES_FOLDER, exist_ok=True)
        filename = os.path.splitext(os.path.basename(audio_path))[0]
        output_srt = os.path.join(SUBTITLES_FOLDER, filename + ".srt")

    model = _create_model_with_vad_settings(model_path, n_threads)
    raw_segments = model.transcribe(audio_path, language=language, translate=translate, no_context=True)
    
    filtered_segments = _filter_phantom_segments(raw_segments, max_segment_duration)
    validated_segments = _validate_segment_durations(filtered_segments, max_segment_duration)
    final_segments = _split_oversized_segments(validated_segments, max_segment_duration)
    
    srt_content = _convert_segments_to_srt(final_segments)

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


def list_subtitles(folder=SUBTITLES_FOLDER) -> list[str]:
    """Return a list of all SRT files in a folder."""
    if not os.path.isdir(folder):
        return []
    return [
        os.path.join(folder, f)
        for f in os.listdir(folder)
        if f.lower().endswith(".srt")
    ]


def extract_season_episode_from_filename(filename):
    """Extract season and episode numbers from filename using common patterns."""
    
    # Get just the filename without path and extension
    base_filename = os.path.splitext(os.path.basename(filename))[0].lower()
    
    # Common patterns for season/episode detection
    patterns = [
        # S01E01, s01e01, S1E1
        r's(\d{1,2})e(\d{1,2})',
        # Season 1 Episode 1, season 01 episode 01
        r'season\s*(\d{1,2})\s*episode\s*(\d{1,2})',
        # 1x01, 01x01
        r'(\d{1,2})x(\d{1,2})',
        # Just numbers like _01_01_ or -01-01-
        r'[\-_](\d{1,2})[\-_](\d{1,2})[\-_]',
    ]
    
    for pattern in patterns:
        match = re.search(pattern, base_filename)
        if match:
            season = int(match.group(1))
            episode = int(match.group(2))
            return season, episode
    
    return None, None


def extract_title_from_filename(filename):
    """Extract title from filename, removing season/episode patterns and cleaning up."""
    
    # Get just the filename without path and extension
    base_filename = os.path.splitext(os.path.basename(filename))[0]
    
    # Patterns to remove (season/episode indicators)
    removal_patterns = [
        # S01E01, s01e01, S1E1 variants
        r's\d{1,2}e\d{1,2}',
        r'S\d{1,2}E\d{1,2}',
        # Season X Episode Y variants
        r'season\s*\d{1,2}\s*episode\s*\d{1,2}',
        r'Season\s*\d{1,2}\s*Episode\s*\d{1,2}',
        # 1x01, 01x01 variants
        r'\d{1,2}x\d{1,2}',
        # Isolated season/episode numbers with separators
        r'[\-_]\d{1,2}[\-_]\d{1,2}[\-_]',
        # Timestamps or dates
        r'\d{8}_\d{6}',  # YYYYMMDD_HHMMSS format
        r'\d{4}-\d{2}-\d{2}',  # YYYY-MM-DD format
    ]
    
    # Remove season/episode patterns
    clean_title = base_filename
    for pattern in removal_patterns:
        clean_title = re.sub(pattern, '', clean_title, flags=re.IGNORECASE)
    
    # Clean up separators and extra spaces
    clean_title = re.sub(r'[\-_]+', ' ', clean_title)  # Replace dashes/underscores with spaces
    clean_title = re.sub(r'\s+', ' ', clean_title)     # Replace multiple spaces with single space
    clean_title = clean_title.strip()                  # Remove leading/trailing spaces
    
    # Convert to title case for better presentation
    clean_title = clean_title.title()
    
    return clean_title if clean_title else None


def find_video_file_for_segment(segment_data):
    """Find matching video file based on segment subtitle metadata."""
    (segment_id, subtitle_id, time_start, time_end, text, segment_number,
     video_title, season, episode, series, music_title, language, filename) = segment_data
    
    videos = list_videos()
    if not videos:
        return None
    
    # First try to match by stored filename (most reliable)
    if filename:
        for video_path in videos:
            video_filename = os.path.basename(video_path)
            # Remove extension for comparison
            stored_name = os.path.splitext(filename)[0] if filename else ""
            current_name = os.path.splitext(video_filename)[0]
            
            if stored_name and stored_name.lower() == current_name.lower():
                return video_path
    
    # Fallback to metadata-based matching
    for video_path in videos:
        video_filename = os.path.basename(video_path)
        
        # Extract info from video filename
        video_season, video_episode = extract_season_episode_from_filename(video_filename)
        video_series_title = extract_title_from_filename(video_filename)
        
        # Match by series + season + episode (most specific)
        if series and season and episode:
            if (video_series_title and series.lower() in video_series_title.lower() and
                str(video_season).zfill(2) == str(season).zfill(2) and
                str(video_episode).zfill(2) == str(episode).zfill(2)):
                return video_path
        
        # Match by video title (for standalone videos)
        if video_title and video_series_title:
            if video_title.lower() in video_series_title.lower():
                return video_path
    
    return None


def convert_srt_time_to_seconds(srt_time):
    """Convert SRT timestamp (hh:mm:ss,mmm) to seconds."""
    time_parts = srt_time.replace(',', '.').split(':')
    hours = int(time_parts[0])
    minutes = int(time_parts[1])
    seconds = float(time_parts[2])
    return hours * 3600 + minutes * 60 + seconds


def extract_video_segment(video_path: str, start_time: float, end_time: float, output_path: str) -> str:
    """Extract a video segment using ffmpeg."""
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    
    # Calculate duration instead of using absolute end time
    duration = end_time - start_time

    command = [
        "ffmpeg", "-y",
        "-i", video_path,
        "-ss", str(start_time),
        "-t", str(duration),
        "-c:v", "libx264",
        "-c:a", "aac",
        "-crf", "23",
        "-preset", "fast",
        output_path
    ]

    subprocess.run(command, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return output_path


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
        
        # Store video filename for future reference
        video_filename = os.path.basename(video_path)
        print(f"📁 Video filename: {video_filename}")
        
    except Exception as e:
        print(f"❌ Failed: {e}")


def option_save_srt_to_database():
    """Save an existing SRT file to the database."""
    try:
        # Initialize database tables
        initialize_subtitle_tables()
        print("✅ Database tables initialized")
    except Exception as e:
        print(f"❌ Failed to initialize database: {e}")
        return

    subtitles = list_subtitles()
    if not subtitles:
        print(f"⚠️ No SRT files found in {SUBTITLES_FOLDER}")
        return

    print("\nAvailable SRT files:")
    for i, subtitle in enumerate(subtitles, 1):
        print(f"{i}. {subtitle}")

    choice = input("Select file number (or press Enter for latest): ").strip()
    if not choice:
        srt_path = sorted(subtitles)[-1]
    else:
        try:
            idx = int(choice) - 1
            srt_path = subtitles[idx]
        except (ValueError, IndexError):
            print("⚠️ Invalid choice.")
            return

    print(f"\nSelected: {srt_path}")
    
    # Choose subtitle type
    print("\n🎬 Choose subtitle type:")
    print("1 - Video (default)")
    print("2 - Music")
    print("3 - Serial/TV Show")
    
    type_choice = input("Select type (1-3, or press Enter for Video): ").strip()
    
    # Initialize variables
    video_title = None
    season = None
    episode = None
    series = None
    music_title = None
    
    if type_choice == "2":
        # Music subtitle
        predicted_title = extract_title_from_filename(srt_path)
        print("\n🎵 Music subtitle metadata:")
        
        if predicted_title:
            music_prompt = f"Music title (predicted: {predicted_title}, or enter custom): "
            music_input = input(music_prompt).strip()
            music_title = music_input if music_input else predicted_title
        else:
            music_title = input("Music title: ").strip() or None
            
        if not music_title:
            print("⚠️ Music title is required for music subtitles.")
            return
    elif type_choice == "3":
        # Serial subtitle - try to predict season/episode from filename
        predicted_season_num, predicted_episode_num = extract_season_episode_from_filename(srt_path)
        predicted_title = extract_title_from_filename(srt_path)
        
        print("\n📺 Serial subtitle metadata:")
        
        if predicted_title:
            series_prompt = f"Series name (predicted: {predicted_title}, or enter custom): "
            series_input = input(series_prompt).strip()
            series = series_input if series_input else predicted_title
        else:
            series = input("Series name: ").strip() or None
            
        if not series:
            print("⚠️ Series name is required for serial subtitles.")
            return
        
        # Show predicted values as defaults (display with S/E but store just numbers)
        if predicted_season_num:
            season_prompt = f"Season (predicted: S{predicted_season_num:02d}, or enter number): "
            season_input = input(season_prompt).strip()
            if season_input:
                # Parse user input - handle both "01" and "S01" formats
                season_match = re.search(r'(\d+)', season_input)
                season = season_match.group(1) if season_match else None
            else:
                season = str(predicted_season_num).zfill(2)  # Store as zero-padded string
        else:
            season_input = input("Season number (e.g., '01'): ").strip()
            season = season_input if season_input else None
            
        if predicted_episode_num:
            episode_prompt = f"Episode (predicted: E{predicted_episode_num:02d}, or enter number): "
            episode_input = input(episode_prompt).strip()
            if episode_input:
                # Parse user input - handle both "01" and "E01" formats
                episode_match = re.search(r'(\d+)', episode_input)
                episode = episode_match.group(1) if episode_match else None
            else:
                episode = str(predicted_episode_num).zfill(2)  # Store as zero-padded string
        else:
            episode_input = input("Episode number (e.g., '01'): ").strip()
            episode = episode_input if episode_input else None
    else:
        # Video subtitle (default)
        predicted_title = extract_title_from_filename(srt_path)
        print("\n🎬 Video subtitle metadata:")
        
        if predicted_title:
            video_prompt = f"Video title (predicted: {predicted_title}, or enter custom): "
            video_input = input(video_prompt).strip()
            video_title = video_input if video_input else predicted_title
        else:
            video_title = input("Video title: ").strip() or None
            
        if not video_title:
            print("⚠️ Video title is required for video subtitles.")
            return
    
    # Common fields for all types
    language = input("Language (default 'en'): ").strip() or "en"
    
    # Generate video filename automatically from SRT filename (remove timestamp)
    srt_basename = os.path.splitext(os.path.basename(srt_path))[0]
    
    # Remove timestamp pattern (YYYY_MM_DD_HH_MM_SS or YYYYMMDD_HHMMSS)
    media_basename = re.sub(r'_\d{4}[-_]?\d{2}[-_]?\d{2}[-_]?\d{2}[-_]?\d{2}[-_]?\d{2}$', '', srt_basename)
    # Also handle YYYYMMDD_HHMMSS format
    media_basename = re.sub(r'_\d{8}_\d{6}$', '', media_basename)
    
    print(f"\n📁 Auto-generating video filename from SRT: '{srt_basename}' → '{media_basename}'")
    
    # Ask for video file extension only
    extension = input("Video file extension (default '.avi'): ").strip() or ".avi"
    if not extension.startswith('.'):
        extension = '.' + extension
    
    video_filename = media_basename + extension
    print(f"📄 Video filename will be: {video_filename}")

    try:
        subtitle_id = save_srt_to_database(
            srt_file_path=srt_path,
            video_title=video_title,
            season=season,
            episode=episode,
            series=series,
            music_title=music_title,
            language=language,
            filename=video_filename
        )
        
        if subtitle_id:
            print(f"🎯 Subtitle saved to database with ID: {subtitle_id}")
        else:
            print("❌ Failed to save subtitle to database")
            
    except Exception as e:
        print(f"❌ Error: {e}")


def option_search_segments():
    """Search segments by text content"""
    print("\n🔍 Search subtitle segments by text:")
    print("Enter any word or phrase to find in subtitle segments")
    
    search_text = input("Enter search text: ").strip()
    if not search_text:
        print("⚠️ Search text is required.")
        return
    
    try:
        results = search_segments_by_text(search_text)
        
        if not results:
            print(f"📭 No segments found containing: '{search_text}'")
            return
        
        print(f"\n🔍 Found {len(results)} matching segments:")
        
        for result in results:
            (segment_id, subtitle_id, time_start, time_end, text, segment_number,
             video_title, season, episode, series, music_title, language, filename) = result
            
            print(f"\n📺 Segment #{segment_number} ({time_start} → {time_end}):")
            print(f"    💬 \"{text}\"")
            
            # Show subtitle context
            if series:
                context = f"{series}"
                if season: context += f" S{season}"
                if episode: context += f"E{episode}"
            elif video_title:
                context = video_title
            elif music_title:
                context = f"🎵 {music_title}"
            else:
                context = "Unknown"
            
            print(f"    🎬 From: {context} ({language})")
            print(f"    🆔 Subtitle ID: {subtitle_id}")
            
    except Exception as e:
        print(f"❌ Search error: {e}")


def option_extract_video_segment():
    """Extract video segment by segment ID"""
    print("\n🎬 Extract video segment by segment ID:")
    
    segment_id_input = input("Enter segment ID: ").strip()
    if not segment_id_input:
        print("⚠️ Segment ID is required.")
        return
    
    try:
        segment_id = int(segment_id_input)
    except ValueError:
        print("⚠️ Segment ID must be a valid integer.")
        return
    
    try:
        # Get segment data from database
        segment_data = get_segment_by_id(segment_id)
        
        if not segment_data:
            print(f"❌ Segment with ID {segment_id} not found in database.")
            return
        
        (seg_id, subtitle_id, time_start, time_end, text, segment_number,
         video_title, season, episode, series, music_title, language, filename) = segment_data
        
        print(f"\n📺 Found segment:")
        print(f"    📝 Text: \"{text}\"")
        print(f"    ⏱️  Time: {time_start} → {time_end}")
        
        # Show context
        if series:
            context = f"{series}"
            if season: context += f" S{season}"
            if episode: context += f"E{episode}"
        elif video_title:
            context = video_title
        elif music_title:
            context = f"🎵 {music_title}"
        else:
            context = "Unknown"
        print(f"    🎬 From: {context}")
        
        # Find matching video file
        print("\n🔍 Looking for matching video file...")
        video_path = find_video_file_for_segment(segment_data)
        
        if not video_path:
            print("❌ Could not find matching video file for this segment.")
            print("   Available videos:")
            videos = list_videos()
            for i, video in enumerate(videos, 1):
                print(f"     {i}. {os.path.basename(video)}")
            return
        
        print(f"✅ Found video: {os.path.basename(video_path)}")
        
        # Convert timestamps to seconds
        start_seconds = convert_srt_time_to_seconds(time_start)
        end_seconds = convert_srt_time_to_seconds(time_end)
        
        # Add n second margins before and after
        margin_seconds = 1 # TODO this can be a config setting const
        start_with_margin = max(0, start_seconds - margin_seconds)  # Don't go below 0
        end_with_margin = end_seconds + margin_seconds
        
        original_duration = end_seconds - start_seconds
        final_duration = end_with_margin - start_with_margin
        actual_start_margin = start_seconds - start_with_margin  # How much margin we actually got at start
        
        print(f"⏱️  Original segment: {original_duration:.2f} seconds ({time_start} → {time_end})")
        print(f"⏱️  With margins: {final_duration:.2f} seconds ({actual_start_margin:.1f}s before + {original_duration:.2f}s + {margin_seconds}s after)")
        print(f"⏱️  Final timing: {start_with_margin:.2f}s → {end_with_margin:.2f}s")
        
        # Create output filename
        os.makedirs(VIDEO_SEGMENTS_FOLDER, exist_ok=True)
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        
        # Create descriptive filename
        if series and season and episode:
            filename = f"{series.replace(' ', '_')}_S{season}E{episode}_segment_{segment_id}_{timestamp}.avi"
        elif video_title:
            filename = f"{video_title.replace(' ', '_')}_segment_{segment_id}_{timestamp}.avi"
        else:
            filename = f"segment_{segment_id}_{timestamp}.avi"
        
        # Clean filename
        filename = re.sub(r'[<>:"/\\|?*]', '_', filename)  # Remove invalid characters
        output_path = os.path.join(VIDEO_SEGMENTS_FOLDER, filename)
        
        print(f"\n🎬 Extracting segment...")
        print(f"    📂 Output: {output_path}")
        
        # Extract video segment with margins
        extract_video_segment(video_path, start_with_margin, end_with_margin, output_path)
        
        print(f"✅ Video segment extracted successfully!")
        print(f"    📁 Saved to: {output_path}")
        print(f"    📝 Text: \"{text}\"")
        
    except Exception as e:
        print(f"❌ Error extracting video segment: {e}")

def option_run_qc():
    """Run QC on an existing SRT file."""
    from qc_runner import run_qc

    srt_path = _select_srt_file()
    if not srt_path:
        return

    issues = run_qc(srt_path)

    if not issues:
        print("✅ No QC issues found")
        return

    print("\n❌ QC issues:")
    for i in issues:
        print(f"Subtitle #{i['index']} | {i['rule']} | {i['message']}")


# ------------------ MAIN ------------------

def main():
    while True:
        print("\n🎬 Whisper Automation Menu:")
        print("1 - Extract WAV from all movies in folder")
        print("2 - Convert a WAV to SRT")
        print("3 - Create SRT directly from a movie (extract + transcribe)")
        print("4 - Save SRT file to database")
        print("5 - Search segments by text")
        print("6 - Extract video segment by segment ID")
        print("7 - Run subtitle QC on SRT")
        print("0 - Exit\n")

        choice = input("Select option: ").strip()

        if choice == "1":
            option_extract_wav()
        elif choice == "2":
            option_wav_to_srt()
        elif choice == "3":
            option_movie_to_srt()
        elif choice == "4":
            option_save_srt_to_database()
        elif choice == "5":
            option_search_segments()
        elif choice == "6":
            option_extract_video_segment()
        elif choice == "7":
            option_run_qc()
        elif choice == "0":
            print("👋 Exiting...")
            break
        else:
            print("⚠️ Invalid choice.")


if __name__ == "__main__":
    main()
