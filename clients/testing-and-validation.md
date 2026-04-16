Testing & Validation Guide
Unified Post‑Join Verification for Windows 10, Windows 11, and Linux Clients
Overview
This guide provides a structured, OS‑agnostic workflow for validating that clients have successfully joined the Active Directory domain in the Hyper‑V homelab environment.

It covers:

Network validation

DNS verification

Domain controller reachability

Authentication testing

Kerberos & time sync checks

Group Policy / SSSD validation

Troubleshooting steps

Diagram references

Each OS also has its own detailed guide:

Windows 10 → windows10.md

Windows 11 → windows11.md

Linux (Ubuntu) → linux.md

1. Pre‑Validation Requirements
Before testing, ensure:

Domain Services
AD DS is healthy

DNS zones are functioning

DCs respond to ping and DNS queries

DHCP is issuing correct IP configuration

Client Requirements
Client is domain‑joined

Client has rebooted after join

Domain credentials available

Local admin access available

2. Network & Connectivity Validation
Step 1 — Confirm IP Configuration
Windows:

Code
ipconfig /all
Linux:

Code
ip a
Expected:

Correct IP range

DNS = Domain Controller

Default gateway reachable

Step 2 — Test Connectivity to Domain Controller
ping dc01.lab.local
Expected:
Replies with <1–5ms latency inside Hyper‑V
No packet loss

Step 3 — Validate DNS Resolution
nslookup lab.local
nslookup dc01.lab.local
Linux alternative:
dig lab.local
Expected:
DNS server = DC
Correct A records returned

3. Time Synchronisation Validation
Kerberos requires time accuracy within 5 minutes.

Windows:
w32tm /query /status
Linux:
timedatectl
Expected:
NTP synchronized
Time source = DC or Hyper‑V host

If out of sync:
Windows:
w32tm /resync
Linux:

timedatectl set-ntp true

4. Authentication & Login Validation
Step 1 — Test Domain Login
Attempt login using a domain user:
Windows: LAB\username
Linux: lab\\username

Expected:
Login successful

No Kerberos or credential errors

Step 2 — Validate Kerberos Tickets
Windows:
klist
Linux:
klist
Expected:
Ticket cache present
krbtgt ticket issued
No “Clock skew” errors

5. Group Policy / SSSD Validation
Windows Validation
Force policy update:
gpupdate /force
Check applied policies:
gpresult /r
Expected:
Computer settings applied
User settings applied
No GPO errors
Linux Validation
Check domain identity resolution:
id lab\\username
Check NSS integration:
getent passwd lab\\username
Expected:
UID/GID returned
SSSD resolving domain users

6. Service-Level Validation
LDAP Connectivity
nltest /dsgetdc:lab.local
Expected:
DC name returned
Flags show LDAP/Kerberos available

SMB Share Access
Windows:
\\dc01\sysvol
Linux:
smbclient -L //dc01.lab.local -U lab\\username
Expected:
SYSVOL accessible
No permission errors

7. Troubleshooting (All Operating Systems)
DNS Issues
Symptoms:
“Domain not found”
Join succeeds but login fails
Fix:
ipconfig /flushdns
systemd-resolve --flush-caches
nslookup lab.local
Time Skew

Symptoms:
Kerberos errors
Login failures
Fix:
w32tm /resync
timedatectl set-ntp true
Firewall / Connectivity

Symptoms:
Join fails instantly
Authentication errors
Fix:
Ensure ports 53, 88, 389, 445 are open
Confirm DC reachable via ping
SSSD / Linux Authentication

Symptoms:
Login fails
id returns “no such user”
Fix:
systemctl restart sssd
realm list

8. Diagrams
Client → Network Infrastructure → Active Directory Domain
[Looks like the result wasn't safe to show. Let's switch things up and try something else!]

Client → DNS → Domain Controller → AD DS
[Looks like the result wasn't safe to show. Let's switch things up and try something else!]

Windows + Linux Authentication Flow
[Looks like the result wasn't safe to show. Let's switch things up and try something else!]

9. Version History
Version	Date	Changes
1.0	Initial	Created unified testing & validation guide

