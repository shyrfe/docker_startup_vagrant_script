#!/bin/bash

projectname="tstproject"

Update () {
    echo "-- Update packages --"
    sudo apt-get update
    sudo yes Y | apt-get upgrade
}
Update

#export DEBIAN_FRONTEND=noninteractive

# export LANGUAGE=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# locale-gen en_US.UTF-8
# dpkg-reconfigure locales

echo "-- Install packages to allow apt to use a repository over HTTPS --"
sudo yes Y | apt-get install apt-transport-https ca-certificates 
sudo yes Y | apt-get install curl gnupg-agent software-properties-common

echo "-- Add Docker’s official GPG key --"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

echo "-- Add Docker rep --"
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

Update

echo "-- Install Docker --"
sudo yes Y | apt-get install docker
echo "-- Install Docker compose --"
sudo yes Y | apt-get install docker-compose
echo "-- Congratulations! --"
