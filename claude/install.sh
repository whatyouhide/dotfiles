#!/bin/bash

CONFIG_DIR="$HOME/.claude"

mkdir -p "$(dirname "$CONFIG_DIR")"

for f in $HOME/dotfiles/claude/agents/*; do
    if [ -x "$f" ]; then
        ln -sfv "$f" "$CONFIG_DIR/agents/"
    else
        echo "Skipping linking agents/$(basename "$f"), it already exists in $CONFIG_DIR/agents/"
    fi
done

for f in $HOME/dotfiles/claude/commands/*; do
    if [ -x "$f" ]; then
        ln -sfv "$f" "$CONFIG_DIR/commands/"
    else
        echo "Skipping linking commands/$(basename "$f"), it already exists in $CONFIG_DIR/commands/"
    fi
done
