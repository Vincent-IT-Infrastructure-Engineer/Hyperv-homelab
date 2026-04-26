# 🎟️ DC01 — Kerberos & NTLM Hardening

This document outlines the Kerberos and NTLM hardening applied to DC01, including secure ticket settings, encryption enforcement, NTLM reduction, and authentication flow improvements.  
These controls significantly strengthen domain authentication and reduce legacy protocol exposure.

---

## 🔧 Authentication Protocol Summary

| Protocol Area | Status |
|---------------|--------|
| **Kerberos Encryption** | AES‑only enforced |
| **NTLM** | Restricted (NTLMv1 disabled) |
| **Fallback Authentication** | Reduced to minimum safe levels |
| **Ticket Lifetimes** | Hardened (see Account Policies) |
| **PAC Validation** | Enabled |

---

## 🔐 Kerberos Hardening

Kerberos is the primary authentication protocol for the domain.  
Hardening ensures strong encryption, predictable ticket behaviour, and reduced attack surface.

### **Kerberos Encryption Settings**

| Setting | Value |
|---------|--------|
| **Allowed Encryption Types** | AES128 + AES256 |
| **Disabled** | DES, RC4 |
| **PAC Validation** | Required |
| **FAST (Kerberos Armoring)** | Supported (optional) |

### **Security Enhancements**

- Enforced AES‑only encryption for all domain accounts  
- Disabled legacy DES and RC4 to prevent downgrade attacks  
- Required PAC validation to prevent ticket forgery  
- Enabled support for Kerberos FAST (if clients support it)  

---

## 🚫 NTLM Restrictions

NTLM is a legacy authentication protocol and should be minimized wherever possible.

### **NTLM Configuration**

| Setting | Value |
|---------|--------|
| **NTLMv1** | Disabled |
| **NTLMv2** | Allowed (fallback only) |
| **LM Hash Storage** | Disabled |
| **NTLM Auditing** | Enabled |

### **NTLM Blocking Rules**

- NTLMv1 authentication attempts are rejected  
- LM responses are blocked  
- NTLM usage is logged for visibility  
- Domain controllers refuse NTLM for accounts requiring Kerberos  

---

## 🧭 Authentication Flow Improvements

### **Preferred Authentication Order**

1. **Kerberos (AES)**  
2. **Kerberos FAST (if supported)**  
3. **NTLMv2 (fallback only)**  

### **Additional Controls**

- Enforced secure channel signing  
- Required LDAP signing  
- Required SMB signing  
- Disabled anonymous SID enumeration  

---


### **Kerberos Authentication Flow**
![Kerberos Authentication Flow](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/dc01-kerberos-flow.png)

### **NTLM Restriction Overview**
![NTLM Restriction Overview](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/dc01-ntlm-restrictions.png)


---

## 🎯 Final State

- Kerberos hardened with AES‑only encryption  
- NTLMv1 fully disabled  
- NTLMv2 restricted to fallback scenarios  
- Authentication flow prioritises secure protocols  
- Domain controller aligned with modern security standards  

---
