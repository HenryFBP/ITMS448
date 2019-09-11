#!/usr/bin/env bash

# This script sets up UFW and enables restrictive firewall settings.

# Install UFW
if hash ufw 2>/dev/null; then
  echo "ufw is installed."
else
  echo "ufw is not installed. Installing."

  if hash apt 2>/dev/null; then
    sudo apt install ufw -y
  elif hash yum 2>/dev/null; then
    sudo yum install ufw -y
  else
    echo "It is unknown what package manager you use. Install ufw yourself."
    exit 1
  fi

fi


# Reset all rules.
yes | sudo ufw reset

# No incoming connections are allowed by default.
sudo ufw default deny incoming

# No outgoing connections are allowed by default.
sudo ufw default deny outgoing

# Allow HTTPS
sudo ufw allow 443

# Allow HTTP
sudo ufw allow 80

# Allow FTP
sudo ufw allow 21

# Allow from subnet on my network
sudo ufw allow from 10.0.0.0/24

# Allow UDP on a port range
sudo ufw allow 5000:5100/udp

# Allow some specific IP to SSH into our system
sudo ufw allow from 192.0.2.0 to any port 22

# Enable the firewall.
sudo ufw enable

# Show the firewall status
sudo ufw status

# Disable it as I don't want these rules to actually be used
sudo ufw disable 2>/dev/null 1>/dev/null