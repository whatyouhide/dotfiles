# Dotfiles 🥑

## Installation

These instructions are to be followed when installing these dotfiles on a new
machine. Do these steps:

  1. **XCode**: If running on a Mac, you need part of XCode. You don't need the
     whole XCode. Open the terminal and run

     ```sh
     xcode-select --install
     ```

     which will prompt the installer.

  1. [**Homebrew**][homebrew]: install it following the website's instructions,
     then export its path for now:

     ```sh
     export PATH="/opt/homebrew/bin:$PATH"
     ```

  1. **Git**: ensure you have `git` installed (it's present by default on macOS).

  1. **zsh**: install zsh with `$ brew install zsh`, then add the
     newly-installed `zsh` to `/etc/shells` (so that `chsh` will consider it a
     "safe" shell) and change to the newly added shell:

     ```sh
     echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
     chsh -s "$(which zsh)" "$(whoami)"
     ```

     Now do these:

       * delete `/etc/zprofile`
       * empty out `/etc/paths`
       * remove `path_helper`-related lines from `/etc/profile`

     These slow things down and mess up with `$PATH`.

  1. Ensure you have the `$DOTFILES` environment variable set. For example:

     ```sh
     export DOTFILES="$HOME/dotfiles"
     ```

  1. Copy SSH keys from 1Password (after doing `mkdir ~/.ssh`), into
     `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`.

  1. Clone the dotfiles and run the setup script:

     ```sh
     git clone git@github.com:whatyouhide/dotfiles.git "$DOTFILES"
     cd "$DOTFILES"
     ./setup
     ```

  1. Authenticate to GitHub by doing:

     ```sh
     gh auth login
     ```

     GitHub takes care of the whole flow for you, by redirecting you to a
     browser to do the authentication.

  1. **asdf**: you're using [asdf] installed via Homebrew. Add this to `~/.zshenv-extra`:

     ```sh
     echo "\nsource $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshenv.extra
     ```

[asdf]: https://github.com/asdf-vm/asdf
[homebrew]: http://brew.sh/
