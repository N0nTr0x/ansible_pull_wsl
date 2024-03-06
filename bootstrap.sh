#!/bin/bash

# Update package lists (assuming Debian/Ubuntu)
echo "Updating package lists..."
sudo apt update

# Install required packages (pipx and git) silently
echo "Installing required packages..."
sudo apt install -y pipx git

# Install Ansible with dependencies through pipx
echo "Installing Ansible with dependencies..."
pipx install --include-deps ansible

# Ensure pipx paths are added to the environment
echo "Ensuring pipx paths are added to the environment..."
pipx ensurepath

# Pull the Ansible repository from the repository
echo "Pulling the Ansible repository..."
/home/wotan/.local/bin/ansible-pull -U https://github.com/N0nTr0x/ansible_pull_wsl.git

echo "Done."
