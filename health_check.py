import urllib.request
import json

try:
    response = urllib.request.urlopen("http://localhost:9090/-/healthy")
    print(f"Prometheus Health Status: {response.status}")
except Exception as e:
    print(f"Health check failed: {e}")
