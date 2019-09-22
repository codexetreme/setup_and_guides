#!/bin/bash

#Important tools:
#Install chrome, vscode, vivaldi
sudo apt install -y vim zsh zsh-doc git guake #gitk tig   #emacs24-nox xcalib byobu
sudo apt install -y curl wget nmap whois openssh-server gparted #luckybackup
sudo apt install -y autoconf automake libtool cmake


#Link files
cd dotfiles; ./linkfiles.sh; cd ..;

#Install oh-my-zsh (Run from shell folder)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
source ./shell/setup/setup_zsh.sh
chsh -s /bin/zsh

# make a bin directory which is included in the path
mkdir -p /home/${USER}/bin

# make additional directories
mkdir -p /home/${USER}/src

