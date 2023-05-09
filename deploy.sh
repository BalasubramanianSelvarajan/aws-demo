#!/bin/bash

echo 'Starting to Deploy...'

# Install required dependencies
echo 'Installing openjdk17...'
yes | sudo apt install openjdk-17-jdk
echo 'Installing apt-transport...'
yes | sudo apt install apt-transport-https ca-certificates curl software-properties-common
yes | curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
echo 'Installing docker-ce...'
yes | sudo apt install docker-ce

echo 'Stopping already running containers'
# make sure demo docker is not running
sudo docker rm $(sudo docker stop $(sudo docker ps -a -q --filter ancestor=demo:latest --format="{{.ID}}"))

echo 'Building dockerfile'
# build dockerfile
sudo docker build -f Dockerfile -t demo:latest .

echo 'Docker run'
# run in detached mode
sudo docker run -p 8080:8080 -d demo:latest

echo 'Deployment completed successfully'