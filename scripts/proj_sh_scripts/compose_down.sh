#!/bin/sh
PROJECT_FOLDER=`git rev-parse --show-toplevel`
export PROJECT_NAME=$(basename $PROJECT_FOLDER)

set -x
cd $PROJECT_FOLDER
docker-compose \
    -f fab/d/docker-compose.yaml \
    --project-name $PROJECT_NAME \
    --project-directory . \
    down
