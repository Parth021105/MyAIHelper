import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("GEMINI_KEY_1")

# List available models
url = f"https://generativelanguage.googleapis.com/v1beta/models?key={API_KEY}"
response = requests.get(url)

print("Available models:")
if response.status_code == 200:
    models = response.json()
    for model in models.get("models", []):
        name = model.get("name", "")
        if "generateContent" in model.get("supportedGenerationMethods", []):
            print(f"  - {name}")
else:
    print(f"Error: {response.status_code}")
    print(response.text)
