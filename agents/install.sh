#!/bin/bash

set -e

SCRIPT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
SKILLFILE="$SCRIPT_DIR/Skillfile"
SKILLS_DIR="$SCRIPT_DIR/skills"

if ! type "npx" >/dev/null 2>&1; then
    echo "npx not found, install Node first"
    exit 1
fi

install() {
    # Read Skillfile on fd 3 (and feed npx /dev/null as stdin) so npx
    # never consumes bytes from the Skillfile. Without this, the next
    # `read` skips lines and only the first entry installs — happens
    # in any non-TTY context (Ansible, `curl … | bash`, CI).
    while IFS= read -r line <&3 || [ -n "$line" ]; do
        line="${line%%#*}"
        line="$(echo "$line" | xargs)"
        [ -z "$line" ] && continue

        gum style "📚 npx skills add $line" --foreground 33 --bold
        # shellcheck disable=SC2086 # word splitting is intentional
        npx --yes skills add $line --global --agent '*' --yes < /dev/null
        echo
    done 3< "$SKILLFILE"
}

# Install my own, personally-authored skills from agents/skills/. `skills add`
# on a local path symlinks each skill into every agent dir, so the installed
# copy points back here — edits in the repo take effect immediately, no reinstall.
install_personal() {
    # nullglob so the loop is skipped cleanly when there are no skills yet.
    shopt -s nullglob
    local dirs=("$SKILLS_DIR"/*/)
    shopt -u nullglob
    [ ${#dirs[@]} -eq 0 ] && { echo "No personal skills in $SKILLS_DIR yet."; return; }

    gum style "🛠  npx skills add $SKILLS_DIR (${#dirs[@]} personal)" --foreground 33 --bold
    npx --yes skills add "$SKILLS_DIR" --global --agent '*' --skill '*' --yes < /dev/null
    echo
}

if gum confirm "Do you want to install agent skills?"; then
    install
    install_personal
else
    echo "Skipping agent skills then!"
fi
