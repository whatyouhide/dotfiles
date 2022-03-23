#!/bin/bash -e

BUNDLE_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd "$BUNDLE_DIR"

echo "Removing current Brewfile..."
rm -f Brewfile

echo "Dumping"
brew bundle dump
