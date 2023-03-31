# note cs server: ssh muian@gauss.csse.rose-hulman.edu
sudo dnf upgrade
#lol idk something I found
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update

sudo dnf install git make curl
git clone https://github.com/agmui/dotFiles.git

# i3-gaps
# i3-gaps merged with i3
#sudo dnf install i3-gaps
#add rounded corners
#git clone https://github.com/terroo/i3-radius
#cd i3-radius && sh build.sh
#cd ..
#rm -rf i3-radius

# i3lock-color
sudo dnf copr enable tokariew/i3lock-color
sudo dnf remove i3lock
sudo dnf install i3lock-color
# run with bash ~/dotFiles/lock.sh

# polybar
sudo dnf install polybar
cp ~/dotFiles/polybar ~/.config

# kitty
sudo dnf install kitty
#TODO add font download
cp ~/dotFiles/kitty.conf ~/.config/kitty/

# nitogen
sudo dnf install nitrogen

# autorandr and arandr
sudo dnf install arandr autorandr
# may need to add .config/autorandr/settings.ini to disable some flags ex:
#[config]
#skip-options=gamma, x-prop-broadcast_rgb


# power manager
# [follow guide](https://linrunner.de/tlp/installation/fedora.html)

echo "still need to manualy run autorandr -s <name>
then 
1. place this script (or better symlink it from autorandr location)
    to ~/.config/autorandr/postswitch
 2. run "nitrogen" and set wallpapers for current profile as you wish
 3. run ~/.config/autorandr/postswitch savebg
 4. repeat steps 2-3 for any profile you wish"

# maybe install pulseaudio or pipewire-pulseaudio
#TODO:
# howdy
# low battery manager i.e. hibernation and lowpower mode
# audio visuliser
# video wall paper
# picom
# add config jumper
# weather desktop update
# orc script
# .config in git repo
# dunst capslock notification in the middle

#ZSH or fish
sudo dnf install fish 
# set as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
#Fisher plugins
cp ~/dotfiles/fish/ ~/.configs
# colored man pages
# fisher install decors/fish-colored-man

fisher update
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install fzf
sudo dnf install fzf
#dependencies
sudo dnf install fd bat

#Nvim
sudo dnf install -y neovim python3-neovim
mkdir ~/.config/nvim
cp ~/dotFiles/init.vim ~/.config/nvim/
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#fzf to vim

# may need to install nodejs with nvm and may need to apply .nvmrc for coc
# source: https://github.com/nvm-sh/nvm#fish
# else just coment out the let g: coc_node_path line

# eww
# for fedora you may need to install gtk3-devel and all the other
# devels that come with it
sudo dnf install gtk3-devel

# dunst
sudo dnf install dunst
cp -r ~/dotFiles/dunst ~/.config/dunst

# rofi
sudo dnf install rofi 
mkdir -p $HOME/.local/share/rofi/themes/
cp -r ~/dotFiles/rofi/themes $HOME/.local/share/rofi/themes/
cp -r ~/dotFiles/rofi/ ~/.config/rofi

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf update
sudo dnf install code
echo remember to sign in with github acc

# teams
sudo dnf install teams

# automation tools for running and auto keybord inputs
sudo dnf install entr xdotool

# to change gtk theme
# https://wiki.archlinux.org/title/GTK#Configuration

# for verilog compile and view waveform
sudo dnf install iverilog gtkwave
# guide: https://www.youtube.com/watch?v=g7gvQkFdODA&t=2622s


# discord
# add `"SKIP_HOST_UPDATE": true` into ~/.config/discord/settings.json

# tesseract ocr
sudo dnf install tesseract

# postman
# https://learning.postman.com/docs/getting-started/installation-and-updates/#installing-postman-on-linux
#
# TODO find a good img viewer

#  distrobox
#  add to bashrc `export TERM=vt100`

# fedora timesnew romaan font install
# https://discussion.fedoraproject.org/t/help-installing-microsoft-fonts-like-arial-times-new-roman/78169/7
# https://li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-3.0-1.noarch.rpm 79
# https://li.nux.ro/download/nux/dextop/el7/x86_64/webcore-fonts-vista-3.0-1.noarch.rpm
# `sudo dnf install ./webcore-fonts*`
