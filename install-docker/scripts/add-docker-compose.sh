#!/bin/bash

# Cody Adams
# Learning Exercise
# 10/28/2018
# This bash script adds docker-compose to a CentOS docker host

if [ "$1" == "-h" ] || [ -z "$1" ]; then
  echo "Usage: `basename $0` -install to install"
  exit 0
fi

if [ "$1" == "-install" ]; then

  echo "epel means Extra Packages for Enterprise Linux.  heh."
  
  yum install -y epel-release

  echo "some blog told me I need pip.  hrm, okay, suppose I'll take those python dependencies and update them"
  yum install -y python-pip
  yum upgrade python

  echo "Installing latest docker-compose"
  pip install docker-compose

  echo "Installed docker-compose version:"
  docker-compose version

  echo "Hello, World! :)"
  cat > docker-compose-hello-world.yaml <<EOL
    line1, version: '2'
    line2, hello_world:
    line3, image: ubuntu
    line4, command: [/bin/echo, 'Hello World']
EOL

  docker-compose build docker-compose-hello-world.yaml

  exit 0
fi