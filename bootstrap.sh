#!/bin/bash

# Update package lists (assuming Debian/Ubuntu)
sudo apt update

# Install required packages (pipx and git) silently
sudo apt install -y pipx git

# Install Ansible with dependencies through pipx
pipx install --include-deps ansible

# Ensure pipx paths are added to the environment
pipx ensurepath

# Pull the Ansible repository from the repository
/home/wotan/.local/bin/ansible-pull -U https://github.com/N0nTr0x/ansible_pull_wsl.git
