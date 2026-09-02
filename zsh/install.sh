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

if [ -f "$HOME/.zprofile" ]; then
    echo "~/.zprofile already exists"
else
    echo "~/.zprofile not found, creating it..."
    touch "$HOME/.zprofile"
fi

if grep -q 'source "$HOME/dotfiles/zsh/config.zsh"' "$HOME/.zshrc"; then
    echo "Source line already exists in ~/.zshrc"
else
    echo 'source "$HOME/dotfiles/zsh/config.zsh"' >>"$HOME/.zshrc"
    echo "Added source line to ~/.zshrc"
fi

if grep -q 'source "$HOME/dotfiles/zsh/env.zsh"' "$HOME/.zshenv"; then
    echo "Source line already exists in ~/.zshenv"
else
    echo 'source "$HOME/dotfiles/zsh/env.zsh"' >>"$HOME/.zshenv"
    echo "Added source line to ~/.zshenv"
fi

# macOS runs /etc/zprofile (path_helper) after ~/.zshenv in login shells, which
# moves /usr/bin & co. in front of Homebrew and the version-manager shims.
# Sourcing env.zsh again from ~/.zprofile restores our order.
if grep -q 'source "$HOME/dotfiles/zsh/env.zsh"' "$HOME/.zprofile"; then
    echo "Source line already exists in ~/.zprofile"
else
    echo 'source "$HOME/dotfiles/zsh/env.zsh"' >>"$HOME/.zprofile"
    echo "Added source line to ~/.zprofile"
fi
