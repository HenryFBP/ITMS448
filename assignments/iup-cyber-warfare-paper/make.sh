#!/usr/bin/env bash

output_name="`cat paper_name`"
paper_source_file="paper.md"

function generate_paper {
  echo "Building pdf..."
  pandoc -s -o $output_name $paper_source_file
}

# Generate paper no matter what once.
generate_paper

# If the paper file is modified, generate it.
inotifywait --monitor --event modify $paper_source_file |
  while read path _ file; do
    generate_paper
  done
