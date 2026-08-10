#!/bin/bash

# Shared helpers for setup, the module install scripts, and bin/ scripts.
# Load with: source "$HOME/dotfiles/lib.sh"

echo_colored() { echo -e "${2}$1\033[0m"; }

echo_info() {
  gum style \
    --foreground 212 --border-foreground 212 --border double \
    --align left --width 50 --margin "1 0" --padding "0 1" \
    "💁 $1"
}

warn() {
  gum style --foreground 214 --bold "⚠️  $1" >&2
}

fail() {
  echo_colored "$1" "\033[1;31m"
  exit 1
}

ensure_gum_installed() {
  if ! type "gum" >/dev/null 2>&1; then
    fail "gum is not installed. Run 'brew install gum' (macOS) or 'apt install gum' (Linux) and re-run this script."
  fi
}

# Prompt for confirmation, unless DOTFILES_NO_CONFIRMATION_PROMPT=true (set
# by `setup --profile devbox`), which auto-confirms so scripts can run
# unattended (Ansible, dotfiles-sync over SSH).
confirm() {
  if [ "${DOTFILES_NO_CONFIRMATION_PROMPT:-}" = "true" ]; then
    return 0
  fi
  gum confirm "$1"
}
