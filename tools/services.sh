#!/usr/bin/env bash
set -euo pipefail

QUADLET_DIR="$HOME/.config/containers/systemd"
SERVICE_HOME="$HOME/mayo-server/subserv/headscale"

mkdir -p "$SERVICE_HOME/data"

ln -sf "$SERVICE_HOME/headscale.container" "$QUADLET_DIR/headscale.container"

systemctl --user daemon-reload
systemctl --user restart headscale.service
