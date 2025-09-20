#!/usr/bin/env bash
set -euo pipefail

# Deteksi IP Publik server
SERVER_IP=$(curl -s ifconfig.me)
echo "[INFO] Server Public IP: $SERVER_IP"

# Inject IP ke docker-compose.yml
sed -i "s/\$(SERVER_IP)/$SERVER_IP/g" docker-compose.yml

# Jalankan RustDesk
echo "[INFO] Starting RustDesk containers..."
docker-compose up -d

echo "[INFO] RustDesk server running!"
echo "[INFO] Public key ada di: ./data/id_ed25519.pub"
