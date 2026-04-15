# 🐧 Linux Client – Active Directory Integration Guide

This guide covers joining a Linux client to Active Directory using **realmd**, **SSSD**, and **Kerberos**.

Tested on:  
- Ubuntu 22.04  
- Debian 12  
- Rocky Linux 9  

---

## ✅ Prerequisites

- Linux VM deployed in Hyper‑V  
- DNS pointing to domain controllers  
- Domain credentials  
- Packages installed: realmd sssd sssd-tools adcli samba-common krb5-user packagekit
- 
---

## 🛠️ Step 1 — Configure DNS

Edit: /etc/resolv.conf

Set: nameserver 192.168.x.x
     nameserver 192.168.x.x
     search yourdomain.local
     
---

## 🛠️ Step 2 — Discover the Domain

Run: realm discover yourdomain.local

Expected output: domain details + supported join methods.

---

## 🛠️ Step 3 — Join the Domain

Run: sudo realm join yourdomain.local -U administrator

If prompted for Kerberos: kinit administrator


---

## 🔧 Step 4 — Configure SSSD

Ensure `/etc/sssd/sssd.conf` contains:
[sssd]
domains = yourdomain.local
config_file_version = 2
services = nss, pam

[domain/yourdomain.local]
ad_domain = yourdomain.local
krb5_realm = YOURDOMAIN.LOCAL
realmd_tags = manages-system joined-with-adcli
cache_credentials = True
id_provider = ad
fallback_homedir = /home/%u
default_shell = /bin/bash

Restart: sudo systemctl restart sssd

---

## 🔍 Step 5 — Validation

### ✔ Check domain users
id yourdomain\\username

### ✔ Login test  
Switch user: su - yourdomain\\username

### ✔ Kerberos ticket
klist

---

## 🛠️ Troubleshooting

### ❗ “No such realm found”
DNS issue — ensure DC is reachable.

### ❗ SSSD not starting  
Check: journalctl -u sssd

### ❗ Kerberos failures  
Purge tickets: kdestroy
               kinit administrator
               
---

## 📌 Summary

Linux client is now fully integrated with Active Directory using realmd + SSSD, ready for authentication, sudo policies, and future hardening.






















     






