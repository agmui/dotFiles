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

# install fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# install all plugins
cat ~/dotfiles/config/fish/fish_plugins | fisher install

# install omf
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
# install theme
omf install bobthefish
