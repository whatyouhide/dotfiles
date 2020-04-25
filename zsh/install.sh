#!/bin/sh

for dir in $HOME/Code $HOME/bin; do
    if [ -d "$dir" ]; then
        echo "Directory already exists: $dir"
    else
        mkdir -p "$dir" && echo "Directory created successfully: $dir"
    fi
done
