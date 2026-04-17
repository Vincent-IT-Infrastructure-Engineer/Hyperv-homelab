Nested Hyper‑V Network Path Recovery

Troubleshooting Case Study – April 2026

Author: Vincent – IT Infrastructure Engineer

📌 Summary

During a nested virtualisation lab session (VMware Workstation → Hyper‑V → Windows Server), the Hyper‑V host lost connectivity to the domain controller (DC01). The root cause was a mis‑bound external switch and IPv4 disabled on the host’s primary adapter.

This document captures the full troubleshooting process, root cause, fix, and validation steps.

❌ Symptoms

Hyper‑V host stuck on “Unknown Network”

No DNS resolution

Could not reach DC01

Domain join failing

nltest /dsgetdc:lab.local returning errors

DC01 unreachable via ping

External switch bound to wrong NIC

IPv4 disabled on the host’s Ethernet0 adapter

🔍 Diagnostic Process

1. Checked Domain Controller Reachability

nltest /dsgetdc:lab.local

Returned: No DC available

2. Verified NIC Bindings

Hyper‑V External Switch was bound to the wrong VMware virtual NIC

IPv4 was disabled on the correct adapter

3. Traced Layer‑2 Path

VMware Workstation → VMnet0 → Hyper‑V Host → External Switch → DC01 The path broke at the Hyper‑V host due to the disabled IPv4 stack.

4. Validated VMware Bridging

Confirmed VMnet0 was correctly bridged to the physical NIC.

🧩 Root Cause

IPv4 was disabled on the Hyper‑V host’s primary adapter, and the external switch was bound to the wrong NIC. This isolated the host from DC01 and prevented DNS, domain join, and basic network communication.

🔧 Fix Implemented

1. Re‑enabled IPv4

Ethernet0 → Properties → Internet Protocol Version 4 (TCP/IPv4) → Enable

2. Re‑bound Hyper‑V External Switch

Removed old binding

Re‑attached switch to the correct NIC (VMnet0 path)

3. Validated Connectivity

ping dc01.lab.local
Test-Connection 192.168.0.10

4. Verified Domain Discovery

nltest /dsgetdc:lab.local

5. Forced Group Policy Update

gpupdate /force

🧪 Validation Results

Hyper‑V host now resolves DNS

DC01 reachable

Domain join successful

Network profile switched to Domain Network

Clean L2 path restored end‑to‑end

🖼 Blueprint Diagram

Add the generated blueprint image here:

/diagrams/nested-hyperv-network-path-recovery.png

Embed in Markdown:

![Nested Hyper-V Network Path Recovery](../diagrams/nested-hyperv-network-path-recovery.png)

💡 Lessons Learned

Always validate NIC bindings in nested virtualisation

Hyper‑V External Switches are sensitive to adapter changes

IPv4 being disabled can silently break the entire stack

Treat lab outages like production outages — methodical troubleshooting wins

Document everything for repeatability and professional growth

📘 Tags

Hyper-V VMware Workstation Nested Virtualisation Troubleshooting Active Directory DNS Networking Homelab Infrastructure Engineering