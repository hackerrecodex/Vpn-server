#!/bin/bash

echo "=========================================="
echo "  My SNI Server - Educational Demo"
echo "=========================================="

# सर्टिफिकेट डायरेक्टरी बनाएं
mkdir -p /etc/xray/certs

# सेल्फ-साइन्ड सर्टिफिकेट जनरेट करें
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/xray/certs/privkey.pem \
    -out /etc/xray/certs/fullchain.pem \
    -subj "/CN=www.jio.com"

echo "[+] Certificates generated"
echo "[+] SNI: www.jio.com"
echo "[+] Starting Xray-core..."

exec /usr/local/bin/xray -config /etc/xray/config.json