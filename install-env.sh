#!/bin/bash

DOKKU_VERSION=v0.25.1

# SWAP
fallocate -l 4G /swapfile
chown root:root /swapfile
chmod 0600 /swapfile
mkswap /swapfile
swapon /swapfile
echo /swapfile none swap sw 0 0 >> /etc/fstab
echo vm.swappiness = 10 | tee -a /etc/sysctl.conf
echo vm.vfs_cache_pressure = 50 | tee -a /etc/sysctl.conf
sysctl -p
# /SWAP

ssh-keygen -t rsa
apt-get update
apt-get install bash-completion htop git make mysql-client
(cd /tmp && git clone --depth 1 https://github.com/twolfson/sexy-bash-prompt && cd sexy-bash-prompt && make install) && source ~/.bashrc

# Dokku
wget https://raw.githubusercontent.com/dokku/dokku/$DOKKU_VERSION/bootstrap.sh
DOKKU_TAG=$DOKKU_VERSION bash bootstrap.sh
# /Dokku
