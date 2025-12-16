import sounddevice as sd
import numpy as np
import whisper
import pyperclip

# Load Whisper model
model = whisper.load_model("tiny.en")

SAMPLE_RATE = 16000
BLOCK_SIZE = 4096

# Globals
recording = False
audio_buffer = []

def audio_callback(indata, frames, time_info, status):
    """Collect audio into buffer while recording."""
    if recording:
        audio_buffer.append(indata[:, 0].copy())

def start_recording():
    global recording, audio_buffer
    audio_buffer = []
    recording = True
    print("\nRecording started... Press Enter to stop.")

def stop_recording():
    global recording
    recording = False
    print("\nRecording stopped. Transcribing...")

    # Concatenate chunks
    audio_data = np.concatenate(audio_buffer).astype(np.float32)

    # Transcribe once
    result = model.transcribe(audio_data, fp16=False)
    text = result["text"].strip()

    # Print and copy to clipboard
    print("\n=== Transcription ===")
    print(text)
    print("====================\n")
    pyperclip.copy(text)
    print("✅ Transcription copied to clipboard!")

def main():
    global recording

    with sd.InputStream(callback=audio_callback,
                        channels=1,
                        samplerate=SAMPLE_RATE,
                        blocksize=BLOCK_SIZE):
        while True:
            cmd = input("Press 's' + Enter to start recording, 'q' + Enter to quit: ").strip().lower()
            if cmd == 'q':
                print("Exiting...")
                break
            elif cmd == 's':
                start_recording()
                input()  # wait for Enter to stop
                stop_recording()

if __name__ == "__main__":
    main()
