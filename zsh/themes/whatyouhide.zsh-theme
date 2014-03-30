# Return the username of the current user.
function username() {
  echo %{$fg[cyan]%}%n%{$reset_color%}
}

# Return the current machine name.
function host() {
  echo %{$fg[green]%}%m%{$reset_color%}
}

# Return the current path.
function path() {
  echo %{$fg[magenta]%}%~%{$reset_color%}
}

# Return the short SHA of the last commit if we're in a git repo.
function last_commit_sha() {
  echo %{$fg_bold[yellow]%}$(git_prompt_short_sha)%{$reset_color%}
}


# Return true if your local branch is ahead of remote.
function git_is_ahead() {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    return 1
  else
    return 0
  fi
}


ZSH_THEME_GIT_PROMPT_PREFIX="git: "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_AHEAD="↑"

# Git prompt infos used by `git_prompt_info`.
# Suffix and prefix.
function git_prompt() {
  _SUFFIX=""
  if [[ $(git_is_ahead) == 1 ]]; then
    _SUFFIX="$_SUFFIX$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
  echo %{$fg[yellow]%}$(git_prompt_info)$_SUFFIX%{$reset_color%}
}

# Actual prompts (note that newlines matter).
PROMPT='$(username) [$(host)] څ $(path) ($(git_prompt))
→ '
RPROMPT='$(last_commit_sha)'
