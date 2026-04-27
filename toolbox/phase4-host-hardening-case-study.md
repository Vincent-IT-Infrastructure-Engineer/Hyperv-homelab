Phase 4 Host Hardening – Case Study
Operational Hardening & Security Improvements – April 2026
Author: Vincent – IT Infrastructure Engineer

📌 Summary
During Phase 4 of the enterprise lab build, the focus shifted from functionality to security, isolation, and operational hardening of the virtualisation stack. This case study documents the hardening work applied to the Hyper‑V host, VMware Workstation layer, and Windows Server guests, including the validation steps and lessons learned.

The goal was to treat the lab like a production environment:
secure, predictable, isolated, and fully documented.

❌ Issues Identified
Hyper‑V host running with default security posture

VMware Workstation allowing clipboard, drag‑drop, and shared folder leakage

Legacy protocols enabled (SMB1, TLS 1.0/1.1)

Weak RDP configuration

No enforced Secure Boot or TPM on Gen 2 VMs

Inconsistent firewall rules

No PowerShell logging

No Sysmon visibility

Checkpoints used without governance

No baseline for service hardening

🔍 Diagnostic Process
1. Reviewed Host Security Posture
Checked Hyper‑V integration services

Validated external switch bindings

Reviewed VMware .vmx isolation settings

Inspected Windows Server local security policy

2. Analysed Network Isolation
Mapped L2/L3 paths

Validated DNS dependency

Checked VLAN segmentation

Confirmed VMware → Hyper‑V → Guest isolation

3. Audited Authentication & Domain Dependencies
Code
nltest /dsgetdc:lab.local
nltest /sc_verify:lab.local
klist purge
4. Reviewed Logging & Monitoring Gaps
No script block logging

No module logging

No Sysmon

No event filtering

5. Checked Backup & Snapshot Governance
Hyper‑V checkpoints used as long‑term restore points

VMware snapshots not documented

🧩 Root Cause
The environment was functional but not hardened.
Default settings across Hyper‑V, VMware Workstation, and Windows Server left the lab vulnerable to:

Host‑guest leakage

Weak authentication

Legacy protocol exposure

Poor audit visibility

Inconsistent VM security posture

Phase 4 addressed these gaps.

🔧 Fixes Implemented
1. Hyper‑V Host Hardening
Disabled unnecessary integration services

Enforced Secure Boot & TPM on Gen 2 VMs

Restricted enhanced session mode

Hardened checkpoint usage

Validated firewall rules

Disabled SMB1 and legacy TLS

2. VMware Workstation Hardening
Disabled drag‑drop

Disabled clipboard sharing

Disabled shared folders

Disabled copy/paste

Hardened .vmx isolation settings

Validated bridged adapter isolation

3. Windows Server Hardening
Applied password & lockout policies

Hardened LM/NTLM

Enforced SMB signing

Restricted anonymous access

Hardened RDP

Disabled legacy protocols

4. Logging & Monitoring
Enabled script block logging

Enabled module logging

Enabled PowerShell transcription

Deployed Sysmon (SwiftOnSecurity config)

5. Backup & Snapshot Governance
Hyper‑V:

Code
Get-VMSnapshot -VMName <VM>
Remove-VMSnapshot -VMName <VM>
VMware:

Enforced naming conventions

Limited retention

Avoided snapshot chains

🧪 Validation Results
Host hardened and isolated

VMware isolation confirmed

DNS and domain join validated

Authentication stable

GPO applied successfully

Logging and Sysmon operational

Snapshots governed

Documentation updated

![Phase 4 Host Hardening Architecture](https://raw.githubusercontent.com/Vincent-IT-Infrastructure-Engineer/main/diagrams/phase4-host-hardening.png

💡 Lessons Learned
Treat lab hosts like production hosts

Isolation must be enforced at every layer

VMware Workstation defaults are insecure

Hyper‑V integration services can weaken isolation

Logging is essential for troubleshooting and security

Documentation ensures repeatability and growth

📘 Tags
Hyper-V VMware Workstation Hardening Security WindowsServer NestedVirtualisation InfrastructureEngineering Homelab
