#!/bin/sh
#set -x

# chmod 600 config/pgadmin4/pgpassfile

if [ -z $1 ]
then
  COMMAND="bash --init-file .bashinit"
else
  COMMAND="${@}"
fi

./fab/sh/docker_network_create.sh

PROJECT_FOLDER=`git rev-parse --show-toplevel`
export PROJECT_NAME=$(basename $PROJECT_FOLDER)
cd $PROJECT_FOLDER

docker-compose \
  -f fab/d/docker-compose.yaml \
  -p $PROJECT_NAME \
  --project-directory . \
  ps | grep $PROJECT_NAME > /dev/null
#$? is 0 if already running, 1 if not (0=no error)
ALREADY_RUNNING=$?

if [ "$ALREADY_RUNNING" -eq 0 ];
then
  echo "Service already running, only opening shell"
else
  docker-compose \
    -f fab/d/docker-compose.yaml \
    --project-name $PROJECT_NAME \
    --project-directory . \
    up -d
fi

echo "Connecting to docker shell and running command $COMMAND..."
docker-compose \
  -f fab/d/docker-compose.yaml \
  --project-name $PROJECT_NAME \
  --project-directory . \
  exec $PROJECT_NAME $COMMAND
