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
5. Apply settings.

---

## 🛠️ Step 2 — Join the Domain

1. Open **Settings → System → About**  
2. Click **Rename this PC (advanced)**  
3. Select **Change…**  
4. Choose **Domain** and enter:
5. Enter domain credentials  
6. Restart the machine when prompted

---

## 🔍 Step 3 — Validation

After reboot, confirm:

### ✔ Login works  
Use: domain\username

### ✔ System is in AD  
On DC01: confirm Active Directory Users and Computers → Computers

You should see the Windows 10 device.

### ✔ DNS registration  
Run: ipconfig /registerdns

### ✔ Group Policy applied  
Run: gpupdate /force , gpresult /r

---

## 🧪 Step 4 — Testing

- Ping DC01 and DC02  
- Confirm time sync:
w32tm /query /status

- Validate GPOs  
- Check Event Viewer: Applications and Services Logs → Microsoft → Windows → GroupPolicy

- 
---

## 🛠️ Troubleshooting

### ❗ Wrong DNS  
Most domain join failures are caused by DNS pointing to the wrong server.

### ❗ Time out of sync  
Fix with: w32tm /resync /force


### ❗ Firewall issues  
Ensure the client can reach:

- TCP 88 (Kerberos)  
- TCP/UDP 389 (LDAP)  
- TCP 445 (SMB)  

---

## 📌 Summary

Windows 10 client is now fully domain‑joined, validated, and ready for GPOs, baselines, and future Intune integration.


















