#!/bin/bash

# Define colors for better visibility
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

LOGFILE="ansible-bootstrap.log"
REPO_URL="https://github.com/N0nTr0x/ansible_pull_wsl.git"

# Function to print a separator
print_separator() {
    echo -e "${YELLOW}-------------------------------------------------${NC}"
}

# Function to show help message
show_help() {
    echo -e "${BLUE}Usage: $0 [-r repository_url]${NC}"
    echo -e "  -r repository_url   Specify the Ansible repository URL"
    echo -e "  -h                  Display this help message"
    exit 0
}

# Function to log and print messages
log_and_print() {
    echo -e "$1" | tee -a $LOGFILE
}

# Parse command-line arguments
while getopts ":r:h" opt; do
    case ${opt} in
        r )
            REPO_URL=$OPTARG
            ;;
        h )
            show_help
            ;;
        \? )
            echo "Invalid option: -$OPTARG" 1>&2
            show_help
            ;;
        : )
            echo "Invalid option: -$OPTARG requires an argument" 1>&2
            show_help
            ;;
    esac
done

# Start logging
echo "Script started at $(date)" > $LOGFILE

# Update package lists (assuming Debian/Ubuntu)
print_separator
log_and_print "${BLUE}Updating package lists...${NC}"
if sudo apt update 2>&1 | tee -a $LOGFILE; then
    log_and_print "${GREEN}Package lists updated successfully.${NC}"
else
    log_and_print "${RED}Failed to update package lists.${NC}"
    exit 1
fi

# Install required packages
print_separator
log_and_print "${BLUE}Installing ansible and git...${NC}"
if sudo apt install ansible git -y 2>&1 | tee -a $LOGFILE; then
    log_and_print "${GREEN}Ansible and git installed successfully.${NC}"
else
    log_and_print "${RED}Failed to install ansible and git.${NC}"
    exit 1
fi

# Pull the Ansible repository from the repository
print_separator
log_and_print "${BLUE}Pulling the Ansible repository from ${REPO_URL}...${NC}"
if ansible-pull -U $REPO_URL 2>&1 | tee -a $LOGFILE; then
    log_and_print "${GREEN}Ansible repository pulled successfully.${NC}"
else
    log_and_print "${RED}Failed to pull the Ansible repository.${NC}"
    exit 1
fi

print_separator
log_and_print "${YELLOW}Done.${NC}"
echo "Script ended at $(date)" >> $LOGFILE

# Display summary report
print_separator
echo -e "${BLUE}Summary Report:${NC}"
echo -e "Log file: $LOGFILE"
echo -e "${YELLOW}Done.${NC}"
