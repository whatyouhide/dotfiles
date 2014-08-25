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
  local p=$(pwd | sed -e "s,^$HOME,~,")
  echo %{$fg[magenta]%}$p%{$reset_color%}
}


# Returns the rvm-prompt output, but it's safe to use when rvm-prompt isn't
# available.
function rvm_prompt() {
  if type rvm-prompt > /dev/null 2>&1; then
    echo "<%{$fg[blue]%}$(rvm-prompt)%{$reset_color%}>"
  else
    echo ''
  fi
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

  # If there are addons (length of string is non-zero), prefix them with
  # a space character.
  if [[ -n $_SUFFIX ]]; then
    _SUFFIX=" $_SUFFIX"
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

  echo "(%{$fg[yellow]%}$(git_prompt_current_branch)$(git_prompt_addons)%{$reset_color%}) "
}


function available_tools() {
  _TOOLS=""

  # How to display each tool.
  _RAKE="%{$fg_bold[red]%}rake%{$reset_color%}"
  _GRUNT="%{$fg[blue]%}grunt%{$reset_color%}"
  _VAGRANT="%{$fg_bold[yellow]%}vagrant%{$reset_color%}"

  if [[ -f "Rakefile" ]]; then
    _TOOLS="$_TOOLS $_RAKE"
  fi
  if [[ -f "Gruntfile.coffee" || -f "Gruntfile.js" ]]; then
    _TOOLS="$_TOOLS $_GRUNT"
  fi
  if [[ -f "Vagrantfile" ]]; then
    _TOOLS="$_TOOLS $_VAGRANT"
  fi

  echo $_TOOLS
}


# Actual prompts (note that newlines matter).
PROMPT="$(username)@$(host) $(path) $(custom_git_prompt)$(rvm_prompt)
→ "
RPROMPT="$(available_tools)"
