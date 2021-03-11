#!/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# arg1 = path of dotfile
# arg2 = target path
# arg3 = use sudo 0: no, 1: yes
function linkfile() {
    local SOURCE=$1
    local DEST=$2
    local SUDO=$3
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    echo "Now applying: $DIR/$SOURCE"
    if (( $SUDO ))
    then
        [ -f $DEST -o -L $DEST ] && sudo rm $DEST
        [ -d $DEST ] && sudo rmdir $DEST
        sudo ln -s $DIR/$SOURCE $DEST
    else
        [ -f $DEST -o -L $DEST ] && rm $DEST
        [ -d $DEST ] && rmdir $DEST
        ln -s $DIR/$SOURCE $DEST
    fi
}


# WARNING: due to certain path based bugs, please run this from the root directory
# ie from ./dotfiles/linkfiles.sh

linkfile dotfiles/git/gitconfig             ~/.gitconfig                            0
linkfile dotfiles/tmux/tmux.conf            ~/.tmux.conf                            0


case `uname` in
  Darwin)
    # commands for OS X go here
    linkfile dotfiles/ssh/config_mac                ~/.ssh/config                           0
  ;;
  Linux)
    # commands for Linux go here
    linkfile dotfiles/ssh/config_linux                ~/.ssh/config                           0
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac