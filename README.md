# Dotfiles 🥑

My dotfiles, I don't think they'll work for ya but who knows. This is for Macs.

## Installation

Do these steps:

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

  1. Clone the dotfiles and run the setup script:

     ```sh
     git clone https://github.com/whatyouhide/dotfiles.git "$DOTFILES"
     cd "$DOTFILES"
     ./setup
     ```

  1. Log in to 1Password with at least your personal account.

  1. Copy SSH keys from 1Password (after doing `mkdir ~/.ssh`), into
     `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub`.

### Apps

#### Arc

  1. Log in to Arc and sync workspaces and whatnot. Doing this sooner rather than later means that you have all your websites and stuff.

  1. Install the right extensions, like 1Password.

  1. Make it the default browser.

### Obsidian

  1. Go to *iCloud Drive* in the Finder, right-click on *Obsidian*'s directory, and select "Keep Downloaded".

### GitHub

  1. Authenticate to GitHub by doing:

     ```sh
     gh auth login
     ```

     GitHub takes care of the whole flow for you, by redirecting you to a
     browser to do the authentication.

  1. Now that you have 1Password, log in as necessary and *enable the SSH agent*.

  1. Generate a new SSH key for this computer and add it to your GitHub account.

     ```sh
     ssh-keygen -t ed25519 -C <email>
     ```

  1. Add the newly-generated key to 1Password.

  1. Set up GPG signing of commits *through 1Password*. When you create the new entry in 1Password, it should automatically suggest to use 1Password for signing commits. It'll tell you to modify `~/.gitconfig`, so follow the instructions. If you still want to use GPG, see [this file](./gpg.md). For this to work, you also need to add the key as a *signing key* in GitHub ([guide](https://blog.1password.com/git-commit-signing/)).

[homebrew]: http://brew.sh/
