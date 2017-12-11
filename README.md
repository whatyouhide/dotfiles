# Dotfiles

## Installation

These instructions are to be followed when installing these dotfiles on a new
machine. Do these steps:

  1. **XCode**: If running on a Mac, you need part of XCode. You don't need the
  whole XCode. Just run any command that is in Apple's Command Line Tools and it
  will prompt to install them. For example, just open `Terminal.app` and run `$
  make`.

  1. [**Homebrew**][homebrew]: install it by running:

     ```sh
     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
     ```

  1. **Git**: ensure you have `git` installed (it's present by default on macOS).

  1. Ensure you have the `$DOTFILES` environment variable set. For example:

     ```sh
     export DOTFILES="$HOME/dotfiles"
     ```

  1. **zsh**: install zsh with `$ brew install zsh`, then add the new installed
     `zsh` to `/etc/shells` (so that `chsh` will consider it a "safe" shell) and
     change to the newly added shell:

     ```sh
     echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
     chsh -s "$(which zsh)" "$(whoami)"
     ```

     On macOS, be sure to:

       * delete `/etc/zprofile`
       * empty out `/etc/paths`
       * remove `path_helper`-related lines from `/etc/profile`

     as they slow things down and mess up with `PATH`.

  1. Clone the dotfiles and run the setup script:

     ```sh
     git clone git@github.com:whatyouhide/dotfiles.git "$DOTFILES"
     cd "$DOTFILES"
     ./setup
     ```
   
  1. After installing Dropbox, link the (Google fonts) fonts directory:
  
     ```sh
     sudo rm -rfv ~/Library/Fonts
     sudo ln -sfv ~/Dropbox/Applications/Fonts ~/Library/Fonts
     ```


[homebrew]: http://brew.sh/
