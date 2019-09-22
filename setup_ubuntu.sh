#!/bin/bash

#Important tools:
#Install chrome, vscode, vivaldi
sudo apt install -y emacs zsh zsh-doc git guake #gitk tig   #emacs24-nox xcalib byobu
sudo apt install -y curl wget nmap whois encfs openssh-server gparted #luckybackup
sudo apt install -y autoconf automake libtool cmake


#Link files
cd dotfiles; ./linkfiles_ubuntu.sh; cd ..;

#Install oh-my-zsh (Run from shell folder)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/sahil87/oh-my-zsh/master/tools/install.sh)"
source ./setup/setup_zshrc.sh
chsh -s /bin/zsh