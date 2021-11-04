#!/bin/sh

for f in $DOTFILES/bin/*; do
    if [ -x "$f" ]; then
        ln -sfv "$f" "$HOME/bin"
    fi
done
