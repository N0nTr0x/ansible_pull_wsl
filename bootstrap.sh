#!/bin/bash

# Update package lists (assuming Debian/Ubuntu)
echo "Updating package lists..."
sudo apt update

# Install required packages
echo "Installing ansible..."
sudo apt install ansible --install-suggests -y 

echo "Done."
