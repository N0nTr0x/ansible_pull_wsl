#!/bin/bash

# Update package lists (assuming Debian/Ubuntu)
echo "Updating package lists..."
sudo apt update

# Install required packages
echo "Installing ansible and git..."
sudo apt install ansible git -y

# Pull the Ansible repository from the repository
echo "Pulling the Ansible repository..."
ansible-pull -U https://github.com/N0nTr0x/ansible_pull_wsl.git

echo "Done."
