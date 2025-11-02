import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("GEMINI_KEY_1")
print(f"Testing API key: {API_KEY[:20]}...")

# Test with gemini-pro first (most common)
url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key={API_KEY}"

payload = {
    "contents": [
        {
            "parts": [
                {"text": "Say hello in one word"}
            ]
        }
    ]
}

print("\nTesting with gemini-pro...")
response = requests.post(url, json=payload, headers={"Content-Type": "application/json"})
print(f"Status: {response.status_code}")
print(f"Response: {response.text[:500]}")

if response.status_code != 200:
    # Try gemini-1.5-flash
    print("\n\nTrying gemini-1.5-flash...")
    url2 = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={API_KEY}"
    response2 = requests.post(url2, json=payload, headers={"Content-Type": "application/json"})
    print(f"Status: {response2.status_code}")
    print(f"Response: {response2.text[:500]}")
