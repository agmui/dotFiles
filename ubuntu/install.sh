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
#
# gpu hardware accleration
# do dis one: https://github.com/elFarto/nvidia-vaapi-driver/?tab=readme-ov-file#firefox
# PPA: https://launchpad.net/~ubuntuhandbook1/+archive/ubuntu/nvidia-vaapi
# READ BUT DONT DO: https://ubuntuhandbook.org/index.php/2021/08/enable-hardware-video-acceleration-va-api-for-firefox-in-ubuntu-20-04-18-04-higher/
# https://forums.debian.net/viewtopic.php?t=137948
# https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
# https://wiki.archlinux.org/title/Hardware_video_acceleration#Verifying_VA-API

#---Commands---
##essential commands
echo "comands=========================================================================================="
echo "---install commands---"
yes | sudo nala install --no-install-recommends fish build-essential python3 python3-pip python3-dev ranger curl wget git tlp powertop htop \
network-manager net-tools openssh-server proxychains openssl ca-certificates \
software-properties-common apt-transport-https ppa-purge \
neofetch make cmake fzf bat entr xdotool exa #fd
yes | sudo nala purge needrestart

# tlpui thing
# sudo add-apt-repository -y ppa:linuxuprising/apps
# sudo apt update
# sudo apt install tlpui

# disable cloud-init
# https://askubuntu.com/questions/1321968/ubuntu-server-20-04-2-lts-hangs-after-bootup-cloud-init-1781-yyyy-mm-dd-h
# https://cloudinit.readthedocs.io/en/latest/explanation/boot.html
sudo touch /etc/cloud/cloud-init.disabled

# setup touchpad
# https://wiki.archlinux.org/title/Libinput#Enable_the_touchpad_while_typing

# setup backlight
sudo usermod -a -G video ${USER} # add user to video group
sudo nala install brightnessctl

# sound
# wireplumber install guide: https://gist.github.com/the-spyke/2de98b22ff4f978ebf0650c90e82027e?permalink_comment_id=4346694
# wireplumber guide: (fixes bug with alsamixer resetting volume)
# https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/modifying_configuration.html
#
# https://linuxconfig.org/how-to-install-pipewire-on-ubuntu-linux
# NOTE: dont install wirepipe.
# it caused weird journalctl -f errors when ever plugging in new headphones or cloasing the lid 
# and reseting alsamixer to sound level 36??
# just stick with pipewire-media or what ever the name of the alternative is

# network
# if a dock or ethernet dongle does not work
# run `ip link` to check if the device is conected
# then run: `sudo nmcli con add type ethernet ifname enx00e04c683212`
# to see it show up in ifconfig

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip -P ~/.fonts/
unzip ~/.fonts/JetBrainsMono.zip

#nvim
# random issue with jetbrains autocopy on selection https://intellij-support.jetbrains.com/hc/en-us/community/posts/360004165300/comments/14734331884946
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

# appimagelauncher
sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher

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

# Thunderbird date fix
# https://www.reddit.com/r/Thunderbird/comments/rxo0lc/change_how_time_is_displayed/

# to set horizontal as default for autorandr
#cd ~/.config/autorandr
#ln -s horizontal default
#
#idk some random thing on the wiki
#sudo touch /etc/modprobe.d/nvidia-drm-modeset.conf
#echo "options nvidia_drm modeset=1" >/etc/modprobe.d/nvidia-drm-modeset.conf

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

# in about:config set accessibility.force_disabled to 1

#==============================
##Theming
#guide: https://itsfoss.com/i3-customization/#change-theme-and-icons-in-the-i3-window-manager

# gtk theme
wget https://github.com/catppuccin/gtk/releases/download/v0.6.0/Catppuccin-Frappe-Standard-Maroon-Dark.zip -P ~/.themes/
unzip ~/.themes/Catppuccin-Frappe-Standard-Maroon-Dark.zip
# fix for gtk errors
sudo apt install gtk2-engines-pixbuf gnome-themes-standard gtk2-engines-murrine

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

## DOCK: to get the thinkpad dock to work with ubuntu
# https://www.synaptics.com/products/displaylink-graphics/downloads/ubuntu
#
# sudo apt install ./Downloads/synaptics-repository-keyring.deb
# sudo apt update
# sudo apt install displaylink-driver

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

#---set date and time to autosync with the internet---
timedatectl set-ntp true

echo "follow this guide for rose vpn: https://wiki.rhlug.org/index.php/Accessing_the_Off-Campus_VPN"

echo "=========================================================================================="
echo "---Installation completed---"
echo "REMEMBER TO CHECK xrandr"
echo "THE AOC MONITOR NEEDS TO RUN AT 144 TO NOT HAVE SCREEN TEARING"
echo "also set autorandr --default <setup>"

