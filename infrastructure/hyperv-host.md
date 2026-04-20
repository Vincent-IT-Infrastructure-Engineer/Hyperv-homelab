# 🖥️ HyperVHost — Hyper‑V Host Overview

This document provides a full breakdown of the Hyper‑V host running inside VMware Workstation.  
It covers hardware configuration, virtualization settings, networking, domain join requirements, and known issues encountered during the build.

---

## 🔧 Host Summary

| Component | Value |
|----------|--------|
| **Hostname** | HyperVHost |
| **Role** | Hyper‑V virtualization host (nested inside VMware Workstation) |
| **IP Address** | 192.168.0.5 |
| **Subnet** | 192.168.0.0/24 |
| **Gateway** | 192.168.0.1 |
| **DNS** | 192.168.0.10 (DC01) |
| **Domain** | Joined to on‑prem AD DS |
| **Virtual Switch** | External vSwitch bound to VMware NIC |

---

## 🏗️ Virtualization Architecture

HyperVHost runs as a VMware Workstation VM with nested virtualization enabled.

### **VMware Workstation Settings**

- **Virtualization Engine:**  
  - ✔ Virtualize Intel VT‑x/EPT or AMD‑V/RVI  
  - ✔ Virtualize CPU performance counters  
- **Processors:**  
  - Minimum 4 vCPUs  
  - Enable “Virtualize IOMMU” if available  
- **Memory:**  
  - 8–16 GB recommended  
- **Firmware:**  
  - UEFI with Secure Boot disabled (Hyper‑V compatible)

---

## 🌐 Networking Configuration

HyperVHost uses a single external vSwitch bound to the correct VMware NIC.

### **VMware Network Mapping**

| VMware Network | Purpose | Notes |
|----------------|---------|-------|
| **VMnet0 (Bridged)** | Primary uplink | Used for Hyper‑V external vSwitch |
| **VMnet8 (NAT)** | Optional internet access | Not used for vSwitch |
| **VMnet1 (Host‑Only)** | Isolated testing | Not used for vSwitch |

### **Hyper‑V vSwitch**

| Setting | Value |
|--------|--------|
| **Name** | ExternalSwitch |
| **Type** | External |
| **Bound To** | VMware VMnet0 adapter |
| **IPv4** | Enabled (critical) |
| **IPv6** | Optional |

---

## 🏛️ Domain Join Requirements

To successfully join HyperVHost to the domain:

- DNS **must** point to DC01 → `192.168.0.10`
- Host must be able to resolve:
  - `_ldap._tcp.dc._msdcs.<domain>`
  - `<domain>` A record
- Firewall must allow:
  - LDAP (389)
  - Kerberos (88)
  - SMB (445)
  - RPC (135)
- Time sync must be within 5 minutes of DC01

---

## 🐛 Known Issue: Network Path Failure (Resolved)

During initial setup, HyperVHost could not reach DC01.

### **Symptoms**
- No ping to `192.168.0.10`
- No DNS resolution
- Domain join failed
- Host isolated from network

### **Root Cause**
- IPv4 was **disabled** on the Hyper‑V vSwitch  
- NIC binding order incorrect after VMware adapter changes

### **Fix**
1. Re‑enable IPv4 on the vSwitch  
2. Re‑bind the vSwitch to the correct VMware NIC  
3. Reset adapter order  
4. Flush DNS + reset network stack  
5. Validate routing and ARP

### **Validation**
- Ping DC01 → success  
- DNS resolution restored  
- Domain join successful  
- Clients reachable  

---

## 🧩 Diagram Placeholder

