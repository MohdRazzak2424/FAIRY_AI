
from elevenlabs import play
from elevenlabs.client import ElevenLabs

client = ElevenLabs(
  api_key="sk_62b7e4f56a7165a09678f58ae3a03057ee6b5fa703daa149"
)

audio = client.generate(
  text="Hello! 你好! Hola! नमस्ते! Bonjour! こんにちは! مرحبا! 안녕하세요! Ciao! Cześć! Привіт! வணக்கம்!",
  voice="Brian",
  model="eleven_multilingual_v2"
)
play(audio)