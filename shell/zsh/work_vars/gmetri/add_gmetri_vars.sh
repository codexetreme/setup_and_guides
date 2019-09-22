#!/bin/bash

RC_FILE=~/.zshrc
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PARENT_DIR=`realpath $CURRENT_DIR/..`

SCRIPT_NAME="gmetri.sh"

if [ -f $RC_FILE ] && grep "${SCRIPT_NAME} #v1.1" $RC_FILE
  then echo "zrc all good."
  else
    set -x
    echo "source $CURRENT_DIR/${SCRIPT_NAME} #v1.1" >> $RC_FILE
fi