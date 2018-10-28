#!/bin/bash

# Cody Adams
# Learning Exercise
# 10/28/2018
# This bash script installs docker-ce on CentOS 7

YUMMY_DOCKER=https://download.docker.com/linux/centos/docker-ce.repo

if [ "$1" == "-h" ] || [ -z "$1" ] || [ -v $YUMMY_DOCKER ]; then
  echo "Usage: `basename $0` REQUIRED ENVARS: YUMMY_DOCKER, `basename $0` -install to install"
  exit 0
fi

if [ "$1" == "-install" ]; then

echo "Using yum repo source: " $YUMMY_DOCKER

echo "Starting Pre-Install"

echo "Adding yum-utils"

yum install -y yum-utils \
        device-mapper-persistent-date \
        lvm2;

echo "Installing latest docker-ce"

yum install -y docker-ce

echo "Installed docker-ce version:"

docker version

echo "Starting docker-ce" $(docker version)

systemctl start docker

echo "Hello, World! :)"

docker run hello-world

exit 0

fi