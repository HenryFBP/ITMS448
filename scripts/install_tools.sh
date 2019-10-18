#!/usr/bin/env bash

# https://medium.com/@airman604/installing-docker-in-kali-linux-2017-1-fbaa4d1447fe
if ! hash docker 2> /dev/null; then

    sudo apt-get install -y \
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

sudo apt install -y thunderbird kleopatra
