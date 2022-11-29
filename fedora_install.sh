sudo dnf upgrade
sudo dnf install git make curl
git clone https://github.com/agmui/dotFiles.git

# i3-gaps
sudo dnf install i3-gaps
#add rounded corners
#git clone https://github.com/terroo/i3-radius
#cd i3-radius && sh build.sh
#cd ..
#rm -rf i3-radius

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
echo "still need to manualy run autorandr -s <name>
then 
1. place this script (or better symlink it from autorandr location)
    to ~/.config/autorandr/postswitch
 2. run "nitrogen" and set wallpapers for current profile as you wish
 3. run ~/.config/autorandr/postswitch savebg
 4. repeat steps 2-3 for any profile you wish"

# maybe install pulseaudio or pipewire-pulseaudio
#TODO:
# rofi
# xbacklight
# custom notifications
# howdy
# low battery manager i.e. hibernation and lowpower mode
# custorm start ff page
# audio visuliser
# video wall paper
# rounded corners
# picom

#ZSH or fish
sudo dnf install fish 
# set as default shell
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
#Fisher plugins
cp ~/dotfiles/fish/ ~/.configs
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
#TODO add fzf to vim

# dunst
sudo dnf install dunst
cp -r ~/dotfiles/dunst ~/.config/dunst

# vscode
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf update
sudo dnf install code
echo remember to sign in with github acc
