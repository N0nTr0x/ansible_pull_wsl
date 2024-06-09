#!/bin/bash

# Update package lists (assuming Debian/Ubuntu)
echo "Updating package lists..."
sudo apt update

# Install required packages
echo "Installing ansible and git..."
sudo apt install ansible git --install-suggests -y

# Pull the Ansible repository from the repository
echo "Pulling the Ansible repository..."
/home/$USER/.local/bin/ansible-pull -U https://github.com/N0nTr0x/ansible_pull_wsl.git

echo "Done."
