#!/bin/bash

RC_FILE=~/.bashrc
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR=`realpath $CURRENT_DIR/..`

if [ -f $RC_FILE ] && grep "my_bashrc.sh #v1.1" $RC_FILE
  then echo "bashrc all good."
  else
    set -x
    echo "source $PARENT_DIR/bash/my_bashrc.sh #v1.1" >> $RC_FILE
fi