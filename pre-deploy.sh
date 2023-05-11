#!/bin/bash

echo '------------------ Starting Pre-Install ------------------'

# Install required dependencies
yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
yes | sudo apt install docker-ce

echo 'Stopping already running containers'
# make sure demo docker is not running
sudo docker rm $(sudo docker stop $(sudo docker ps -a -q --filter ancestor=demo:latest --format="{{.ID}}"))

echo '------------------ Completed Pre-Install ------------------'