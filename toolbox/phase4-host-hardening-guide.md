# Phase 4 Host Hardening – Technical Guide  
Operational Hardening Reference – April 2026  
Author: Vincent – IT Infrastructure Engineer  

---

## 📌 Overview  
This guide provides a structured reference for all host, VM, and network hardening tasks completed during Phase 4 of the enterprise lab build.

It is designed as a **repeatable operational standard**.

---

## 🖼 Blueprint Diagram  
![Phase 4 Host Hardening Architecture](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase4-host-hardening.png)

---

## 🔧 Hyper‑V Host Hardening  

### Integration Services  
Disable unnecessary services per VM:  
- Guest services  
- Time sync (if domain‑joined)  
- Data exchange (optional)  

### Secure Boot & TPM  
- Enforce Secure Boot on all Gen 2 VMs  
- Enable TPM for OS hardening and BitLocker  

### Enhanced Session Mode  
Disable unless explicitly required.

### Checkpoint Governance  
