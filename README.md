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

  1. [**Homebrew**][homebrew].

     1. Install it following the website's instructions.

     1. Export its path (only *for now*):

        ```sh
        export PATH="/opt/homebrew/bin:$PATH"
        ```

  1. **Git**: ensure you have `git` installed (it's present by default on macOS).

  1. **zsh**: these days, zsh is the default shell on macOS. Cool, but double check by opening up a terminal and running `echo $0`, which should print `-zsh`.

     Now do these:

       * delete `/etc/zprofile`

       * remove `path_helper`-related lines from `/etc/profile`

       * make sure `/etc/paths` contains this:

         ```shell
         /usr/bin
         /bin
         /usr/sbin
         /sbin
         ```

     These slow things down and mess up with `$PATH`.

  1. Ensure you have the `$DOTFILES` environment variable set. For example:

     ```sh
     export DOTFILES="$HOME/dotfiles"
     ```

  1. Copy SSH keys from 1Password (after doing `mkdir ~/.ssh`), into
     `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`.

  1. Clone the dotfiles and run the setup script:

     ```sh
     git clone https://github.com/whatyouhide/dotfiles.git "$DOTFILES"
     cd "$DOTFILES"
     ./setup
     ```

  1. **asdf**: you're using [asdf] installed via Homebrew. Add this to `~/.zshenv-extra`:

     ```sh
     echo "\nsource $(brew --prefix asdf)/libexec/asdf.sh" >> ~/.zshenv.extra
     ```

### GitHub

  1. Authenticate to GitHub by doing:

     ```sh
     gh auth login
     ```

     GitHub takes care of the whole flow for you, by redirecting you to a
     browser to do the authentication.

  1. Now that you have 1Password, log in as necessary and *enable the SSH agent*.

  1. Generate a new SSH key for this computer and add it to your GitHub account.

  1. Set up GPG signing of commits (mostly following [this guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)).

     1. Add the `signinkey` and `gpgsign` configs to `~/.gitconfig` (the
        `signinkey` is in 1Password). Then, add this line to `~/.zshenv-extra`:

        ```sh
        export GPG_TTY=$(tty)
        ```

     1. Export the public and private GPG keys from the previous machine:

        ```sh
        gpg --list-secret-keys # Get the ID like this
        gpg --export <ID> > public.key
        gpg --export-secret-key <ID> private.key
        ```

     1. Move these files on the new machine and run:

        ```sh
        gpg --import public.key
        gpg --import private.key
        ```

        Make sure that `gpg --list-secret-keys` shows the key.

     1. Set up macOS GPG signing with pinentry.

        ```sh
        brew install pinentry-mac
        echo "pinentry-program $(which pinentry-mac)" >> ~/.gnupg/gpg-agent.conf
        killall gpg-agent
        ```

[asdf]: https://github.com/asdf-vm/asdf
[homebrew]: http://brew.sh/
