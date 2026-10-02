#!/bin/bash

CONFIG_DIRS=("$HOME/.claude")

# settings.json is intentionally NOT symlinked: it churns constantly (hooks,
# model, session state, "always allow" grants) and we don't want that
# tracked wholesale. Only the allowed-commands list (see sync-permissions.sh,
# invoked below) and the mods folders (merged here) are version-controlled.
#
# AGENTS.md is linked by agents/install.sh, which owns the agent-generic
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

    # Load the mods in claude/mods (function-hook plugins) straight from this
    # repo, in the CLI and in the desktop app, through the (untracked)
    # settings.json. The status-band mod replaces the old statusLine command.
    SETTINGS="$CONFIG_DIR/settings.json"
    [ -f "$SETTINGS" ] || echo '{}' > "$SETTINGS"
    MODS=""
    for mod in "$HOME"/dotfiles/claude/mods/*/; do
        [ -f "$mod.claude-plugin/plugin.json" ] || continue
        MODS="${MODS:+$MODS:}~/dotfiles/claude/mods/$(basename "$mod")"
    done
    jq --arg mods "$MODS" 'del(.statusLine) | .env.CLAUDE_CODE_PLUGIN_DIRS = $mods' \
        "$SETTINGS" > "$SETTINGS.tmp"
    mv "$SETTINGS.tmp" "$SETTINGS"
    echo "Set CLAUDE_CODE_PLUGIN_DIRS in $SETTINGS"
done

# Seed/merge the tracked allowed-commands list into each config dir's
# (untracked) settings.json.
"$HOME/dotfiles/claude/sync-permissions.sh" apply
