Phase 5 — DC‑01 Hardening  
Enterprise Security Baseline Implementation

🔎 Overview  
Phase 5 transforms DC‑01 from a functional domain controller into a fully hardened, enterprise‑grade security anchor.  
This phase applies Microsoft‑aligned baselines across authentication, certificates, auditing, and Group Policy.

The goal is to ensure DC‑01 meets the security expectations of a real‑world enterprise environment, while remaining fully operational for AD DS, DNS, Kerberos, and replication.

🧩 What This Phase Covers  
GPO Security Baselines  
Password policies, Kerberos settings, user rights, security options, firewall rules.

Kerberos & NTLM Hardening  
AES‑only Kerberos, NTLMv2 enforcement, RC4 removal, NTLM auditing.

### 🔐 Kerberos & NTLM Authentication Flow  
![Phase 5 — Kerberos & NTLM Authentication Flow](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-5-kerberos-ntlm-flow.png)

Account & Lockout Policies  
Enterprise password standards, lockout thresholds, privileged account protections.

Certificate Configuration  
DC Authentication certificates, auto‑enrollment, CRL validation.

### 🪪 Certificate Auto‑Enrollment Flow  
![Phase 5 — Certificate Auto‑Enrollment Flow](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-5-certificate-autoenrollment.png)

Advanced Audit Policy  
Directory Service Access, Logon/Logoff, Object Access, Policy Change, Privilege Use.

### 📊 Advanced Audit Policy Overview  
![Phase 5 — Advanced Audit Policy Overview](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-5-audit-policy-overview.png)

Sysmon Deployment  
Lightweight monitoring foundation for Phase 6 (SIEM integration).

### 🛰️ Sysmon Logging Pipeline  
![Phase 5 — Sysmon Logging Pipeline](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-5-sysmon-pipeline.png)

🗂️ Folder Structure  
![Phase 5 — DC01 Hardening Folder Structure](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/Hyperv-homelab/main/diagrams/phase-5-folder-structure.png)

🛡️ Security Objectives  
1. Strengthen Authentication  
Enforce AES‑only Kerberos encryption  
Disable RC4  
Require NTLMv2  
Enable Kerberos FAST (Armoring)

2. Harden Domain Controller Exposure  
Restrict local logon  
Restrict RDP  
Enforce SMB signing  
Enforce LDAP signing  
Block all non‑essential inbound ports

3. Improve Identity Assurance  
Deploy DC Authentication certificates  
Enable auto‑enrollment  
Validate CRL distribution points

4. Increase Visibility  
Enable advanced auditing  
Deploy Sysmon  
Prepare for SIEM ingestion (Phase 6)

🧪 Verification Checklist  
Authentication  
klist shows AES tickets  
No RC4 tickets issued  
NTLMv1 events = 0

Certificates  
certutil -dcinfo verify passes  
DC Authentication certificate present

GPO Baseline  
gpresult /r shows DC01-Security-Baseline applied

Audit Policy  
auditpol /get /category:* matches baseline

Firewall  
Only DC‑required ports open

🧵 Troubleshooting Notes  
If Kerberos fails after disabling RC4, check for legacy service accounts.  
If LDAP signing breaks applications, validate they support LDAPS.  
If Sysmon logs are empty, confirm the service is running and config is valid.  
If GPO settings don’t apply, check replication and SYSVOL health.

🚀 What This Phase Enables  
Phase 5 lays the foundation for:

Phase 6 — Monitoring & SIEM Integration  
(Event Forwarding, Sysmon ingestion, dashboards)

Phase 7 — PKI & Certificate Lifecycle Management

Phase 8 — Privileged Access Workstation (PAW) Architecture
