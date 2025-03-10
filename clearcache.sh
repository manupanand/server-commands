#!/bin/bash
#delete firefox cache 
rm -rf ~/.mozilla/firefox/*.default-release/cache2/*
rm -rf ~/.cache/mozilla/firefox/*.default-release/*

# remove apt
sudo apt clean
sudo apt autoclean
sudo apt autoremove
#free ram
free -h
sudo sync && sudo sysctl -w vm.drop_caches=3
sudo swapoff -a && sudo swapon -a
rm -rf ~/.cache/thumbnails/*
rm -rf ~/.cache/google-chrome/Default/Cache/*
sudo systemctl restart systemd-resolved

