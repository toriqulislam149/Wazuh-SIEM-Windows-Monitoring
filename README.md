# Wazuh SIEM - Windows 10 Endpoint Monitoring

This repository contains the documentation and overview for deploying a Wazuh SIEM agent on a Windows 10 Endpoint, managed centrally by a Wazuh Manager on Kali Linux.

## Project Details
- **Wazuh Manager OS:** Kali Linux (IP: 192.168.0.167)
- **Monitored Endpoint:** Windows 10 Pro (Agent Name: Toriq10)
- **Wazuh Agent Version:** v4.9.2
- **Status:** Successfully Connected and Active.

## Deployment Steps
1. Generated the custom MSI deployment command from the Wazuh Dashboard using the Manager's IP.
2. Executed the PowerShell command on the Windows 10 VM as an Administrator to install the agent.
3. Started the Wazuh service using the following command:
   ```powershell
   NET START WazuhSvc
