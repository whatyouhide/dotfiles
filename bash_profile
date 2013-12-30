# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.path and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.dotfiles/bash/*; do
	[ -r "$file" ] && source "$file"  # (note: -r is true is the file is readable by you)
done
unset file


# init z (https://github.com/rupa/z)
. ~/.z-code/z.sh


# loads RVM (as pasted from http://net.tutsplus.com/tutorials/ruby/how-to-install-ruby-on-a-mac/)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh


# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# Add git bash completion for brew-installed bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
