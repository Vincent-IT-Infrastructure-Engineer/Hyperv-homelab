# 🔏 DC01 — Certificate Services (AD CS)

This document outlines the deployment and hardening of Active Directory Certificate Services (AD CS) on DC01.  
It covers the Certificate Authority configuration, template security, issuance policies, and the role of certificates in authentication and system hardening.

---

## 🔧 Certificate Services Summary

| Component | Value |
|----------|--------|
| **CA Type** | Enterprise Root CA |
| **CA Name** | DC01‑CA |
| **Key Length** | 4096‑bit RSA |
| **Hash Algorithm** | SHA‑256 |
| **Certificate Templates** | User, Computer, Web Server |
| **Auto‑Enrollment** | Enabled |
| **CRL Publishing** | Enabled (file + LDAP) |

---

## 🏛️ AD CS Architecture

DC01 hosts an **Enterprise Root Certificate Authority**, integrated with Active Directory.  
This allows domain‑joined devices and users to automatically request and receive certificates.

### **Key Components**

| Area | Description |
|------|-------------|
| **Root CA** | Issues certificates for domain services |
| **Certificate Templates** | Define issuance rules and permissions |
| **Auto‑Enrollment** | Automates certificate distribution |
| **CRL / AIA** | Ensures certificate validity checking |

---

## 🔐 Certificate Authority Configuration

### **CA Security Settings**

| Setting | Value |
|---------|--------|
| **Key Length** | 4096‑bit RSA |
| **Hash Algorithm** | SHA‑256 |
| **Validity Period** | 10 years |
| **CRL Validity** | 1 week |
| **AIA Publishing** | LDAP + file path |

### **Hardening Measures**

- Restricted CA management to Domain Admins  
- Enabled auditing for certificate issuance  
- Disabled weak cryptographic providers  
- Enforced secure RPC for CA communication  

---

## 🧩 Certificate Templates

### **Templates Deployed**

| Template | Purpose |
|----------|----------|
| **User** | Smart card / user authentication |
| **Computer** | Machine authentication + TLS |
| **Web Server** | HTTPS for internal services |

### **Template Hardening**

- Minimum key length: **2048‑bit RSA**  
- Renewal period: **80% of validity**  
- Enrollment permissions restricted to required groups  
- Private key export disabled (except for Web Server template)  

---

## 🚀 Auto‑Enrollment

Auto‑enrollment ensures certificates are automatically issued to domain‑joined devices and users.

### **Enabled For**

- Domain Computers  
- Domain Users  
- Servers requiring TLS certificates  

### **Benefits**

- Zero‑touch certificate lifecycle  
- Automatic renewal  
- Consistent security across the domain  

---

## 📡 CRL & AIA Publishing

### **CRL Distribution Points**

| Location | Purpose |
|----------|----------|
| **LDAP** | Domain‑joined validation |
| **File Share** | Internal services validation |

### **AIA Locations**

- LDAP  
- Local file path  

### **Notes**

- CRL is published weekly  
- Delta CRLs enabled for faster revocation updates  

---


## 🖼️ Reference Diagrams

### **AD CS Architecture**
![AD CS Architecture](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/dc01-adcs-architecture.png)

### **Certificate Enrollment Flow**
![Certificate Enrollment Flow](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/dc01-certificate-enrollment.png)


---

## 🎯 Final State

- Enterprise Root CA deployed on DC01  
- Strong cryptography enforced  
- Templates hardened and access‑controlled  
- Auto‑enrollment operational  
- CRL/AIA publishing configured  
- Certificate infrastructure ready for secure authentication and TLS services  

---
