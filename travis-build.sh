#!/usr/bin/env bash
set -e
set -u

export HTTP_PORT=5050
export RESPONSE_COMPRESSION=True
export INSTALL_DIR=/opt/w3top
script=https://raw.githubusercontent.com/devizer/w3top-bin/master/install-w3top-service.sh
(wget -q -nv --no-check-certificate -O - $script 2>/dev/null || curl -ksSL $script) | bash

sleep 30
curl -I http://localhost:5050/
curl http://localhost:5050/api/BriefInfo


sudo journalctl -u w3top.service | head -1
sudo systemctl disable w3top.service

