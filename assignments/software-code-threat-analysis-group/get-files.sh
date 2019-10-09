#!/usr/bin/env bash

mkdir -p './out/'

if [[ ! -f './out/gnucash/gnucash-source.zip' ]]; then
    mkdir -p 'out/gnucash/'
    pushd 'out/gnucash'
    curl https://ufpr.dl.sourceforge.net/project/gnucash/gnucash%20%28stable%29/3.7/gnucash-3.7.tar.bz2 > gnucash-source.tar.bz2
    tar -xf gnucash-source.tar.bz2
    ls
    popd
fi

if [[ ! -f './out/dosbox/dosbox-source.tar.gz' ]]; then
    mkdir -p 'out/dosbox/'
    pushd 'out/dosbox'
    curl https://ufpr.dl.sourceforge.net/project/dosbox/dosbox/0.74-3/dosbox-0.74-3.tar.gz > dosbox-source.tar.gz
    tar -xf dosbox-source.tar.gz
    ls
    popd
fi

if [[ ! -f './out/qbittorrent/qbittorrent-source.tar.xz' ]]; then
    mkdir -p 'out/qbittorrent/'
    pushd 'out/qbittorrent/'
    curl https://managedway.dl.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.1.5/qbittorrent-4.1.5.tar.xz > qbittorrent-source.tar.xz
    tar -xf qbittorrent-source.tar.xz
    ls
    popd
fi

