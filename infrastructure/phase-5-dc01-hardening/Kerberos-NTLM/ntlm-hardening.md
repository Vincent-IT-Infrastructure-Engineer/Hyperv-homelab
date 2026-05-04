# NTLM Hardening — DC‑01

## 🔐 Overview
NTLM is an older authentication protocol and should be restricted as much as possible.

## 🧩 Controls Implemented
- LAN Manager authentication level set to NTLMv2 only
- NTLM fallback disabled
- NTLM auditing enabled
- Restrict NTLM to domain controllers only
- Disable LM hash storage

## 🔧 Registry Enforcement
HKLM\SYSTEM\CurrentControlSet\Control\Lsa\LmCompatibilityLevel = 5  
HKLM\SYSTEM\CurrentControlSet\Control\Lsa\NoLMHash = 1

## 🧪 Verification
- Event Viewer → Security → NTLM events  
- Validate no NTLMv1 traffic is present  

