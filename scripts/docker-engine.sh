#!/bin/bash

set -x

echo '=============================================================='
echo '================= Install Docker Engine ======================'
echo '=============================================================='

# https://docs.docker.com/cs-engine/1.13/
# https://docs.docker.com/cs-engine/1.12/install/

# install docker cs
# sudo rpm --import "https://pgp.mit.edu/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e"
sudo yum remove -y docker docker-common docker-selinux docker-engine
sudo rpm --import "https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e"
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
sudo yum install docker-ce -y

# start docker service
sudo systemctl enable docker.service
sudo service docker start

#  allow vagrant user to run docker commands
sudo usermod -a -G docker vagrant
sudo chown -R vagrant:root /var/lib/docker/
sudo chown -R vagrant:root /etc/docker/

sudo docker info
sudo docker version
