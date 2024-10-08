# GPG Setup

Legacy guide that I was using before I started using 1Password for signing commits.

Set up GPG (mostly following [this guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)).

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
