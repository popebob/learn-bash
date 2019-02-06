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
  sudo pip install --upgrade pip

  echo "Installing latest docker-compose"
  pip install docker-compose

  echo "Installed docker-compose version:"
  docker-compose version

  # To-do: add Hello World for docker-compose

  exit 0
fi
