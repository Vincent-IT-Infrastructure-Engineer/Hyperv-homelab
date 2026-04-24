# 🖥️ Hyper‑V Enterprise Homelab (Nested in VMware Workstation)

A fully documented, enterprise‑grade Windows Server homelab designed for hands‑on learning, MS‑102 preparation, and Infrastructure Engineering practice.  
This environment simulates a real‑world multi‑tier enterprise network with virtualization, identity, networking, security baselines, and hybrid cloud integration.

---

## 🔧 Lab Overview

This lab includes:

- Hyper‑V virtualization (nested inside VMware Workstation)
- Windows Server 2019/2022 domain controllers
- Active Directory, DNS, DHCP
- **Windows 10, Windows 11, and Linux domain‑joined clients**
- Group Policy Management + Security Baseline Hardening
- Hyper‑V Host Hardening + Network Isolation Fixes
- DC01 Hardening (Kerberos, NTLM, GPO Baselines, AD CS, Auditing)
- Blueprint‑style diagrams and engineering documentation
- Hybrid identity and M365 integration (in progress)
- A growing engineering **Toolbox** for troubleshooting and repeatable fixes

---

## 📌 Phase Progress

| Phase | Description | Status |
|-------|-------------|--------|
| **Phase 1** | Core Infrastructure Build | ✅ Completed |
| **Phase 2** | AD DS + DNS + DHCP | ✅ Completed |
| **Phase 3** | Client Join + GPO + Tools | ✅ Completed |
| **Phase 4** | Hyper‑V Host Domain Join + Hardening | ✅ Completed |
| **Phase 5** | DC01 Hardening (Kerberos, NTLM, GPO, AD CS, Auditing) | ✅ Completed |
| **Phase 6** | Intune / M365 Hybrid Integration | ⏳ Planned |

---

## 🎯 Goals of This Lab

- Prepare for **MS‑102: Microsoft 365 Administrator**
- Build a **professional engineering portfolio**
- Practice **hybrid identity**, device management, and automation
- Create **reusable documentation**, diagrams, and tooling
- Demonstrate **enterprise‑grade infrastructure engineering skills**
- Support **multi‑OS client management** (Windows 10, 11, Linux)
- Showcase **Hyper‑V, Windows Server, and AD DS** expertise
- Maintain a living **Infrastructure Engineer Toolbox**

---

## 📁 Repository Structure

### **Active Directory**
```
/active-directory
```
AD DS, DNS, DHCP, GPO, identity services.

### **Clients**
```
/clients
```
Windows 10, Windows 11, Linux domain join, validation, baselines.

### **Diagrams**
```
/diagrams
```
Blueprint‑style architecture diagrams for infrastructure, networking, and identity.

### **Infrastructure**
```
/infrastructure
    hyperv-host.md
    hyperv-host-hardening.md
    network-topology.md
    vmware-nested-setup.md
    dc01-hardening/
```

### **DC01 Hardening**
```
/infrastructure/dc01-hardening
    README.md
    account-policies.md
    kerberos-ntlm.md
    gpo-security-baselines.md
    certificate-services.md
    audit-logging.md
```

### **Toolbox**
```
/toolbox
```
Troubleshooting playbooks, engineering fixes, reusable commands, and workflow documentation.

---

## 🧭 Lab Architecture (High‑Level)

![Lab Architecture](./diagrams/lab-architecture-overview.png)

*(Replace with your actual diagram when ready.)*

---

## 🛠️ Technologies Used

- **Hyper‑V** (nested virtualization)
- **VMware Workstation**
- **Windows Server 2019 / 2022**
- **Active Directory Domain Services**
- **DNS / DHCP**
- **Group Policy**
- **AD CS (Certificate Services)**
- **Kerberos / NTLM Hardening**
- **Windows Firewall Baselines**
- **Windows 10 / 11**
- **Linux (domain‑joined)**
- **PowerShell**
- **Azure AD / Entra ID (planned)**

---

## 🚀 Next Steps

- Phase 6: Hybrid Azure AD Join  
- Intune device management  
- Conditional Access + MFA  
- Defender for Endpoint integration  
- Automated deployment scripts  
- Additional blueprint diagrams  

---

## 🎯 Final Notes

This homelab is designed as a **living, evolving engineering environment**.  
Every phase builds toward a complete, enterprise‑grade identity and device management platform — fully documented, fully reproducible, and portfolio‑ready.

---

