#!/bin/bash

echo "Writing ~/.gitconfig (which will include ~/.gitconfig_shared)"

cat <<EOF > "$HOME/.gitconfig"
[include]
	path = ~/.gitconfig_shared
EOF
