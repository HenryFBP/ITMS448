# Software Code Threat Analysis

Team Takyon

## Software Analyzed

I analyzed [DosBox](https://ufpr.dl.sourceforge.net/project/dosbox/dosbox/0.74-3/dosbox-0.74-3.tar.gz), 
[GNUCash](https://ufpr.dl.sourceforge.net/project/gnucash/gnucash%20%28stable%29/3.7/gnucash-3.7.tar.bz2),
 and [qBittorrent](https://managedway.dl.sourceforge.net/project/qbittorrent/qbittorrent/qbittorrent-4.1.5/qbittorrent-4.1.5.tar.xz).

All of these programs are written in C/C++.

## Tools used

I used [cppcheck](http://cppcheck.sourceforge.net/) and
[flawfinder](https://dwheeler.com/flawfinder/) to analyze the software.

I wanted to compare and contrast the different findings between these two tools.

## Findings

### cppcheck

It looks like `cppcheck` is frequently incorrect about vulnerabilties, and might not actually know how to parse C++ code
 correctly.

