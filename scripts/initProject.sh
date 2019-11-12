#!/bin/bash

mkdir -p $PWD/fab/{d,sh}

# move all the scripts
cp $MISSIONCONTROL/scripts/proj_sh_scripts/* $PWD/fab/sh/
# make all executable
chmod +x $PWD/fab/sh/*

mv $PWD/fab/sh/{sd,std} $PWD/

touch $PWD/fab/d/{base.Dockerfile,docker-compose.yaml}

touch $PWD/{.gitignore,.dockerignore,README.md}

mkdir -p $PWD/src

git init

git add -A; git commit -m "inital commit";