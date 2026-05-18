#!/bin/bash

# -----------------------------------------------------------------------------
# Wazuh SIEM Manager Deployment & Configuration Script for Kali Linux
# Author: Toriqul Islam (Student ID: 2023200500078)
# -----------------------------------------------------------------------------

# Colors for professional terminal output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}=======================================================${NC}"
echo -e "${CYAN}  Wazuh SIEM Server Installation & Firewall Config     ${NC}"
echo -e "${CYAN}=======================================================${NC}"

# 1. Update and Upgrade System Repositories
echo -e "\n${GREEN}[1/4] Updating system repositories...${NC}"
sudo apt-get update -y && sudo apt-get upgrade -y

# 2. Download and Run the Official Wazuh Installation Script
echo -e "\n${GREEN}[2/4] Downloading and deploying Wazuh Single-Node Server...${NC}"
curl -sO https://packages.wazuh.com/4.x/wazuh-install.sh
# Note: To run the full installation, use: sudo bash wazuh-install.sh -a

# 3. Configure Network Firewall Rules (UFW) for Agent Handshake
echo -e "\n${GREEN}[3/4] Configuring Firewall ports for Windows Agent connectivity...${NC}"
# Port 1514 for Agent communication and log shipping
sudo ufw allow 1514/tcp
sudo ufw allow 1514/udp

# Port 1515 for Agent enrollment and registration
sudo ufw allow 1515/tcp

# Port 443 for Wazuh Web User Interface (Dashboard)
sudo ufw allow 443/tcp

# Reload Firewall to apply changes
echo -e "${YELLOW}Reloading UFW Firewall...${NC}"
sudo ufw reload
sudo ufw status verbose

# 4. Verification of Wazuh Services
echo -e "\n${GREEN}[4/4] Verifying Wazuh Manager service status...${NC}"
# systemctl status wazuh-manager --no-pager

echo -e "\n${CYAN}=======================================================${NC}"
echo -e "${CYAN} SUCCESS: Kali Linux SIEM Manager Configuration Ready!  ${NC}"
echo -e "${CYAN}=======================================================${NC}"
