#!/bin/bash

CONFIG_DIRS=("$HOME/.claude" "$HOME/.claude-personal")

# settings.json is intentionally NOT symlinked: it churns constantly (hooks,
# model, session state, "always allow" grants) and we don't want that
# tracked wholesale. Only the allowed-commands list is version-controlled;
# see sync-permissions.sh, invoked below.
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
done

# Seed/merge the tracked allowed-commands list into each config dir's
# (untracked) settings.json.
"$HOME/dotfiles/claude/sync-permissions.sh" apply
