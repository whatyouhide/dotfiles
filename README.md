# Dotfiles

## Installation

These instructions are to be followed when installing these dotfiles on a new
machine. Do these steps:

  1. **XCode**: If running on a Mac, you need part of XCode. You don't need the
  whole XCode. Just run any command that is in Apple's Command Line Tools and it
  will prompt to install them. For example, just open `Terminal.app` and run `$
  make`.

  1. [**Homebrew**][homebrew]: install it following the website's instructions.

  1. **Git**: ensure you have `git` installed (it's present by default on macOS).

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

  1. Ensure you have the `$DOTFILES` environment variable set. For example:

     ```sh
     export DOTFILES="$HOME/dotfiles"
     ```

  1. Copy SSH keys from 1Password.

  1. Clone the dotfiles and run the setup script:

     ```sh
     git clone git@github.com:whatyouhide/dotfiles.git "$DOTFILES"
     cd "$DOTFILES"
     ./setup
     ```

  1. You should have `hub` installed (if not, `brew install hub`). Go to <https://github.com/settings/tokens> and generate a new token with all `repo` permissions. Copy the token and use it as a password when running `hub clone SOME_REPO`. Otherwise, paste it into `~/.config/hub`.

  1. **asdf**: if you're using [asdf][asdf] installed through Homebrew, then figure out the prefix with `brew --prefix asdf` (for example, `/usr/local/opt/asdf`) and use that in these lines:

     1. Add `source /usr/local/opt/asdf/asdf.sh` to `~/.zshenv-extra`

     1. If you want to use Elixir from a local installation, clone Elixir and then follow [asdf's guide][asdf-guide-local-elixir]

[asdf]: https://github.com/asdf-vm/asdf
[asdf-guide-local-elixir]: https://github.com/asdf-vm/asdf-elixir#compiling-from-a-git-reference-or-from-source
[homebrew]: http://brew.sh/
