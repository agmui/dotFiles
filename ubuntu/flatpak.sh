#!/bin/bash

#Flatpak
yes | sudo nala install flatpak
#add repositories 
yes | flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
yes | flatpak update
#Creativity
# flatpak install flathub org.blender.Blender
# flatpak install flathub org.ardour.Ardour
# flatpak install flathub org.kde.krita
#Social
# flatpak install flathub com.slack.Slack
yes | flatpak install flathub com.discordapp.Discord
#Game
# flatpak install flathub com.valvesoftware.Steam
# flatpak install flathub com.obsproject.Studio
