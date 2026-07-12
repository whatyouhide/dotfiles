#!/bin/bash
# Sync the tracked allowed-commands list (claude/permissions.json) with the
# live, untracked ~/.claude/settings.json / ~/.claude-personal/settings.json.
#
# settings.json itself is no longer symlinked into dotfiles because it churns
# constantly (hooks, model, session state, plugin config, ad-hoc "always
# allow" grants). Only permissions.allow/deny is worth version-controlling,
# so it's tracked separately here and merged in by hand.
#
# Usage:
#   claude/sync-permissions.sh export   Snapshot ~/.claude/settings.json's
#                                        permissions into permissions.json.
#                                        Review with `git diff` and commit
#                                        when you want to persist new grants.
#   claude/sync-permissions.sh apply    Merge permissions.json into every
#                                        config dir's settings.json (creating
#                                        it if missing). Non-destructive:
#                                        unions with whatever's already there.

set -euo pipefail

DOTFILES="$HOME/dotfiles"
PERMISSIONS_FILE="$DOTFILES/claude/permissions.json"
CONFIG_DIRS=("$HOME/.claude" "$HOME/.claude-personal")

usage() {
  echo "Usage: $0 export|apply" >&2
  exit 1
}

[ $# -eq 1 ] || usage

case "$1" in
  export)
    SRC="$HOME/.claude/settings.json"
    [ -f "$SRC" ] || { echo "No $SRC found" >&2; exit 1; }
    jq '{allow: (.permissions.allow // [] | sort), deny: (.permissions.deny // [] | sort)}' "$SRC" \
      > "$PERMISSIONS_FILE.tmp"
    mv "$PERMISSIONS_FILE.tmp" "$PERMISSIONS_FILE"
    echo "Exported permissions to $PERMISSIONS_FILE"
    echo "Review with: git -C \"$DOTFILES\" diff -- claude/permissions.json"
    ;;
  apply)
    [ -f "$PERMISSIONS_FILE" ] || { echo "No $PERMISSIONS_FILE found" >&2; exit 1; }
    for CONFIG_DIR in "${CONFIG_DIRS[@]}"; do
      mkdir -p "$CONFIG_DIR"
      TARGET="$CONFIG_DIR/settings.json"
      [ -f "$TARGET" ] || echo '{}' > "$TARGET"
      jq --slurpfile p "$PERMISSIONS_FILE" '
        .permissions.allow = (((.permissions.allow // []) + $p[0].allow) | unique) |
        .permissions.deny  = (((.permissions.deny  // []) + $p[0].deny)  | unique)
      ' "$TARGET" > "$TARGET.tmp"
      mv "$TARGET.tmp" "$TARGET"
      echo "Applied permissions to $TARGET"
    done
    ;;
  *)
    usage
    ;;
esac
