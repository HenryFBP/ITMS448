#!/usr/bin/env bash

inotifywait -r -m -e modify paper.md |
  while read path _ file; do
    echo "Building pdf..."
    pandoc -s -o hpost-aug-28-paper.out.pdf paper.md
  done
