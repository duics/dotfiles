#!/bin/bash
sudo apt update && sudo apt upgrade

# Install devel packages
sudo apt install build-essential python-dev libclang-dev git

# Install fish
sudo apt install fish
chsh -s `which fish`

# Install other packages
sudo apt install qbittorrent redshift-gtk mpv
