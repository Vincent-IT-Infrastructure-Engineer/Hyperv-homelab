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
- Group Policy Management + Baseline Hardening
- Blueprint‑style diagrams and engineering documentation
- Hybrid identity and M365 integration (in progress)

---

## 📌 Phase Progress

| Phase | Description | Status |
|-------|-------------|--------|
| **Phase 1** | Core Infrastructure Build | ✅ Completed |
| **Phase 2** | AD DS + DNS + DHCP | ✅ Completed |
| **Phase 3** | Client Join + GPO + Tools | ✅ Completed |
| **Phase 4** | Hyper‑V Host Domain Join | 🔄 In Progress |
| **Phase 5** | Intune / M365 Hybrid Integration | ⏳ Planned |

---

## 🎯 Goals of This Lab

- Prepare for **MS‑102: Microsoft 365 Administrator**
- Build a **professional engineering portfolio**
- Practice **hybrid identity**, device management, and automation
- Create **reusable documentation**, diagrams, and tooling
- Demonstrate **enterprise‑grade infrastructure engineering skills**
- Support **multi‑OS client management** (Windows 10, 11, Linux)

---

## 📁 Repository Structure

/infrastructure — Hyper‑V host, networking, nested virtualization

/active-directory — Domain setup, DNS, DHCP, GPO

/clients — Windows 10 domain join + validation

/toolbox — PowerShell, Hyper‑V, AD commands

/diagrams — Blueprint‑style architecture diagrams
