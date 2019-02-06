#!/bin/bash

# Cody Adams
# Learning Exercise
# 11/17/2018
# This bash script adds conjure-up to an Ubuntu host and uses it to deploy a single OpenStack node

if [ "$1" == "-h" ] || [ -z "$1" ] || [ -v $CONJURE_DEMO_LXD_INIT_PATH ]; then
  echo "Usage: `basename $0` REQUIRED ENVARS: CONJURE_DEMO_LXD_INIT_PATH (to "lxd-init_preseed.yaml"), `basename $0` -install to install"
  exit 0
fi

if [ "$1" == "-install" ]; then

  echo "conjure-up requires lxd, installing that in a 'snap'"
  snap install lxd

  echo "It is recommended to migrate away from the deb lxd packaging"
  lxd.migrate --preseed "$CONJURE_DEMO_LXD_INIT_PATH\lxd-init_preseed.yaml"

  echo "Installing conjure-up!"
  snap install conjure-up --classic

  exit 0
fi