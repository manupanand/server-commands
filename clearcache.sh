
#!/bin/bash

# Delete Firefox and Chrome cache
rm -rf ~/.mozilla/firefox/*.default-release/cache2/*
rm -rf ~/.cache/mozilla/firefox/*.default-release/*
rm -rf ~/.cache/google-chrome/Default/Cache/*
rm -rf ~/.cache/thumbnails/*

# APT cleanup (review autoremove first!)
sudo apt clean
sudo apt autoclean
sudo apt autoremove --dry-run

# Free RAM (safe but not usually needed)
sudo sync && sudo sysctl -w vm.drop_caches=3

# Cautious swap reset (optional)
# Comment this out if your system has low RAM
# sudo swapoff -a && sudo swapon -a

# Restart DNS resolver (only if using systemd-resolved)
if systemctl is-active --quiet systemd-resolved; then
    sudo systemctl restart systemd-resolved
fi
