#!/bin/bash

# -----------------------------------------------------------------------------
# Wazuh SIEM Manager Fully Automated Deployment Script for Kali Linux
# Author: Toriqul Islam (Student ID: 2023200500078)
# -----------------------------------------------------------------------------

# Colors for professional terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${CYAN}=======================================================${NC}"
echo -e "${CYAN}   Wazuh SIEM Server FULL AUTOMATED DEPLOYMENT       ${NC}"
echo -e "${CYAN}=======================================================${NC}"

# Automatically switch to root user if not already root
if [ "$EUID" -ne 0 ]; then
    echo -e "${YELLOW}[!] This script requires root privileges. Switching to sudo su...${NC}"
    sudo "$0" "$@"
    exit $?
fi

# 1. Update and Upgrade System Repositories
echo -e "\n${GREEN}[1/4] Updating system repositories...${NC}"
apt-get update -y && apt-get upgrade -y

# 2. Download and Execute the Official Full Wazuh Installation
echo -e "\n${GREEN}[2/4] Downloading and installing Full Wazuh Stack (-a option)...${NC}"
echo -e "${YELLOW}Please wait, this will take a few minutes to complete everything...${NC}"
curl -sO https://packages.wazuh.com/4.x/wazuh-install.sh
bash wazuh-install.sh -a

# 3. Configure Network Firewall Rules (UFW) for Agent Handshake
echo -e "\n${GREEN}[3/4] Opening firewall ports for Windows Agent & Dashboard...${NC}"
# Check if UFW is installed, if not install it
if ! command -v ufw &> /dev/null; then
    apt-get install ufw -y
fi

# Port 1514 for Agent communication and log shipping
ufw allow 1514/tcp
ufw allow 1514/udp

# Port 1515 for Agent enrollment and registration
ufw allow 1515/tcp

# Port 443 for Wazuh Web User Interface (Dashboard)
ufw allow 443/tcp

# Enable and Reload Firewall
echo "y" | ufw enable
ufw reload

# 4. Success Verification and Credentials Output
echo -e "\n${GREEN}[4/4] Extracting security credentials...${NC}"
echo -e "${CYAN}=======================================================${NC}"
echo -e "${GREEN}[SUCCESS] Wazuh SIEM Server is fully ready!${NC}"
echo -e "${YELLOW}You can now open it in any browser using your Kali IP:${NC}"
echo -e "${CYAN}URL: https://<YOUR_KALI_IP>${NC}"
echo -e "${YELLOW}To check your Admin password, run:${NC}"
echo -e "${MAGENTA}sudo tar -axf wazuh-install-files.tar wazuh-install-files/wazuh-passwords.txt -O${NC}"
echo -e "${CYAN}=======================================================${NC}"
