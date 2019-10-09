#!/usr/bin/env bash

mkdir -p './out/'

if [[ ! -f './out/moodle/moodle-source.zip' ]]; then
    mkdir -p 'out/moodle/'
    pushd 'out/moodle'
    curl https://ayera.dl.sourceforge.net/project/moodle/Moodle/stable37/moodle-latest-37.zip > ./moodle-source.zip
    unzip ./moodle-source.zip
    popd
fi

if [[ ! -f './out/osu/osu-source.zip' ]]; then
    mkdir -p 'out/osu/'
    pushd 'out/osu'
    curl https://ayera.dl.sourceforge.net/project/osu.mirror/2019.930.0/2019.930.0.zip > ./osu-source.zip
    unzip ./osu-source.zip
    popd
fi

if [[ ! -f './out/qbittorrent/qbittorrent-source.tar.xz' ]]; then
    mkdir -p 'out/qbittorrent/'
    pushd 'out/qbittorrent/'
    curl https://managedway.dl.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.1.5/qbittorrent-4.1.5.tar.xz > ./qbittorrent-source.tar.xz
    tar -xf ./qbittorrent-source.tar.xz
    popd
fi

