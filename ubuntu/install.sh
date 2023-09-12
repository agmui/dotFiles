#!/bin/bash
#---Files---
echo "---create folders---"
mkdir ~/Downloads
mkdir ~/Documents
mkdir ~/Pictures
cp -r ../wallpapers ~/Pictures
mkdir ~/Pictures/screenshot
mkdir ~/Installs
mkdir ~/cs
mkdir ~/.fonts

yes | sudo apt install nala

echo "---install apps---"
yes | sudo nala update
yes | sudo nala upgrade

# random lid suspend https://askubuntu.com/questions/15520/how-can-i-tell-ubuntu-to-do-nothing-when-i-close-my-laptop-lid

#---Commands---
##essential commands
echo "comands=========================================================================================="
echo "---install commands---"
yes | sudo nala install --no-install-recommends fish build-essential python3 python3-pip python3-dev ranger curl wget git tlp powertop htop \
network-manager net-tools openssh-server proxychains openssl ca-certificates \
software-properties-common apt-transport-https ppa-purge \
neofetch make cmake fzf bat entr xdotool exa #fd
yes | sudo nala purge needrestart

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -P ~/.fonts/
unzip ~/.fonts/JetBrainsMono.zip

#nvim
yes | sudo add-apt-repository ppa:neovim-ppa/unstable
yes | sudo nala update
yes | sudo nala install neovim

# colored man pages TODO:
# fisher install decors/fish-colored-man

#---GUI---
echo "gui=========================================================================================="
echo "---install GUI apps---"
##Desktop Environment
yes | sudo nala install --no-install-recommends xinit lightdm picom arandr blueman \
nitrogen vlc ristretto screengrab  dunst flameshot kitty btop light pinita #onlyoffice

sudo wget https://github.com/JezerM/web-greeter/releases/latest | sudo nala install

sudo dpkg-reconfigure lightdm # set lightdm as default

# ranger --copy-config=all

# only office
wget http://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb
yes | sudo nala install ./onlyoffice-desktopeditors_amd64.deb
echo "you can change to dark mode in settings"

## git ssh
echo -ne '\n\n\n' | ssh-keygen -t ed25519 -C "anthonynmui@gmail.com"
if [[!eval "$(ssh-agent -s)"]]; then
    echo error with ssh
    exit
fi
ssh-add ~/.ssh/id_ed25519


echo "i3=========================================================================================="
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2023.02.18_all.deb keyring.deb SHA256:a511ac5f10cd811f8a4ca44d665f2fa1add7a9f09bef238cdfad8461f5239cc4
sudo nala install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
yes | sudo nala update
yes | sudo nala install i3

yes | sudo nala install xserver-xorg i3status polybar rxvt-unicode x11-xserver-utils dmenu rofi libgtk-3-0 xss-lock \
xarchiver thunar gvfs autofs gvfs-backends thunar-archive-plugin ntfs-3g \
fcitx5 fcitx5-mozc fonts-noto fonts-noto-cjk fonts-noto-cjk-extra ttf-ancient-fonts-symbola fonts-noto-color-emoji \
qemu-system libvirt-clients libvirt-daemon-system \
filezilla thunderbird arandr autorandr lxappearance

#==============================
##firefox install
#https://www.omgubuntu.co.uk/2022/04/how-to-install-firefox-deb-apt-ubuntu-22-04
sudo add-apt-repository ppa:mozillateam/ppa

echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt install firefox

#==============================
##Theming
#guide: https://itsfoss.com/i3-customization/#change-theme-and-icons-in-the-i3-window-manager

# gtk theme
wget https://github.com/catppuccin/gtk/releases/download/v0.6.0/Catppuccin-Frappe-Standard-Maroon-Dark.zip -P ~/.themes/
unzip ~/.themes/Catppuccin-Frappe-Standard-Maroon-Dark.zip

# icons
git clone https://github.com/catppuccin/papirus-folders.git
sudo cp -r papirus-folders/src/* /usr/share/icons/Papirus
./papirus-folders -C cat-frappe-maroon --theme Papirus-Dark

# cursor
# git clone https://github.com/yeyushengfan258/ArcMidnight-Cursors.git
# cd ArcMidnight-Cursors
# ./build.sh
# mkdir -p ~/.icons/ArcMidnight-cursors/
# cp dist ~/.icons/ArcMidnight-cursors/
# gsettings set org.gnome.desktop.interface cursor-theme 'ArcMidnight-Cursors'
# cd $HOME
git clone https://github.com/catppuccin/cursors.git
unzip cursors/Catppuccin-Frappe-Maroon-Cursors.zip -d ~/.icons

## RANDOM Thunar file manager nvim fix
# if in Thunar and you try to open a file with nvim but you get the wrong terminal
# do this: https://askubuntu.com/questions/788736/open-vim-in-xfce4-terminal-from-thunar
# change the /usr/shar/application/nvim.desktop file on line `Exec=nvim %F` to `Exec=kitty nvim %F`


#==============================

##Visual Studio Code
# guide of how to install with apt https://code.visualstudio.com/docs/setup/linux
yes | curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/ms-vscode-keyring.gpg
yes | echo "deb [arch=amd64 signed-by=/usr/share/keyrings/ms-vscode-keyring.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
yes | sudo nala update
yes | sudo nala install code

#---Input Method---
#echo "---set input method"
#rm -r ~/.config/fcitx5
#cp -rf $(pwd)/fcitx5 ~/.config/fcitx5

#echo "---change caps to ctrl---"
#sudo cp keyboard /etc/default/keyboard
#sudo systemctl restart console-setup

echo "follow this guide for rose vpn: https://wiki.rhlug.org/index.php/Accessing_the_Off-Campus_VPN"

echo "=========================================================================================="
echo "---Installation completed---"
