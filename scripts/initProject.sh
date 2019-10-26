#!/bin/bash

mkdir -p $PWD/fab/{d,sh}

touch $PWD/fab/d/{base.Dockerfile,docker-compose.yaml}

touch $PWD/{.gitignore,.dockerignore,README.md}


git init

git add -A; git commit -m "inital commit";