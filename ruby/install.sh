#!/bin/bash

if [[ -d "$HOME/.rvm/gemsets" ]]; then
  ln -sfv "$DOTFILES/ruby/rvm-global.gems" "$HOME/.rvm/gemsets/global.gems"
fi
