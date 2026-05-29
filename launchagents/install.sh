#!/bin/bash
# Installs per-user LaunchAgents that listen on 127.0.0.1 and pipe to
# pbcopy/pbpaste, plus xdg-open-svc for `open`. Paired with the
# RemoteForward lines in ~/.ssh/config and the ~/bin shims on the
# Linux dev box (see knock-devbox repo).
set -euo pipefail

DOTFILES="${DOTFILES:-$HOME/dotfiles}"
SRC="$DOTFILES/launchagents"
DST="$HOME/Library/LaunchAgents"
USER_UID="$(id -u)"

mkdir -p "$DST"

for plist in "$SRC"/localhost.*.plist; do
  label="$(basename "$plist" .plist)"
  link="$DST/$label.plist"

  ln -sfv "$plist" "$link"

  # bootout is a no-op if the job isn't loaded; swallow the error so the
  # first run on a fresh box doesn't fail.
  launchctl bootout "gui/$USER_UID/$label" 2>/dev/null || true
  launchctl bootstrap "gui/$USER_UID" "$link"
done

# xdg-open-svc ships its own `service do` block in the Homebrew formula,
# so brew services manages the plist for us — we just have to start it.
if command -v brew >/dev/null 2>&1 && brew list xdg-open-svc >/dev/null 2>&1; then
  brew services start xdg-open-svc >/dev/null
fi
