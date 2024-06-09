#!/bin/bash

# Define colors for better visibility
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print a separator
print_separator() {
    echo -e "${YELLOW}-------------------------------------------------${NC}"
}

# Update package lists (assuming Debian/Ubuntu)
print_separator
echo -e "${BLUE}Updating package lists...${NC}"
if sudo apt update; then
    echo -e "${GREEN}Package lists updated successfully.${NC}"
else
    echo -e "${RED}Failed to update package lists.${NC}" >&2
    exit 1
fi

# Install required packages
print_separator
echo -e "${BLUE}Installing ansible and git...${NC}"
if sudo apt install ansible git -y; then
    echo -e "${GREEN}Ansible and git installed successfully.${NC}"
else
    echo -e "${RED}Failed to install ansible and git.${NC}" >&2
    exit 1
fi

# Pull the Ansible repository from the repository
print_separator
echo -e "${BLUE}Pulling the Ansible repository...${NC}"
if ansible-pull -U https://github.com/N0nTr0x/ansible_pull_wsl.git; then
    echo -e "${GREEN}Ansible repository pulled successfully.${NC}"
else
    echo -e "${RED}Failed to pull the Ansible repository.${NC}" >&2
    exit 1
fi

print_separator
echo -e "${YELLOW}Done.${NC}"
