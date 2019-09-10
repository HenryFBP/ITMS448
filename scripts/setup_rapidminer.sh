#!/usr/bin/env bash

RAPIDMINER_URL="https://releases.rapidminer.com/latest/rapidminer-studio/rapidminer-studio.zip"
RAPIDMINER_FILEPATH="/home/vagrant/Downloads/rapidminer-studio.zip"
RAPIDMINER_FOLDER="/home/vagrant/rapidminer-studio/"

# Download rapidminer
if [ ! -f "$RAPIDMINER_FILEPATH" ]; then
  echo 'Downloading rapidminer studio...'
  mkdir -p /home/vagrant/Downloads
  curl -s "$RAPIDMINER_URL" --output "$RAPIDMINER_FILEPATH"
fi

# Extract rapidminer studio
if [ ! -d "$RAPIDMINER_FOLDER" ]; then
  echo "Extracting rapidminer studio..."
  unzip "$RAPIDMINER_FILEPATH" -d "$RAPIDMINER_FOLDER"
fi

#Rapidminer studio must use Java 8!
java_version=$(java --version)
if ! [[ $java_version =~ 1.8.0 ]]; then
  echo "Your default java version is not Java 8."
  echo "It must be for RapidMiner studio to work."

  echo "Uninstalling OpenJDK 11/10/9..."
  sudo apt remove openjdk-11* openjdk-10* openjdk-9* -y

  java8_location=$(sudo update-java-alternatives --list 2>/dev/null | grep 1.8.0 | awk '{print $3}')

  echo "Using Java 8 at '${java8_location}'..."

fi
