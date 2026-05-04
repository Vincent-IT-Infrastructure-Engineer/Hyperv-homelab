# Kerberos Hardening — DC‑01

## 🔐 Overview
Kerberos is the primary authentication protocol for Active Directory.  
Hardening ensures only secure encryption types and validated tickets are used.

## 🧩 Controls Implemented
- AES‑only Kerberos encryption (AES128 + AES256)
- RC4 disabled for all accounts
- Kerberos Armoring (FAST) enabled
- PAC validation enforced
- KDC signature validation enabled

## 🛠️ Configuration Notes
- Ensure all domain controllers support AES before disabling RC4.
- Validate that all service accounts have updated encryption types.

## 🧪 Verification Commands
klist
klist tgt
Get-ADUser -Filter * -Properties "msDS-SupportedEncryptionTypes"

