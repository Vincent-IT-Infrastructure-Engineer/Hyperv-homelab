# 🏛️ DC01 — GPO Security Baselines

This document outlines the Microsoft security baselines and custom Group Policy Objects applied to DC01.  
These baselines enforce secure defaults across authentication, auditing, services, SMB, firewall, and system hardening.

---

## 🔧 Baseline Summary

| Baseline Area | Status |
|----------------|--------|
| **Microsoft Security Baseline (Windows Server)** | Applied |
| **Local Policies** | Hardened |
| **Audit Policies** | Enhanced |
| **SMB & Network Security** | Hardened |
| **Firewall Rules** | Enforced |
| **Service Hardening** | Applied |
| **Administrative Templates** | Updated |

---

## 🛡️ Microsoft Security Baseline (Windows Server)

The official Microsoft Security Baseline for Windows Server was applied to DC01.  
This provides a strong foundation aligned with industry best practices.

### **Key Controls Included**

| Category | Examples |
|----------|-----------|
| **Account Policies** | Password, lockout, Kerberos (see account-policies.md) |
| **User Rights Assignment** | Restrict local logon, deny anonymous access |
| **Security Options** | SMB signing, LDAP signing, UAC hardening |
| **Audit Policy** | Advanced auditing enabled |
| **Windows Defender** | Enabled + configured |
| **Firewall** | Strict inbound/outbound rules |

---

## 🔐 Local Security Policies

### **User Rights Assignment**

| Policy | Setting |
|--------|----------|
| **Deny log on locally** | Non-admin accounts |
| **Deny access to this computer from the network** | Anonymous users |
| **Allow log on locally** | Domain Admins only |
| **Allow log on through RDP** | Restricted admin group |

### **Security Options**

| Setting | Value |
|---------|--------|
| **LDAP Signing** | Required |
| **SMB Signing** | Required |
| **UAC** | Enabled + elevated enforcement |
| **Anonymous SID Enumeration** | Disabled |
| **LAN Manager Auth Level** | NTLMv2 only |

---

## 📊 Advanced Audit Policy

Advanced auditing provides visibility into authentication, privilege use, and directory service operations.

### **Audit Categories Enabled**

| Category | Status |
|----------|--------|
| **Account Logon** | Success + Failure |
| **Account Management** | Success + Failure |
| **Directory Service Access** | Success + Failure |
| **Privilege Use** | Success |
| **Policy Change** | Success + Failure |
| **System Events** | Success + Failure |

### **Benefits**

- Detects privilege escalation  
- Tracks authentication failures  
- Monitors GPO changes  
- Improves incident response visibility  

---

## 🔥 Windows Firewall Baseline

### **Firewall Configuration**

| Area | Setting |
|------|----------|
| **Inbound Rules** | Default deny, allow essential DC services |
| **Outbound Rules** | Default allow (monitored) |
| **Remote Management** | Restricted to admin subnets |
| **SMB** | Signed + restricted |

### **Allowed Inbound Services**

- LDAP / LDAPS  
- Kerberos  
- DNS  
- SMB (signed)  
- RPC (restricted)  

---

## 🧱 Service Hardening

### **Disabled or Restricted Services**

| Service | Action |
|---------|---------|
| **SMBv1** | Disabled |
| **Telnet** | Disabled |
| **FTP** | Disabled |
| **Remote Registry** | Disabled |
| **Print Spooler** | Disabled unless required |

### **Hardened Services**

| Service | Hardening |
|---------|------------|
| **WinRM** | HTTPS enforced |
| **RDP** | NLA + TLS 1.2 |
| **DNS** | Secure updates only |

---

## 🖼️ Reference Diagrams

### **GPO Baseline Architecture**
![GPO Baseline Architecture](../diagrams/dc01-gpo-baseline-architecture.png)

### **Audit Policy Overview**
![Audit Policy Overview](../diagrams/dc01-audit-policy-overview.png)

*(Replace with your actual diagrams when available.)*

---

## 🎯 Final State

- Microsoft Security Baseline fully applied  
- Local security policies hardened  
- Advanced auditing enabled  
- Firewall locked down  
- Services restricted to minimum required  
- Domain controller aligned with modern security standards  

---
