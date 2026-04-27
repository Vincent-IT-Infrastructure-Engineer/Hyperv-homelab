# Phase 4 Host Hardening – Technical Guide  
Operational Hardening Reference – April 2026  
Author: Vincent – IT Infrastructure Engineer  

---

## 📌 Overview  
This guide provides a structured reference for all host, VM, and network hardening tasks completed during Phase 4 of the enterprise lab build.

It is designed as a **repeatable operational standard**.

---

## 🖼 Blueprint Diagram  
![Phase 4 Host Hardening Architecture](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase4-host-hardening.png)

---

## 🔧 Hyper‑V Host Hardening  

### Integration Services  
Disable unnecessary services per VM:  
- Guest services  
- Time sync (if domain‑joined)  
- Data exchange (optional)  

### Secure Boot & TPM  
- Enforce Secure Boot on all Gen 2 VMs  
- Enable TPM for OS hardening and BitLocker  

### Enhanced Session Mode  
Disable unless explicitly required.

### Checkpoint Governance  
Get-VMSnapshot -VMName <VM>
Remove-VMSnapshot -VMName <VM>



### Firewall Validation  
Get-NetFirewallRule



---

## 🖥 VMware Workstation Hardening  

### Isolation Settings (`.vmx`)  
isolation.tools.copy.disable = "TRUE"
isolation.tools.paste.disable = "TRUE"
isolation.tools.dragAndDrop.disable = "TRUE"
isolation.tools.setGUIOptions.enable = "FALSE"



### Network Adapter Controls  
- Validate bridged adapter  
- Disable unnecessary adapters  
- Confirm no host‑guest leakage  

---

## 🌐 Network Segmentation & Isolation  

### Virtual Switch Controls  
- Internal‑only switches  
- VLAN tagging  
- NIC mapping validation  

### DNS Validation  
nslookup dc01.lab.local
Resolve-DnsName dc01.lab.local
Test-NetConnection -Port 53 -ComputerName dc01.lab.local


---

## 🔐 Authentication & Domain Tools  

### Kerberos  
klist purge
nltest /dsgetdc:lab.local
nltest /sc_verify:lab.local



### Secure Channel Repair  
Test-ComputerSecureChannel -Repair -Credential (Get-Credential)



---

## 🛡 Windows Server Hardening  

### Local Security Policy  
- Password policy  
- Lockout policy  
- Audit policy  
- User rights assignments  

### GPO Hardening  
- Harden LM/NTLM  
- Enforce SMB signing  
- Restrict anonymous access  
- Harden RDP  
- Disable SMB1  
- Disable TLS 1.0/1.1  

### Service Hardening  
Get-Service | Where-Object {$_.Status -eq "Running"}



---

## 📊 Logging & Monitoring  

### PowerShell Logging  
- Script block logging  
- Module logging  
- Transcription  

### Sysmon  
- SwiftOnSecurity config  
- Event ID mapping  

---

## 🧪 Validation Checklist  
- Host hardened  
- VM hardened  
- Network isolated  
- DNS validated  
- Domain join validated  
- Authentication validated  
- GPO applied  
- Logging enabled  
- Snapshots governed  
- Documentation updated  

---

## 📘 Tags  
Hyper-V VMware Hardening Security WindowsServer Logging Monitoring Homelab InfrastructureEngineering  

