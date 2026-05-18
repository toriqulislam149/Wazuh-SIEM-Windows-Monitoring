# 🛡️ Enterprise SIEM Deployment: Centralized Windows Endpoint Monitoring via Wazuh

An advanced Cyber Security and Security Information and Event Management (SIEM) project demonstrating central log management, real-time threat detection, and endpoint monitoring using **Wazuh SIEM Server** deployed on Kali Linux and a **Wazuh Agent** deployed on a Windows Endpoint (Supports Windows 10, Windows 11, and Windows Server).

---

## 📊 Project Architecture & Topology

This project establishes a secure, centralized monitoring pipeline where the security events from any Windows platform are collected, shipped, and analyzed by the Wazuh manager.

* **SIEM Manager Platform:** Kali Linux 2026
* **SIEM Manager Local IP:** `192.168.0.167`
* **Monitored Endpoint:** Windows OS (10 / 11 / Server OS Environments)
* **Endpoint Agent Name:** Dynamic (e.g., `Toriq10`)
* **Wazuh Software Version:** `v4.9.2` (Latest Stable Release)
* **Communication Ports:** `1514 (UDP/TCP)` for Log Collection & `1515 (TCP)` for Registration

---

## 🚀 Key Features Implemented

* **Centralized Log Collection:** Real-time shipping of Windows Security, Application, and System Event Logs.
* **Automated PowerShell Deployment:** Created a dynamic script with runtime inputs for scalable enterprise deployment across any Windows machine.
* **File Integrity Monitoring (FIM):** Tracks unauthorized modifications to critical system files.
* **Active Response Ready:** Configured to block or alert against brute-force attacks and registry tampering.

---

## 🛠️ Step-by-Step Implementation Guide

### Phase 1: SIEM Manager Setup
1. Deployed the Wazuh Single-Node Indexer, Server, and Dashboard inside the network environment.
2. Verified the manager status and extracted the API authorization tokens.
3. Configured the internal firewall rules to allow traffic on ports `1514` and `1515`.

### Phase 2: Dynamic Windows Agent Deployment
To make the installation automated and scalable across thousands of corporate endpoints without modifying the code, a custom script was engineered.

1. Open **Windows PowerShell** on the target machine as an Administrator.
2. Run the dynamic automation script located in this repository (`install_agent.ps1`):
   ```powershell
   # Set execution policy for the session
   Set-ExecutionPolicy RemoteSigned -Scope Process

   # Execute the automated deployment script
   .\install_agent.ps1
3.Enter your active Wazuh Manager IP and preferred unique agent identity at the prompts. The script automatically detects      the environment, downloads, installs, configures, and starts the system service (WazuhSvc).
4.🔬 Proof of Concept & Validation (Live Dashboard)
Once the service started successfully, a secure handshake was established with the Kali Linux Manager. The endpoint status immediately changed to Active on the central security console.

🖼️ Live Monitoring Screen Overview:
Below are the official verifications and structural layout of the live deployment:

Figure 1: Wazuh SIEM Dashboard confirming the 'Active' and healthy connection status of the Windows Endpoint.

Figure 2: Real-time security events, log streams, and system integrity indicators actively parsing into the indexer.

📁 Repository Structure:  
install_agent.ps1 - Professional automated deployment script with dynamic user input features.

README.md - Enterprise-grade documentation of the entire deployment lifecycle.

Screenshot (942).png & Screenshot (943).png - Visual verification files for active lab assessment.

👨‍💻 Author & Project Owner

Name: Toriqul Islam

Student ID: 2023200500078

Specialization: Cyber Security & Network Defense
