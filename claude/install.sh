#!/bin/bash

CONFIG_DIRS=("$HOME/.claude" "$HOME/.claude-personal")

# settings.json is intentionally NOT symlinked: it churns constantly (hooks,
# model, session state, "always allow" grants) and we don't want that
# tracked wholesale. Only the allowed-commands list is version-controlled;
# see sync-permissions.sh, invoked below.
FILES_TO_LINK=("CLAUDE.md")

for CONFIG_DIR in "${CONFIG_DIRS[@]}"; do
    # Link settings file.
    for f in "${FILES_TO_LINK[@]}"; do
        ln -sfv "$HOME/dotfiles/claude/$f" "$CONFIG_DIR/$f"
    done

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

# Link Codex for good measure too.
ln -sfv "$HOME/dotfiles/claude/CLAUDE.md" "$HOME/.codex/AGENTS.md"
