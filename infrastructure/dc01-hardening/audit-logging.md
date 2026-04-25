# 📊 DC01 — Audit Logging & Monitoring

This document outlines the advanced audit policy configuration applied to DC01.  
These settings provide visibility into authentication events, privilege use, directory service operations, and system changes across the domain.

---

## 🔧 Audit Policy Summary

| Category | Status |
|----------|--------|
| **Advanced Audit Policy** | Enabled |
| **Account Logon Auditing** | Success + Failure |
| **Directory Service Auditing** | Success + Failure |
| **Privilege Use Auditing** | Success |
| **Policy Change Auditing** | Success + Failure |
| **System Events** | Success + Failure |
| **Object Access** | Enabled (targeted) |

---

## 🧩 Advanced Audit Policy Breakdown

### **Account Logon**

| Event Type | Status |
|------------|--------|
| **Kerberos Authentication** | Success + Failure |
| **NTLM Authentication** | Success + Failure |
| **Logon Attempts** | Success + Failure |

### **Purpose**

- Detects brute‑force attempts  
- Tracks failed Kerberos/NTLM authentication  
- Identifies suspicious logon patterns  

---

### **Account Management**

| Event Type | Status |
|------------|--------|
| **User Creation/Deletion** | Success |
| **Group Membership Changes** | Success |
| **Password Resets** | Success |

### **Purpose**

- Tracks privilege escalation  
- Detects unauthorized account changes  
- Supports incident investigations  

---

### **Directory Service Access**

| Event Type | Status |
|------------|--------|
| **Object Access** | Success + Failure |
| **Replication Events** | Success |
| **Schema Changes** | Success |

### **Purpose**

- Detects unauthorized AD object access  
- Monitors replication health  
- Tracks schema modifications  

---

### **Privilege Use**

| Event Type | Status |
|------------|--------|
| **Sensitive Privilege Use** | Success |
| **Non‑Sensitive Privilege Use** | Success |

### **Purpose**

- Identifies use of admin‑level privileges  
- Detects lateral movement attempts  

---

### **Policy Change**

| Event Type | Status |
|------------|--------|
| **Audit Policy Changes** | Success + Failure |
| **Authentication Policy Changes** | Success + Failure |
| **Authorization Policy Changes** | Success |

### **Purpose**

- Detects tampering with security settings  
- Tracks changes to authentication behaviour  

---

### **System Events**

| Event Type | Status |
|------------|--------|
| **System Startup/Shutdown** | Success |
| **Security System Extensions** | Success |
| **IPSec Driver Events** | Success |

### **Purpose**

- Tracks system lifecycle events  
- Detects unexpected reboots  
- Monitors security subsystem integrity  

---

## 🔍 Object Access Auditing (Targeted)

Object access auditing is enabled **only for critical objects**, to avoid excessive log volume.

### **Audited Objects**

- Domain Admins group  
- Enterprise Admins group  
- GPO objects  
- Certificate Authority objects  
- DNS zones  
- SYSVOL scripts  

### **Purpose**

- Detects unauthorized access  
- Supports forensic investigations  
- Protects high‑value assets  

---


### **Audit Policy Overview**
![Audit Policy Overview](../diagrams/dc01-audit-logging.png)

### **Authentication Event Flow**
![Authentication Event Flow](../diagrams/dc01-auth-event-flow.png)

*(Replace with your actual diagrams when available.)*

---

## 🎯 Final State

- Advanced auditing fully enabled  
- Authentication, privilege use, and directory access monitored  
- Policy changes tracked in real time  
- Object access auditing applied to critical assets  
- DC01 provides strong visibility for security monitoring and incident response  

---
