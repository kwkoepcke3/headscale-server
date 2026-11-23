#!/usr/bin/env bash
set -euo pipefail

QUADLET_DIR="$HOME/.config/containers/systemd"
SERVICE_HOME="$HOME/mayo-server/subserv/headscale"


mkdir -p    "$QUADLET_DIR" \
            "$SERVICE_HOME/runtime/headscale/data" \
            "$SERVICE_HOME/runtime/headplane/data" \
            "$SERVICE_HOME/config/headscale" \
            "$SERVICE_HOME/config/headplane"

for container in $SERVICE_HOME/*.container; do
    SUBSERV=$(basename $container .container)

    mkdir -p    "$SERVICE_HOME/runtime/$SUBSERV/data" \
                "$SERVICE_HOME/config/$SUBSERV"

    ln -sf "$SERVICE_HOME/$SUBSERV.container" "$QUADLET_DIR/$SUBSERV.container"
done

systemctl --user daemon-reload
systemctl --user restart headscale.service headplane.service
