# 🛡️ HyperVHost — Hyper‑V Host Hardening Overview

This document provides a full breakdown of the hardening work completed on the Hyper‑V host, including the diagnosis and resolution of a network isolation issue, followed by the application of security controls to stabilise and secure the environment.

---

## 🔧 Hardening Summary

| Component | Value |
|----------|--------|
| **Hostname** | HyperVHost |
| **Role** | Hyper‑V virtualization host (nested inside VMware Workstation) |
| **Primary Issue** | Network isolation preventing communication with DC01 |
| **Status** | Fully resolved + host hardened |
| **vSwitch** | External vSwitch bound to VMware VMnet0 |
| **IPv4** | Enabled (critical) |
| **Domain Connectivity** | Restored and validated |

---

## 🐛 Network Isolation Issue (Resolved)

During Phase 4, HyperVHost was unable to communicate with DC01 due to a multi‑layer networking conflict.

### **Symptoms**

- No ping to `192.168.0.10`  
- No DNS resolution  
- Domain join attempts failed  
- Clients unable to authenticate  
- Host isolated from the network  

### **Issue Summary**

| Area | Problem |
|------|---------|
| **VMware Network Mode** | Incorrect NAT configuration interfering with Hyper‑V |
| **vSwitch Binding** | Bound to wrong VMware NIC |
| **IPv4** | Disabled on the vSwitch |
| **Routing** | Incorrect interface metrics causing traffic loops |
| **DNS** | Wrong interface priority |

---

## 🔍 Diagnostics Performed

### **Tools Used**

| Tool | Purpose |
|------|----------|
| `ping` | Confirmed no ICMP response to DC01 |
| `tracert` | Showed traffic looping locally |
| `nslookup` | DNS unreachable |
| `route print` | Identified incorrect interface metrics |
| `Get-NetAdapter` | Verified NIC state and bindings |
| `Get-VMSwitch` | Identified incorrect vSwitch configuration |

### **Validation Steps**

- Verified VMware network mode  
- Checked Hyper‑V vSwitch binding  
- Confirmed interface priority  
- Ensured DC01 reachable from other devices  

---

## 🛠️ Fix Applied

### **Corrective Actions**

1. Switched VMware NIC from **NAT → Bridged (VMnet0)**  
2. Rebound Hyper‑V vSwitch to the correct VMware NIC  
3. Re‑enabled IPv4 on the vSwitch  
4. Cleaned routing table + reset adapter order  
5. Restarted host networking stack  
6. Validated L2/L3 path to DC01  

### **Result**

| Component | Status |
|----------|---------|
| **Connectivity to DC01** | Restored |
| **DNS Resolution** | Working |
| **Domain Services** | Reachable |
| **Client Authentication** | Successful |
| **Network Stability** | Confirmed |

---

## 🔐 Security Hardening Controls Applied

| Area | Control |
|------|---------|
| **Firewall** | Applied Windows Firewall baseline |
| **WinRM** | Secured with HTTPS |
| **RDP** | Hardened (TLS 1.2, NLA, restricted redirection) |
| **Legacy Features** | Removed unnecessary Windows components |
| **Local Admin** | Lifecycle redesigned + restricted |
| **UAC** | Elevated enforcement |
| **Services** | Disabled non‑essential services |
| **PowerShell** | Secure execution policy applied |
| **Auditing** | Enabled key security events |

---

![Phase 4 — Hyper‑V Host Hardening Path](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-4-hardening-path.png)


![vSwitch Binding](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase4-vswitch-binding.png)


![VMware Settings](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase4-vmware-settings.png)


---

## 🎯 Final State

- Hyper‑V host fully secured  
- Stable communication with DC01  
- DNS + routing validated  
- vSwitch correctly bound  
- IPv4 correctly enabled  
- Host ready for **Phase 5 — DC01 Hardening**  

---
