#!/bin/bash

set -e

# this script will be used as a startup script for Terraform to install Docker on a Ubuntu server

# install necessary packages
echo "Installing necessary packages..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# adding Docker's GPG key for a secure installation:
echo "Fetching GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# adding Docker repository to sources.list:
echo "Adding Docker repository..."
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# updating package index:
echo "Updating package index..."
sudo apt-get update

# installing Docker packages:
echo "Installing Docker packages: "
sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io

echo "==End of script=="

