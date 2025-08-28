-- Create tables for subtitle storage

CREATE TABLE IF NOT EXISTS Subtitles (
    subtitle_id INTEGER PRIMARY KEY AUTOINCREMENT,
    video_title TEXT,
    season TEXT,
    episode TEXT,
    series TEXT,
    music_title TEXT,
    language TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS Segments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subtitle_id INTEGER NOT NULL,
    time_start TEXT NOT NULL,
    time_end TEXT NOT NULL,
    text TEXT NOT NULL,
    segment_number INTEGER NOT NULL,
    FOREIGN KEY (subtitle_id) REFERENCES Subtitles(subtitle_id) ON DELETE CASCADE
);

-- Create indexes for better query performance
CREATE INDEX IF NOT EXISTS idx_segments_subtitle_id ON Segments(subtitle_id);
CREATE INDEX IF NOT EXISTS idx_segments_segment_number ON Segments(segment_number);
CREATE INDEX IF NOT EXISTS idx_subtitles_language ON Subtitles(language);