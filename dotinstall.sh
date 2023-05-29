#!/bin/sh
#---create dotfiles link---
echo "---create dotfile links---"
set -u
cp .xinitrc $HOME
# for dotfile in .??*; do
#     [ "$dotfile" = ".git" ] && continue
#     rm -r "$HOME/$dotfile"
#     ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
# done

# cd ..
cd config
for conf in ??*; do
    rm -r "$HOME/.config/$conf"
    ln -snfv "$(pwd)/$conf" "$HOME/.config/$conf"
done

# chsh -s /usr/bin/zsh
# zsh

# set as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
fish