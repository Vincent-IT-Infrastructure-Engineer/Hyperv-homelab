# 🌐 Network Topology — Enterprise Homelab

This document outlines the full logical and physical network topology for the enterprise homelab.  
It includes VMware virtual networks, Hyper‑V vSwitch design, IP addressing, routing, and authentication flow.

---

## 🗺️ Network Overview

The lab uses a single flat subnet for simplicity and reliability during testing.

| Component | IP Address | Notes |
|----------|------------|-------|
| **Gateway** | 192.168.0.1 | Home router / upstream network |
| **HyperVHost** | 192.168.0.5 | Hyper‑V host running nested inside VMware |
| **DC01** | 192.168.0.10 | Primary domain controller (AD DS, DNS, DHCP) |
| **DC02** | 192.168.0.11 | Secondary domain controller |
| **Clients** | DHCP from DC01 | Windows 10, Windows 11, Linux |

**Subnet:** `192.168.0.0/24`  
**DNS:** `192.168.0.10` (DC01)  
**DHCP:** DC01

---

## 🏗️ VMware Virtual Network Layout

VMware Workstation provides the underlying network infrastructure for the entire lab.

| VMware Network | Type | Purpose |
|----------------|------|---------|
| **VMnet0** | Bridged | Primary uplink to physical LAN; used by Hyper‑V external vSwitch |
| **VMnet8** | NAT | Optional internet access for isolated VMs |
| **VMnet1** | Host‑Only | Isolated testing network (not used by Hyper‑V) |

Only **VMnet0** is used for the Hyper‑V external vSwitch.

---

## 🔌 Hyper‑V vSwitch Design

HyperVHost uses a single external vSwitch bound to the VMware bridged adapter.

| Setting | Value |
|--------|--------|
| **vSwitch Name** | ExternalSwitch |
| **Type** | External |
| **Bound To** | VMware VMnet0 adapter |
| **IPv4** | Enabled (required for host connectivity) |
| **IPv6** | Optional |

This allows all Hyper‑V VMs to appear directly on the 192.168.0.0/24 network.

---

## 🧭 Logical Network Flow

### **Client → DNS → Domain Controller**
Client VM
↓ DNS Query
192.168.0.10 (DC01)
↓ LDAP / Kerberos
DC01 / DC02


### **Client → Internet**
Client VM
↓
HyperVHost vSwitch
↓
VMware VMnet0 (Bridged)
↓
Home Router (192.168.0.1)
↓
Internet


---

## 🧱 Active Directory Placement

- **DC01** and **DC02** both reside on the same subnet.
- DNS is hosted on DC01.
- DHCP is hosted on DC01.
- Clients receive:
  - IP via DHCP
  - DNS = 192.168.0.10
  - Default gateway = 192.168.0.1

This ensures predictable authentication and name resolution.

---

## 🔐 Authentication Flow

### **Windows Clients**
1. Client boots  
2. DHCP assigns IP + DNS  
3. Client queries DC01 for SRV records  
4. Kerberos authentication  
5. GPO processing  
6. Logon completes  

### **Linux Client**
- Uses SSSD / realmd for domain join  
- Kerberos + LDAP for authentication  
- DNS dependency identical to Windows clients  

---

## 🧩 Diagram Placeholder
[Network Topology Diagram Placeholder]

VMware Layer

VMnet0 (Bridged)

VMnet8 (NAT)

VMnet1 (Host-Only)

Hyper-V Layer

ExternalSwitch → VMnet0

HyperVHost (192.168.0.5)

Server Layer

DC01 (192.168.0.10)

DC02 (192.168.0.11)

Client Layer

Windows 10 / 11 / Linux (DHCP)


---

## 📌 Status

The network topology is stable, validated, and supports all current and planned phases of the enterprise homelab.







