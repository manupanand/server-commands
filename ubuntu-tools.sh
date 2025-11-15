#!/bin/bash
# 
# Ubuntu tools
sudo apt install -y nmap

sudo apt install -y netcat-openbsd

sudo apt install -y wireshark
sudo usermod -aG wireshark $USER

sudo apt install -y aircrack-ng

sudo apt install -y hydra

sudo apt install -y john

sudo apt install -y nikto


sudo apt install -y sqlmap

sudo apt install -y fern-wifi-cracker
sudo apt install -y recon-ng
sudo apt install -y zaproxy
sudo apt install -y beef-xss
sudo apt install -y burpsuite

curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfinstall | sudo bash
