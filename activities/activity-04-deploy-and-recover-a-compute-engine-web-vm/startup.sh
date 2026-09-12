#!/usr/bin/env bash
set -euo pipefail
apt-get update
apt-get install -y nginx
echo 'ACE activity healthy' > /var/www/html/index.html
systemctl enable --now nginx
