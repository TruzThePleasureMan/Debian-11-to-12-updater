#!/bin/bash

# Check if sudo is installed
if ! command -v sudo &> /dev/null; then
  echo "sudo is not installed. Installing sudo..."
  su -c "apt-get update -y && apt-get install -y sudo"
fi

# Set debconf selections
echo '* libraries/restart-without-asking boolean true' | sudo debconf-set-selections


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

# Configure openssh-server
sudo dpkg-reconfigure -f noninteractive openssh-server

# Start upgrade
sudo apt full-upgrade -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confmiss"

# Reboot into Debian 12
sudo systemctl reboot