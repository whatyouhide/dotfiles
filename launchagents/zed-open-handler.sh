#!/bin/bash
# Reads a single devbox-side path from the socket (stdin) and opens it in
# Zed as a remote SSH workspace on this Mac. Invoked by the
# localhost.zed-open LaunchAgent (listens on 127.0.0.1:2227), paired
# with the `zed` shim + RemoteForward 2227 on the devbox.
# Uses the `devbox` SSH alias from ~/.ssh/config, which must not force a
# RemoteCommand/TTY — Zed's remote server needs a plain shell.
set -euo pipefail

read -r path || exit 0
[ -n "$path" ] || exit 0

exec /opt/homebrew/bin/zed "ssh://devbox${path}"
