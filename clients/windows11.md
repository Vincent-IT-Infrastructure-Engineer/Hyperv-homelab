# 🪟 Windows 11 Client – Domain Join Guide

This guide covers the full process for preparing, joining, validating, and troubleshooting a Windows 11 client in the Hyper‑V Enterprise Homelab.

---

## ✅ Prerequisites

- Windows 11 VM deployed in Hyper‑V  
- DNS set to domain controllers  
- Domain credentials  
- Network connectivity to DC01/DC02  

---

## 🛠️ Step 1 — Configure DNS

1. Open **Settings → Network & Internet**  
2. Click your NIC → **Hardware Properties**  
3. Scroll to **DNS Server Assignment** → Edit  
4. Set: Preferred DNS: 192.168.x.x (DC01)
        Alternate DNS: 192.168.x.x (DC02)


---

## 🛠️ Step 2 — Join the Domain

1. Open **Settings → System → About**  
2. Click **Domain or Workgroup**  
3. Select **Join a domain**  
4. Enter: yourdomain.local 
5. Provide domain credentials  
6. Restart when prompted

---

## 🔍 Step 3 — Validation

### ✔ Login  
Use: domain\username

### ✔ AD object created  
Check in ADUC under **Computers**.

### ✔ DNS registration  
Run: ipconfig /registerdns

### ✔ Group Policy  
Run: gpupdate /force
     gpresult /h report.html
     
---

## 🧪 Step 4 — Testing

- Ping domain controllers  
- Validate Kerberos: klist
- 
- Check Event Viewer: Applications and Services Logs → Microsoft → Windows → GroupPolicy
- 
---

## 🛠️ Troubleshooting

### ❗ “Domain not found”
- DNS not pointing to DC  
- NIC using external DNS  
- Firewall blocking ports  

### ❗ Kerberos issues  
Run: klist purge

### ❗ GPO not applying  
Check SYSVOL replication and time sync.

---

## 📌 Summary

Windows 11 client is now domain‑joined and ready for GPOs, baselines, and hybrid identity work.
















