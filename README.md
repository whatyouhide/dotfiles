# Dotfiles

## Installation

These instructions are to be followed when installing these dotfiles on a new
machine.

### XCode

You don't need the whole XCode. Just run any command that is in Apple's Command
Line Tools and it will prompt to install them. For example, just open
`Terminal.app` and run `$ make`.

### Homebrew

Install [Homebrew][homebrew] by running:

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Now install at least `git` (`brew install git hub`).

### Changing the shell

To change your shell to `zsh`, first install `zsh`:

```bash
brew install zsh
```

Add the newly installed `zsh` to `/etc/shells` (so that `chsh` will consider it
a "safe" shell):

```bash
echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
```

Now run:

```bash
chsh -s "$(which zsh)" "$(whoami)"
```

### Cloning the dotfiles

Clone the dotfiles:

```bash
hub clone whatyouhide/dotfiles ~/dotfiles
```

### Setting up the dotfiles

Run the following commands to setup the dotfiles:

```bash
cd ~/dotfiles
export DOTFILES="$HOME/dotfiles"
./setup
```


[homebrew]: http://brew.sh/
