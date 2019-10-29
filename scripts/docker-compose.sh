#!/bin/bash

set -x

echo '=============================================================='
echo '================= Install Docker Compose ======================'
echo '=============================================================='

mkdir -p /home/vagrant/install-docker-compose
cd /home/vagrant/install-docker-compose

sudo curl -L "https://github.com/docker/compose/releases/download/${INSTALL_DOCKER_COMPOSE}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chown root:docker /usr/bin/docker-compose
