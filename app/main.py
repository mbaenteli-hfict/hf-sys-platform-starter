import os
import socket
from flask import Flask, jsonify

app = Flask(__name__)


@app.get("/")
def index():
    version = os.getenv("APP_VERSION", "dev-local")
    hostname = socket.gethostname()
    return f"""<!doctype html>
<html lang="de">
<head>
  <meta charset="utf-8">
  <title>HF-ICT Platform Engineering Demo</title>
  <style>
    body {{ font-family: system-ui, -apple-system, sans-serif; max-width: 680px; margin: 4rem auto; padding: 0 1rem; color: #1e293b; }}
    .card {{ border: 1px solid #cbd5e1; border-radius: 10px; padding: 1.5rem; background: #f8fafc; }}
    code {{ background: #e2e8f0; padding: 0.2rem 0.4rem; border-radius: 4px; }}
  </style>
</head>
<body>
  <div class="card">
    <h1>Cloud Platform Engineering – Service aktiv</h1>
    <p>Dieser Container läuft als isolierter Prozess auf Port <code>8080</code>.</p>
    <ul>
      <li><strong>Container-Hostname:</strong> <code>{hostname}</code></li>
      <li><strong>App-Version:</strong> <code>{version}</code></li>
    </ul>
  </div>
</body>
</html>"""


@app.get("/health")
def health():
    return jsonify(status="ok", version=os.getenv("APP_VERSION", "dev-local")), 200


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=int(os.getenv("PORT", "8080")))
