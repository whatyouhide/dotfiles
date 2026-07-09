#!/bin/bash

CONFIG_DIRS=("$HOME/.claude" "$HOME/.claude-personal")

FILES_TO_LINK=("settings.json" "CLAUDE.md")

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
