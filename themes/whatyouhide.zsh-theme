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

# Git prompt infos used by `git_prompt_info`.
# Suffix and prefix.
ZSH_THEME_GIT_PROMPT_PREFIX="[git: %{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"


PROMPT='$(username) ($(host)) ⌘ $(path) $(git_prompt_info)
→ '

RPROMPT='$(last_commit_sha)'
