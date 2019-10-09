#!/usr/bin/env bash

mkdir -p './out/'

if [[ ! -f './out/moodle/moodle-source.zip' ]]; then
    mkdir -p 'out/moodle/'
    curl https://ayera.dl.sourceforge.net/project/moodle/Moodle/stable37/moodle-latest-37.zip > ./out/moodle/moodle-source.zip
fi

if [[ ! -f './out/osu/osu-source.zip' ]]; then
    mkdir -p 'out/osu/'
    curl https://ayera.dl.sourceforge.net/project/osu.mirror/2019.930.0/2019.930.0.zip > ./out/osu/osu-source.zip
fi

if [[ ! -f './out/qbittorrent/qbittorrent-source.tar.xz' ]]; then
    mkdir -p 'out/qbittorrent/'
    curl https://managedway.dl.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.1.5/qbittorrent-4.1.5.tar.xz > ./out/qbittorrent/qbittorrent-source.tar.xz
fi

