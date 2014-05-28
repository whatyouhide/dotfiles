# Return the username of the current user.
function username() {
  echo %{$fg[cyan]%}%n%{$reset_color%}
}

# Return the current path.
function path() {
  echo %{$fg[green]%}%~%{$reset_color%}
}

PROMPT="$(username) $(path) → "
