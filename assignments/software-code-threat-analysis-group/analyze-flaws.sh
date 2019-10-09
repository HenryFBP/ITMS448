#!/usr/bin/env bash

flawfinder out/qbittorrent/ > qbittorrent-report.txt

flawfinder out/dosbox/ > dosbox-report.txt

flawfinder out/gnucash/ > gnucash-report.txt