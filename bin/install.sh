for f in $DOTFILES/bin/*; do
    ln -sfv "$f" "$HOME/bin"
done
