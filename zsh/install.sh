#!/bin/bash

touch "$HOME/.zshrc"
touch "$HOME/.zshenv"
touch "$HOME/.zprofile"

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
