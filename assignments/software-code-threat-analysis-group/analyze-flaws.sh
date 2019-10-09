#!/usr/bin/env bash

mkdir -p analysis/flawfinder
mkdir -p analysis/cppcheck

echo "flawfinder for qbittorrent"
flawfinder out/qbittorrent/ > analysis/flawfinder/qbittorrent-report.txt 2>&1

echo "flawfinder for dosbox"
flawfinder out/dosbox/ > analysis/flawfinder/dosbox-report.txt 2>&1

echo "flawfinder for gnucash"
flawfinder out/gnucash/ > analysis/flawfinder/gnucash-report.txt 2>&1

echo "cppcheck for qbittorrent"
cppcheck -q --force out/qbittorrent/ > analysis/cppcheck/qbittorrent-report.txt 2>&1

echo "cppcheck for dosbox"
cppcheck -q --force out/dosbox/ > analysis/cppcheck/dosbox-report.txt 2>&1

echo "cppcheck for gnucash"
cppcheck -q --force out/gnucash/ > analysis/cppcheck/gnucash-report.txt 2>&1