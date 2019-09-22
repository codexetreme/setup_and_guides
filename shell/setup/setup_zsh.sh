#!/bin/bash

RC_FILE=~/.zshrc
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR=`realpath $CURRENT_DIR/..`

if [ -f $RC_FILE ] && grep "my_zshrc.sh #v1.1" $RC_FILE
  then echo "zrc all good."
  else
    set -x
    sed -i '/^source \$ZSH\/oh-my-zsh.sh/s/^/# /' $RC_FILE
    echo "source $PARENT_DIR/zsh/my_zshrc.sh #v1.1" >> $RC_FILE
fi