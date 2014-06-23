# Return the username of the current user.
function sliced-username() {
  local u=$(whoami)
  echo %{$fg[cyan]%}$u[1,2]%{$reset_color%}
}

# Return the current machine name.
function sliced-host() {
  local h=$(hostname -s)
  echo %{$fg[green]%}$h[1,2]%{$reset_color%}
}

# Return the current path.
function path() {
  local p=$(pwd | sed -e "s,^$HOME,~,")
  echo %{$fg[magenta]%}$p%{$reset_color%}
}

function noconflict-rvm-prompt() {
  echo %{$fg[blue]%}$(rvm-prompt v)%{$reset_color%}
}



# Set some variables to print the git prompt.
# Ones used by oh-my-zsh:
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
# Custom ones:
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_UNTRACKED="+"
ZSH_THEME_GIT_PROMPT_DIRTY="*"


# Tell if we're in a git repository.
function git_is_repo() {
  if [[ -d '.git' ]] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    return 0;
  else
    return 1;
  fi
}

# Find the git branch we're on.
function git_prompt_current_branch() {
  echo $(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')
}

# Git prompt infos used by `custom_git_prompt`.
# Suffix and prefix.
function git_prompt_addons() {
  _INDEX=$(command git status --porcelain -b 2> /dev/null)
  _SUFFIX=""

  # Check if the repository is dirty.
  # This command has an exit status of 0 if the repository is clean.
  if ! git diff --quiet --ignore-submodules HEAD &>/dev/null; then
    _SUFFIX="$_SUFFIX$ZSH_THEME_GIT_PROMPT_DIRTY"
  fi

  # Check if there are untracked files.
  if $(echo "$_INDEX" | grep '^??' &> /dev/null); then
    _SUFFIX="$_SUFFIX$ZSH_THEME_GIT_PROMPT_UNTRACKED"
  fi

  # Check if ahead/behind of remote.
  if $(echo "$_INDEX" | grep '^## .*ahead' &> /dev/null); then
    _SUFFIX="$_SUFFIX$ZSH_THEME_GIT_PROMPT_AHEAD"
  elif $(echo "$_INDEX" | grep '^## .*behind' &> /dev/null); then
    _SUFFIX="$_SUFFIX$ZSH_THEME_GIT_PROMPT_BEHIND"
  fi

  echo $_SUFFIX
}

# Print a customized git prompt. This is only a wrapper around oh-my-zsh
# `git_prompt_info`, with a few addons and colors.
function custom_git_prompt() {
  if ! git_is_repo; then
    echo ""
    return
  fi

  echo "%{$fg[yellow]%}$(git_prompt_current_branch)$(git_prompt_addons)%{$reset_color%} "
}

# Actual prompts (note that newlines matter).
PROMPT='$(sliced-username)@$(sliced-host) $(path) $(noconflict-rvm-prompt) $(custom_git_prompt)λ '
RPROMPT=''
