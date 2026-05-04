# DC‑01 Security Baseline — GPO Settings

## 🧩 Account Policies
- Password history: 24
- Maximum password age: 60 days
- Minimum password age: 1 day
- Minimum password length: 14
- Password complexity: Enabled
- Reversible encryption: Disabled

## 🔐 Kerberos Policy
- Maximum ticket age: 10 hours
- Maximum renewal age: 7 days
- Maximum service ticket age: 600 minutes
- Clock sync tolerance: 5 minutes

## 👤 User Rights Assignment
- Deny log on locally: Domain Users
- Deny log on through Remote Desktop Services: Domain Users
- Allow log on locally: Administrators
- Allow log on through Remote Desktop Services: Administrators

## 🛡️ Security Options
- LAN Manager authentication level: NTLMv2 only
- SMB signing: Required
- LDAP signing: Required
- Anonymous SID/Name translation: Disabled
- Do not store LAN Manager hash value: Enabled

## 🌐 Windows Firewall (Domain Profile)
- Default inbound: Block
- Default outbound: Allow
- Allowed inbound:
  - RPC (TCP 135)
  - LDAP (TCP/UDP 389)
  - Kerberos (TCP/UDP 88)
  - DNS (TCP/UDP 53)
  - SMB (TCP 445)

## 📁 Administrative Templates (Key Items)
- Disable insecure guest logons: Enabled
- Hardened UNC paths: Enabled
- Turn off multicast name resolution: Enabled
- Turn off SMB1: Enabled
