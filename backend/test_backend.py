import requests

# Test the backend
url = "http://localhost:5000/analyze"
data = {
    "text": "What is the capital of France? A) London B) Paris C) Berlin D) Madrid"
}

print("Testing backend...")
try:
    response = requests.post(url, json=data, timeout=30)
    print(f"Status: {response.status_code}")
    print(f"Response: {response.json()}")
except Exception as e:
    print(f"Error: {e}")
