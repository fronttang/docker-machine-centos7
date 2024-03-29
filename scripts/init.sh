#!/bin/bash

# initialise variables

INSTALL_DOCKER_VERSION=1.11
INSTALL_DOCKER_COMPOSE=1.24.1

##############################################################
# install package etc
##############################################################

# net-tools required for docker-machine provision to work
# otherwise get error "Error running SSH command: exit status 127"
# see https://github.com/docker/machine/issues/2480
sudo yum -y install git wget curl net-tools

# json query
wget -q https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64
chmod +x jq-linux64

source /vagrant/scripts/docker-engine.sh
source /vagrant/scripts/docker-compose.sh
# source /vagrant/scripts/oh-my-zsh.sh
