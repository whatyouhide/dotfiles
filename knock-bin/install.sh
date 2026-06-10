#!/bin/bash

for f in $HOME/dotfiles/knock-bin/*; do
    if [ -x "$f" ]; then
        ln -sfv "$f" "$HOME/bin"
    fi
done
