# 🛡️ DC01 — Domain Controller Hardening Overview

This document provides a full overview of the hardening work performed on DC01, including account policy enforcement, Kerberos/NTLM configuration, security baselines, certificate services, and auditing enhancements.  
It serves as the entry point for all DC01 hardening documentation.

---

## 🔧 DC01 Summary

| Component | Value |
|----------|--------|
| **Hostname** | DC01 |
| **Role** | Primary Domain Controller (AD DS, DNS) |
| **IP Address** | 192.168.0.10 |
| **Domain** | On‑prem Active Directory |
| **Hardening Scope** | Account policies, Kerberos/NTLM, GPO baselines, PKI, auditing |
| **Status** | Hardening completed + validated |

---

## 🏛️ Hardening Architecture

DC01 is the core identity provider for the environment.  
Hardening focuses on:

- Strengthening authentication  
- Reducing legacy protocol exposure  
- Enforcing secure baselines  
- Implementing certificate services  
- Enhancing audit visibility  

### **High‑Level Hardening Areas**

| Area | Description |
|------|-------------|
| **Account Policies** | Password, lockout, and Kerberos policy enforcement |
| **Kerberos & NTLM** | Restricting NTLM, enforcing secure Kerberos settings |
| **Security Baselines** | Applying Microsoft‑recommended GPO baselines |
| **Certificate Services** | Deploying AD CS for secure certificate issuance |
| **Audit Logging** | Enabling advanced security auditing |

---

## 📂 Hardening Documentation Structure

This folder contains the following detailed hardening documents:

### **1. Account Policies**
`account-policies.md`  
Defines password policy, lockout thresholds, Kerberos ticket lifetimes, and domain‑wide authentication rules.

### **2. Kerberos & NTLM Configuration**
`kerberos-ntlm.md`  
Covers secure Kerberos settings, NTLM restrictions, and protocol hardening.

### **3. GPO Security Baselines**
`gpo-security-baselines.md`  
Documents the Microsoft security baselines applied to DC01 and domain‑linked GPOs.

### **4. Certificate Services**
`certificate-services.md`  
Details the deployment and configuration of AD CS, templates, and certificate issuance.

### **5. Audit Logging**
`audit-logging.md`  
Defines advanced audit policy configuration and event visibility improvements.

---

## 🖼️ Reference Diagram

### **DC01 Hardening Architecture**



---

## 🎯 Final State

- DC01 fully hardened  
- Authentication protocols secured  
- Security baselines applied  
- Certificate services deployed  
- Auditing enhanced  
- Ready for production‑grade identity services  

---



