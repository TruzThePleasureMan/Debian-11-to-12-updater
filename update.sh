#!/bin/bash

# Update Debian 11
sudo apt update -y 
sudo apt upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confmiss"
sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confmiss"
sudo apt autoremove -y

# Backup APT source files
sudo cp -v /etc/apt/sources.list "$HOME/"
sudo cp -vr /etc/apt/sources.list.d/ "$HOME/"

# Update sources.list
sudo sed -i 's/bullseye/bookworm/g' /etc/apt/sources.list

# Update sources
sudo apt update -y 

# Start upgrade
sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confmiss"

# Reboot into Debian 12
sudo systemctl reboot