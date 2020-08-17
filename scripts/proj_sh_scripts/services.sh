#!/bin/bash

# PROJECT_FOLDER=`git rev-parse --show-toplevel`
# export PROJECT_NAME=$(basename $PROJECT_FOLDER)
# cd $PROJECT_FOLDER


DOCKER_NETWORK_NAME=abfDatabases
PROJECT_NAME=abf_databases

networkCreate(){
  #Externalizing the network creation step allows multiple docker composes to independently connect
  #to the same network without worrying about start order


  docker network ls | grep $DOCKER_NETWORK_NAME > /dev/null
  #0 if already exists, 1 if doesn't exist (0=no error)
  NETWORK_EXISTS=$?

  if [ "$NETWORK_EXISTS" -eq 0 ];
  then
    echo "Network exists"
  else
    echo "Creating docker network $DOCKER_NETWORK_NAME...."
    docker network create --attachable $DOCKER_NETWORK_NAME
  fi

}


turnon(){
  
  networkCreate
  
  docker-compose \
  -f fab/d/docker-compose.yaml \
  -p $PROJECT_NAME \
  --project-directory . \
  ps | grep $PROJECT_NAME > /dev/null
  #$? is 0 if already running, 1 if not (0=no error)
  ALREADY_RUNNING=$?

  if [ "$ALREADY_RUNNING" -eq 0 ];
    then
      echo "Service already running..."
  else
    docker-compose \
      -f fab/d/docker-compose.yaml \
      --project-name $PROJECT_NAME \
      up -d
  fi

}


turnoff(){
  docker-compose \
    -f fab/d/docker-compose.yaml \
    --project-name $PROJECT_NAME \
    --project-directory . \
    down

}

main(){
  
  if [[ $1 == "up" ]]; then
    echo "Spinning up dockers"
    turnon
  fi

  if [[ $1 == "down" ]]; then
    echo "spinning off dockers"
    turnoff
  fi

}

main $1