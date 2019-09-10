#!/usr/bin/env bash

if [[ ! -f "~/Downloads/rapidminer-studio.zip" ]]; then
  echo 'Downloading rapidminer studio...'
  curl -s https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio.zip --output rapidminer-studio.zip
fi
