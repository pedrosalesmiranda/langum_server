# from faster_whisper import WhisperModel
#
# model = WhisperModel(
#     "base",
#     device="cuda",
#     compute_type="float16"
# )

# import torch
#
# print("CUDA available:", torch.cuda.is_available())
# print("GPU:", torch.cuda.get_device_name(0))


from faster_whisper import WhisperModel

model = WhisperModel("base", device="cuda", compute_type="float16")
segments, _ = model.transcribe("test_seinfeld.wav", language="ru", task="translate", vad_filter=True, word_timestamps=False)

for s in segments:
    print(s.start)
    print(s.end)
    # print(s.words)
    print(s.text)
