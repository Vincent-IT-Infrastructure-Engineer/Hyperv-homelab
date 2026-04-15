# 🪟 Windows 10 Client – Domain Join Guide

This guide covers the full process for preparing, joining, validating, and troubleshooting a Windows 10 client in the Hyper‑V Enterprise Homelab.

---

## ✅ Prerequisites

- Windows 10 VM deployed in Hyper‑V  
- Network connectivity to domain controllers  
- DNS pointing to **DC01** (and DC02 if available)  
- Domain credentials with join permissions  
- Time synchronised with the domain  

---

## 🛠️ Step 1 — Configure DNS

1. Open **Control Panel → Network and Internet → Network Connections**  
2. Right‑click your NIC → **Properties**  
3. Select **Internet Protocol Version 4 (TCP/IPv4)**  
4. Set DNS to your domain controller:


