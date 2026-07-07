#!/bin/bash
# Reads a single box-side path from the socket (stdin) and opens it in
# Zed as a remote SSH workspace on this Mac. Invoked by the
# localhost.zed-open LaunchAgent (listens on 127.0.0.1:2227), paired
# with the `zed` shim + RemoteForward 2227 on the knock-devbox box.
# The `knock-devbox-zed` SSH alias is the plain (no forced RemoteCommand/
# TTY) host that Zed's remote server needs.
set -euo pipefail

read -r path || exit 0
[ -n "$path" ] || exit 0

exec /opt/homebrew/bin/zed "ssh://knock-devbox-zed${path}"
