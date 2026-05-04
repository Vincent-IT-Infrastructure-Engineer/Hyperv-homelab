# Advanced Audit Policy — DC‑01

## 📝 Overview
Advanced auditing provides granular visibility into authentication, directory access, and system changes.

## 📡 Categories Enabled
- Logon/Logoff
- Account Logon
- Account Management
- Directory Service Access
- Object Access
- Policy Change
- Privilege Use
- System Events

## 🛠️ Notes
- Ensure Security log size is increased (minimum 1 GB recommended)
- Forward logs to SIEM (Phase 6)

## 🧪 Verification
auditpol /get /category:*

