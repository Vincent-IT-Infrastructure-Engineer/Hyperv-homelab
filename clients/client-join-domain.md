# Client Domain Join Guide  
### Unified Workflow for Windows 10, Windows 11, and Linux Clients

## Overview
This guide provides a high‑level, OS‑agnostic workflow for joining client devices to the Active Directory domain in the Hyper‑V homelab environment.  
Each operating system has its own dedicated, detailed guide:

- **Windows 10** → `windows10.md`  
- **Windows 11** → `windows11.md`  
- **Linux (Ubuntu)** → `linux.md`  

This document explains the common prerequisites, general workflow, and shared troubleshooting steps that apply across all platforms.

---

## 1. Prerequisites (All Operating Systems)

### Domain Services
- Active Directory Domain Services (AD DS) is running  
- DNS is functioning and reachable  
- DHCP is issuing correct IP configuration  
- Domain Controller is reachable via ping and DNS lookup  

### Network Requirements
- Client must be on the same network/VLAN as the domain  
- DNS server on the client must point to the **Domain Controller**  
- No firewall rules blocking:  
  - LDAP (389)  
  - LDAPS (636)  
  - Kerberos (88)  
  - DNS (53)  
  - SMB (445)  

### Credentials
- Domain join account with permissions (e.g., `labadmin`)  
- Local admin access on the client  

---

## 2. High‑Level Domain Join Workflow

### Step 1 — Configure Network Settings
Ensure the client receives the correct IP configuration and DNS is set to the Domain Controller.

Validation: ping dc01.lab.local
            nslookup lab.local
            
### Step 2 — Verify Time Synchronisation
Kerberos requires accurate time.

Windows: w32tm /query /status

Linux: timedatectl

### Step 3 — Initiate Domain Join
- Windows 10 → System → Rename this PC → Domain  
- Windows 11 → Settings → System → About → Domain  
- Linux → `realm join`, `sssd`, or `adcli` depending on distro  

### Step 4 — Reboot the Client
All OS types require a reboot after joining.

### Step 5 — Test Domain Login
Use a domain user account:

### Step 6 — Validate Group Policy / SSSD
Windows: gpupdate /force
         gpresult /r
         
Linux: id lab\\username
          getent passwd
          
---

## 3. OS‑Specific Guides

### Windows 10
Full guide: `windows10.md`

### Windows 11
Full guide: `windows11.md`

### Linux (Ubuntu)
Full guide: `linux.md`

---

## 4. Common Troubleshooting (All OS)

### DNS Issues
Symptoms:
- “Domain not found”
- “Cannot contact domain controller”

Fix: nslookup lab.local
     ipconfig /flushdns
     systemd-resolve --flush-caches
     
### Time Skew
Symptoms:
- Kerberos errors
- Login failures

Fix: w32tm /resync
timedatectl set-ntp true

### Firewall / Connectivity
Symptoms:
- Join fails instantly
- Authentication errors

Fix:
- Ensure ports 53, 88, 389, 445 are open  
- Confirm DC is reachable  

### Incorrect Credentials
Symptoms:
- “Access denied”
- “Insufficient privileges”

Fix:
- Use a domain join account  
- Check AD permissions  

---

## 5. Diagram Placeholder
*(Add your blueprint‑style diagram here once created)*

Suggested diagram:
- Client → DNS → Domain Controller → AD DS  
- Windows + Linux authentication flow  

---

## 6. Version History

| Version | Date | Changes |
|--------|------|---------|
| 1.0 | Initial | Created unified domain join guide |










