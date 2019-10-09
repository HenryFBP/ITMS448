#!/usr/bin/env bash

mkdir -p analysis/flawfinder
mkdir -p analysis/cppcheck

flawfinder out/qbittorrent/ > analysis/flawfinder/qbittorrent-report.txt
flawfinder out/dosbox/ > analysis/flawfinder/dosbox-report.txt
flawfinder out/gnucash/ > analysis/flawfinder/gnucash-report.txt
