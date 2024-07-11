#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
printSuccess(){
  echo -e "${GREEN}$1${NC}"
}
printFail(){
  echo  -e "${RED}$1${NC}"
}
function check(){
if [$? -eq 0]; then
  printSuccess SUCCESS
else
  printFail FAILED
fi
}
# Update package index
echo "Updating package index..."
sudo apt update
check 

# Perform distribution upgrade
echo "Performing distribution upgrade..."
sudo apt dist-upgrade -y
check 
# Install unattended-upgrades package
echo "Installing unattended-upgrades..."
sudo apt install unattended-upgrades -y
check 
# Reconfigure unattended-upgrades with low priority attended upgrade
echo "Reconfiguring unattended-upgrades..."
sudo dpkg-reconfigure --priority=low unattended-upgrades
sudo rm -rf /var/tmp/*
sudo apt-get clean
sudo apt-get autoremove
check 
echo "All steps completed."
