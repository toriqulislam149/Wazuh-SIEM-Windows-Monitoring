# 🛡️ Enterprise SIEM Deployment: Windows 10 Endpoint Monitoring via Wazuh

An advanced Cyber Security and Security Information and Event Management (SIEM) project demonstrating central log management, real-time threat detection, and endpoint monitoring using **Wazuh SIEM Server** deployed on Kali Linux and a **Wazuh Agent** on a Windows 10 Enterprise Endpoint.

---

## 📊 Project Architecture & Topology

This project establishes a secure, centralized monitoring pipeline where the security events from the Windows endpoint are collected, shipped, and analyzed by the Wazuh manager.

* **SIEM Manager Platform:** Kali Linux 2026
* **SIEM Manager Local IP:** `192.168.0.167`
* **Monitored Endpoint:** Windows 10 Pro / Enterprise (VMware Environment)
* **Endpoint Agent Name:** `Toriq10`
* **Wazuh Software Version:** `v4.9.2` (Latest Stable Release)
* **Communication Ports:** `1514 (UDP/TCP)` for Log Collection & `1515 (TCP)` for Registration

---

## 🚀 Key Features Implemented

* **Centralized Log Collection:** Real-time shipping of Windows Security, Application, and System Event Logs.
* **Automated PowerShell Deployment:** Created a dynamic script with runtime inputs for scalable enterprise deployment.
* **File Integrity Monitoring (FIM):** Tracks unauthorized modifications to critical system files.
* **Active Response Ready:** Configured to block or alert against brute-force attacks and registry tampering.

---

## 🛠️ Step-by-Step Implementation Guide

### Phase 1: SIEM Manager Setup
1. Deployed the Wazuh Single-Node Indexer, Server, and Dashboard inside the network environment.
2. Verified the manager status and extracted the API authorization tokens.
3. Configured the internal firewall rules to allow traffic on ports `1514` and `1515`.

### Phase 2: Dynamic Windows Agent Deployment
To make the installation automated and scalable across thousands of corporate endpoints, a custom script was engineered.

1. Open **Windows PowerShell** as an Administrator.
2. Run the dynamic automation script located in this repository (`install_agent.ps1`):
   ```powershell
   # Set execution policy for the session
   Set-ExecutionPolicy RemoteSigned -Scope Process

   # Execute the automated deployment script
   .\install_agent.ps1
