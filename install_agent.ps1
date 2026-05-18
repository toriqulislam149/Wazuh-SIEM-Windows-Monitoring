# 1. Prompt user for Wazuh Manager IP address input
$ManagerIP = Read-Host -Prompt "Enter your Wazuh Manager IP (Kali Linux IP)"

# If user hits Enter without input, fall back to default IP
if ([string]::IsNullOrEmpty($ManagerIP)) {
    $ManagerIP = "192.168.0.167"
    Write-Host "No IP provided. Using default IP: $ManagerIP..." -ForegroundColor Yellow
}

# 2. Prompt user for a Unique Agent Name
$AgentName = Read-Host -Prompt "Enter a unique name for this Windows Agent"

# If user hits Enter without input, fall back to default name
if ([string]::IsNullOrEmpty($AgentName)) {
    $AgentName = "Toriq10"
    Write-Host "No Agent Name provided. Using default name: $AgentName..." -ForegroundColor Yellow
}

# 3. Download the Wazuh Agent MSI installer package
Write-Host "`n[1/3] Downloading Wazuh Agent v4.9.2..." -ForegroundColor Green
Invoke-WebRequest -Uri "https://packages.wazuh.com/4.x/windows/wazuh-agent-4.9.2-1.msi" -OutFile "$env:tmp\wazuh-agent.msi"

# 4. Install the Agent silently using the provided Manager IP and Agent Name
Write-Host "[2/3] Installing Wazuh Agent (Name: $AgentName) with Manager IP ($ManagerIP)..." -ForegroundColor Green
msiexec.exe /i "$env:tmp\wazuh-agent.msi" /q WAZUH_MANAGER="$ManagerIP" WAZUH_AGENT_NAME="$AgentName"

# 5. Start the Wazuh Service
Write-Host "[3/3] Starting Wazuh Service (WazuhSvc)..." -ForegroundColor Green
Start-Sleep -Seconds 5
NET START WazuhSvc

Write-Host "`n[Success] Wazuh Agent installed and started successfully!" -ForegroundColor Cyan
