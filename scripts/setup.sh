#!/usr/bin/env bash
set -euo pipefail

echo "[INFO] Install Docker & Compose..."
sudo apt update && sudo apt install -y docker.io docker-compose

SERVER_IP=$(curl -s ifconfig.me)
echo "[INFO] Server Public IP: $SERVER_IP"

sed -i "s/\$(SERVER_IP)/$SERVER_IP/g" docker-compose.yml

echo "[INFO] Starting RustDesk..."
docker-compose up -d

echo "[INFO] Public key ada di: ./data/id_ed25519.pub"
