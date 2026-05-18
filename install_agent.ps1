# Wazuh Agent Automated Deployment Script for Windows 10
Write-Host "Downloading Wazuh Agent v4.9.2..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-4.9.2-1.msi" -OutFile "$env:tmp\wazuh-agent.msi"

Write-Host "Installing Wazuh Agent and connecting to Manager..." -ForegroundColor Green
msiexec.exe /i "$env:tmp\wazuh-agent.msi" /q WAZUH_MANAGER='192.168.0.167' WAZUH_AGENT_NAME='Toriq10'

Write-Host "Starting Wazuh Service..." -ForegroundColor Green
NET START WazuhSvc

Write-Host "Wazuh Agent Installation Completed Successfully!" -ForegroundColor Cyan
