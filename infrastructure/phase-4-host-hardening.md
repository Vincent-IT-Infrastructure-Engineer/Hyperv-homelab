🛡️ Phase 4 — Hyper‑V Host Hardening  
Securing the Hyper‑V host and resolving network isolation issues

📘 Overview  
This guide documents the hardening work completed on the Hyper‑V host, including the diagnosis and resolution of a network isolation issue, followed by a full security baseline application.  
This phase ensures the host is stable, secure, and ready for DC01 hardening in Phase 5.

---

1️⃣ Network Isolation Issue  
The Hyper‑V host was unable to communicate with DC01 due to a multi‑layer networking conflict.

🧩 Root Cause Summary  
- VMware NAT configuration interfering with Hyper‑V vSwitch  
- Incorrect vSwitch binding  
- IPv4 disabled on the wrong interface  
- Routing table conflict causing traffic to loop locally  
- DNS resolution failing due to incorrect interface priority

🌐 Symptoms  
- No ping to DC01  
- No DNS resolution  
- No domain communication  
- Clients unable to authenticate

---

2️⃣ Diagnostics Performed  

🔍 Network Tools  
- `ping` — confirmed no ICMP response  
- `tracert` — traffic looping locally  
- `nslookup` — DNS unreachable  
- `route print` — incorrect interface metrics  
- `Get-NetAdapter` — interface mismatch  
- `Get-VMSwitch` — incorrect binding

🧪 Validation  
- Verified VMware network mode  
- Checked Hyper‑V vSwitch configuration  
- Confirmed interface priority  
- Ensured DC01 reachable from other devices

---

3️⃣ Fix Applied  

🛠️ Corrective Actions  
- Switched VMware NIC from **NAT → Bridged**  
- Rebound Hyper‑V vSwitch to correct physical NIC  
- Re‑enabled IPv4 on the correct interface  
- Cleaned routing table  
- Restarted host networking stack  
- Validated L2/L3 path to DC01

📡 Result  
- Host regained full communication with DC01  
- DNS resolution restored  
- Domain services reachable  
- Clients able to authenticate again

---

4️⃣ Hardening Steps  

🔐 Security Controls Applied  
- Windows Firewall baseline applied  
- WinRM secured with HTTPS  
- RDP hardened (TLS 1.2, NLA, restricted redirection)  
- Removal of legacy Windows features  
- Local admin lifecycle redesign  
- UAC elevation hardening  
- Disabled unnecessary services  
- Applied secure PowerShell execution policy  
- Enabled auditing for key events

🧩 Additional Improvements  
- Cleaned unused vSwitches  
- Standardised NIC naming  
- Documented network path  
- Prepared host for DC01 hardening

---

5️⃣ Final State  

🎯 Outcome  
- Hyper‑V host fully secured  
- Stable communication with DC01  
- Network path validated  
- Ready for Phase 5 (DC01 Hardening)

📐 Diagram  
See: `/diagrams/phase-4-hardening-path.png`
