import requests
import json

url = "http://localhost:3000/register"  # Ganti dengan URL endpoint server Anda

data = {
    "email": "example@example.com",
    "username": "example",
    "password": "examplepassword"
}

headers = {
    "Content-Type": "application/json; charset=UTF-8"
}

response = requests.post(url, data=json.dumps(data), headers=headers)

if response.status_code == 200:
    print("User registered successfully")
else:
    print("Failed to register user")
    print("Response status code:", response.status_code)
    print("Response body:", response.text)
