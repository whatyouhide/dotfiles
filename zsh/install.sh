#!/bin/bash

if [ -f "$HOME/.zshrc" ]; then
    echo "~/.zshrc already exists"
else
    echo "~/.zshrc not found, creating it..."
    touch "$HOME/.zshrc"
fi

if [ -f "$HOME/.zshenv" ]; then
    echo "~/.zshenv already exists"
else
    echo "~/.zshenv not found, creating it..."
    touch "$HOME/.zshenv"
fi

if grep -q 'source "$DOTFILES/zsh/config.zsh"' "$HOME/.zshrc"; then
    echo "Source line already exists in ~/.zshrc"
else
    echo 'source "$DOTFILES/zsh/config.zsh"' >>"$HOME/.zshrc"
    echo "Added source line to ~/.zshrc"
fi

if grep -q 'source "$DOTFILES/zsh/env.zsh"' "$HOME/.zshenv"; then
    echo "Source line already exists in ~/.zshenv"
else
    echo 'source "$DOTFILES/zsh/env.zsh"' >>"$HOME/.zshenv"
    echo "Added source line to ~/.zshenv"
fi
