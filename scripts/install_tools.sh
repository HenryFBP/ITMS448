#!/usr/bin/env bash

if ! hash docker 2> /dev/null; then

    sudo apt-get install  \
 apt-transport-https  \
 ca-certificates  \
 curl  \
 gnupg2  \
 software-properties-common

    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

    echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' > /etc/apt/sources.list.d/docker.list

    sudo apt-get update

    sudo apt-get install -y docker-ce docker-ce-cli containerd.io
fi