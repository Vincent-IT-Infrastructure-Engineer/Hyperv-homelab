# 🔐 DC01 — Account Policies Overview

This document defines the domain‑wide account policies applied to DC01, including password policy, lockout thresholds, Kerberos ticket lifetimes, and authentication requirements.  
These policies form the foundation of secure identity management across the domain.

---

## 🔧 Account Policy Summary

| Policy Area | Status |
|-------------|--------|
| **Password Policy** | Enforced (complexity + minimum length) |
| **Account Lockout** | Enabled with strict thresholds |
| **Kerberos Policy** | Hardened ticket lifetimes + enforcement |
| **NTLM Restrictions** | Legacy NTLM reduced (see Kerberos/NTLM doc) |
| **Audit Policy** | Enhanced logging enabled |

---

## 🔑 Password Policy

### **Password Requirements**

| Setting | Value |
|---------|--------|
| **Minimum Length** | 12 characters |
| **Complexity** | Enabled |
| **Password History** | 24 remembered |
| **Maximum Age** | 60 days |
| **Minimum Age** | 1 day |

### **Notes**

- Complexity requires uppercase, lowercase, numeric, and special characters  
- Password reuse is prevented through history enforcement  
- Maximum age ensures regular credential rotation  

---

## 🚫 Account Lockout Policy

### **Lockout Thresholds**

| Setting | Value |
|---------|--------|
| **Account Lockout Threshold** | 5 invalid attempts |
| **Reset Counter After** | 15 minutes |
| **Lockout Duration** | 15 minutes |

### **Notes**

- Prevents brute‑force attacks  
- Ensures accounts automatically unlock after a safe interval  
- Threshold balanced to avoid accidental lockouts  

---

## 🎟️ Kerberos Policy

### **Kerberos Ticket Settings**

| Setting | Value |
|---------|--------|
| **Max Ticket Age** | 10 hours |
| **Max Renewal Age** | 7 days |
| **Max Service Ticket Age** | 600 minutes |
| **Clock Skew Tolerance** | 5 minutes |

### **Security Enhancements**

- Enforced AES‑only encryption where supported  
- Disabled DES and RC4  
- Required PAC validation  
- Strengthened ticket lifetime boundaries  

---

## 🧱 Additional Authentication Controls

### **Smart Card / MFA (Optional)**

Environment supports:

- Smart card logon  
- Certificate‑based authentication  
- MFA integration via Azure AD (if hybrid)  

### **NTLM Restrictions**

Full details in:

```
kerberos-ntlm.md
```

---

## 🖼️ Reference Diagram

### **Reference Diagram**

#### **Account Policy Flow**
![Account Policy Flow](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/dc01-account-policy-flow.png)


---

## 🎯 Final State

- Strong password policy enforced  
- Lockout thresholds prevent brute‑force attacks  
- Kerberos hardened with secure ticket lifetimes  
- NTLM usage reduced  
- Authentication posture significantly improved  

---
