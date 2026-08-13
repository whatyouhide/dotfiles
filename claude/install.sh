#!/bin/bash

CONFIG_DIRS=("$HOME/.claude" "$HOME/.claude-personal")

# settings.json is intentionally NOT symlinked: it churns constantly (hooks,
# model, session state, "always allow" grants) and we don't want that
# tracked wholesale. Only the allowed-commands list (see sync-permissions.sh,
# invoked below) and the statusLine block (merged here) are version-controlled.
#
# CLAUDE.md is linked by agents/install.sh, which owns the agent-generic
# instructions file (agents/AGENTS.md).

for CONFIG_DIR in "${CONFIG_DIRS[@]}"; do

    # Link sub-agents.
    mkdir -p "$CONFIG_DIR/agents"

    for f in $HOME/dotfiles/claude/agents/*; do
        if [ -x "$f" ]; then
            ln -sfv "$f" "$CONFIG_DIR/agents/"
        else
            echo "Skipping linking agents/$(basename "$f"), it already exists in $CONFIG_DIR/agents/"
        fi
    done

    # Set the status line in the (untracked) settings.json.
    SETTINGS="$CONFIG_DIR/settings.json"
    [ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"
    jq '.statusLine = {type: "command", command: "ccstatusline", padding: 0, refreshInterval: 10}' \
        "$SETTINGS" > "$SETTINGS.tmp"
    mv "$SETTINGS.tmp" "$SETTINGS"
    echo "Set statusLine in $SETTINGS"
done

# Install the ccstatusline theme. Merged rather than symlinked: ccstatusline
# writes per-box installation metadata into its settings.json, and a symlink
# would push that churn into the repo.
CCSTATUSLINE_DIR="$HOME/.config/ccstatusline"
CCSTATUSLINE_SETTINGS="$CCSTATUSLINE_DIR/settings.json"
mkdir -p "$CCSTATUSLINE_DIR"
[ -f "$CCSTATUSLINE_SETTINGS" ] || echo '{}' > "$CCSTATUSLINE_SETTINGS"
jq --slurpfile theme "$HOME/dotfiles/claude/ccstatusline.json" \
    '$theme[0] + (if .installation then {installation: .installation} else {} end)' \
    "$CCSTATUSLINE_SETTINGS" > "$CCSTATUSLINE_SETTINGS.tmp"
mv "$CCSTATUSLINE_SETTINGS.tmp" "$CCSTATUSLINE_SETTINGS"
echo "Installed ccstatusline theme to $CCSTATUSLINE_SETTINGS"

# Seed/merge the tracked allowed-commands list into each config dir's
# (untracked) settings.json.
"$HOME/dotfiles/claude/sync-permissions.sh" apply
