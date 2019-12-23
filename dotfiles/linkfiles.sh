#!/bin/zsh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
function linkfile() {
    local SOURCE=$1
    local DEST=$2
    local SUDO=$3
    DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    echo $DIR/$SOURCE
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

#linkfile custom-apps-menu/applications-override.json  ~/.local/share/cinnamon/applets/custom-apps-menu@sahil87/applications-override.json                        0
linkfile dotfiles/git/gitconfig             ~/.gitconfig                            0
linkfile dotfiles/i3/i3Config               ~/.config/i3/config                     0
linkfile dotfiles/imwheel/imwheelrc.sh      ~/.imwheelrc                            0
linkfile dotfiles/tmux/tmux.conf            ~/.tmux.conf                            0

sudo cp $DIR/dotfiles/i3/touchpad /etc/X11/xorg.conf.d/90-touchpad.conf