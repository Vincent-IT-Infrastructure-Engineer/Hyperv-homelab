# 🖥️ Client Domain Join Guide  
### Unified Workflow for Windows 10, Windows 11, and Linux Clients

---

## 📘 Overview  
This guide provides a **high‑level, OS‑agnostic workflow** for joining client devices to the Active Directory domain in the Hyper‑V homelab.

Each operating system has its own detailed guide:

- **Windows 10** → `windows10.md`  
- **Windows 11** → `windows11.md`  
- **Linux (Ubuntu)** → `linux.md`  

This document covers:

- Prerequisites  
- Network + DNS requirements  
- Domain join workflow  
- Validation steps  
- Common troubleshooting  
- Diagram references  

---

## 1️⃣ Prerequisites (All Operating Systems)

### 🧩 Domain Services
- AD DS running  
- DNS functioning and reachable  
- DHCP issuing correct IP configuration  
- Domain Controller reachable via ping + DNS lookup  

### 🌐 Network Requirements
- Client must be on the same network/VLAN as the domain  
- DNS **must** point to the Domain Controller  
- No firewall rules blocking:  
  - **LDAP (389)**  
  - **LDAPS (636)**  
  - **Kerberos (88)**  
  - **DNS (53)**  
  - **SMB (445)**  

### 🔐 Credentials
- Domain join account (e.g., `labadmin`)  
- Local admin access on the client  

---

## 2️⃣ High‑Level Domain Join Workflow

### **Step 1 — Configure Network Settings**
Ensure the client receives correct IP + DNS configuration.

**Validation**
```bash
ping dc01.lab.local
nslookup lab.local
```

---

### **Step 2 — Verify Time Synchronisation**
Kerberos requires accurate time.

**Windows**
```powershell
w32tm /query /status
```

**Linux**
```bash
timedatectl
```

---

### **Step 3 — Initiate Domain Join**

#### 🪟 Windows 10
Settings → System → About → **Rename this PC (advanced)** → Domain

#### 🪟 Windows 11
Settings → System → About → **Domain or Workgroup** → Join a domain

#### 🐧 Linux
Using `realmd`, `sssd`, or `adcli`:
```bash
sudo realm join lab.local -U labadmin
```

---

### **Step 4 — Reboot the Client**
All OS types require a reboot after joining.

---

### **Step 5 — Test Domain Login**
Use a domain user account:

- Windows → `LAB\username`  
- Linux → `lab\\username`  

---

### **Step 6 — Validate Group Policy / SSSD**

**Windows**
```powershell
gpupdate /force
gpresult /r
```

**Linux**
```bash
id lab\\username
getent passwd lab\\username
```

---

## 3️⃣ OS‑Specific Guides

- **Windows 10** → `windows10.md`  
- **Windows 11** → `windows11.md`  
- **Linux (Ubuntu)** → `linux.md`  

---

## 4️⃣ Common Troubleshooting (All OS)

### 🟥 DNS Issues
**Symptoms**
- “Domain not found”  
- “Cannot contact domain controller”  

**Fix**
```powershell
nslookup lab.local
ipconfig /flushdns
systemd-resolve --flush-caches
```

---

### 🟧 Time Skew
**Symptoms**
- Kerberos errors  
- Login failures  

**Fix**
```powershell
w32tm /resync
timedatectl set-ntp true
```

---

### 🟦 Firewall / Connectivity
**Symptoms**
- Join fails instantly  
- Authentication errors  

**Fix**
- Ensure ports **53, 88, 389, 445** are open  
- Confirm DC reachable via ping  

---

### 🟪 Incorrect Credentials
**Symptoms**
- “Access denied”  
- “Insufficient privileges”  

**Fix**
- Use a domain join account  
- Check AD permissions  

---

## 5️⃣ Diagrams

- **Client → Network Infrastructure → Active Directory Domain**  
  `/diagrams/client-network-ad-flow.png`

- **Client → DNS → Domain Controller → AD DS**  
  `/diagrams/client-dns-dc-adds-flow.png`

- **Windows + Linux Authentication Flow**  
  `/diagrams/client-authentication-flow.png`

---

## 6️⃣ Version History

| Version | Date | Changes |
|--------|------|---------|
| 1.1 | Updated | Reformatted to match unified visual documentation style |
| 1.0 | Initial | Created unified domain join guide |
