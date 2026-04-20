# 🧰 VMware Nested Virtualization Setup

This document outlines the configuration of VMware Workstation to support a fully functional nested Hyper‑V environment.  
It covers CPU virtualization, memory configuration, network design, and the reasoning behind using nested virtualization for this enterprise homelab.

---

## 🏗️ Purpose of Nested Virtualization

Nested virtualization allows Hyper‑V to run **inside** a VMware Workstation VM.  
This enables:

- Running multiple Hyper‑V VMs without needing a physical Hyper‑V server  
- Testing multi‑host scenarios in a single machine  
- Building enterprise‑grade labs on a workstation  
- Simulating hybrid Windows Server environments  
- Practicing virtualization, networking, and domain infrastructure skills

---

## 🖥️ VMware Workstation VM Configuration

### **CPU Settings**

| Setting | Value |
|--------|--------|
| Virtualization Engine | ✔ Virtualize Intel VT‑x/EPT or AMD‑V/RVI |
| CPU Count | 4 vCPUs minimum |
| Virtualize IOMMU | Optional but recommended |
| Performance Counters | ✔ Enabled |

These settings allow Hyper‑V to detect hardware virtualization support.

---

### **Memory Configuration**

| Component | Value |
|----------|--------|
| RAM | 8–16 GB recommended |
| Memory Reservation | Optional but improves stability |
| Swap Usage | Avoid over‑commitment |

Hyper‑V is memory‑intensive, especially when running multiple guest VMs.

---

## 🌐 VMware Network Configuration

The VMware networking layer provides the foundation for the Hyper‑V vSwitch.

| VMware Network | Type | Purpose |
|----------------|------|---------|
| **VMnet0** | Bridged | Primary uplink for Hyper‑V external vSwitch |
| **VMnet8** | NAT | Optional internet access for isolated VMs |
| **VMnet1** | Host‑Only | Isolated testing network |

Only **VMnet0** is used for Hyper‑V’s external vSwitch.

---

## 🔌 Hyper‑V Compatibility Requirements

To ensure Hyper‑V runs correctly inside VMware:

- Enable **VT‑x / AMD‑V**  
- Use **UEFI firmware**  
- Disable **Secure Boot**  
- Ensure **Windows Server** is installed with the Hyper‑V role  
- Confirm the host OS supports nested virtualization

---

## 🧪 Validation Steps

After enabling nested virtualization:

1. Boot the VMware VM  
2. Open PowerShell  
3. Run: Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All
4. 
4. Install Hyper‑V role if not already installed  
5. Create a test VM inside Hyper‑V  
6. Confirm it boots successfully

---

## 🧩 Diagram Placeholder
[VMware Nested Virtualization Diagram Placeholder]

Physical Machine

VMware Workstation Layer

VMnet0 / VMnet8 / VMnet1

HyperVHost VM (192.168.0.5)

Hyper-V Role

ExternalSwitch → VMnet0

Guest VMs (Windows 10, Windows 11, Linux)


---

## 📌 Status

The VMware nested virtualization layer is fully operational and supports the Hyper‑V host and all downstream infrastructure components.





