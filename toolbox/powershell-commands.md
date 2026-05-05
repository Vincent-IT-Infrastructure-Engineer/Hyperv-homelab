# PowerShell Commands – Operational Reference Guide  
Enterprise Lab – April 2026  
Author: Vincent – IT Infrastructure Engineer  

---

## 📌 Overview  
This guide provides a structured reference for all PowerShell commands used across the enterprise homelab, including:

- Active Directory  
- DNS & DHCP  
- Hyper‑V  
- Security & Hardening  
- Troubleshooting  
- Remote Management  

Each command includes a clear explanation of what it does and why it is used.

---

## 🧩 Active Directory – User, Group & OU Operations  

### Create a new AD user  
```powershell
New-ADUser -Name "John Smith" -GivenName "John" -Surname "Smith" `
-Department "IT" -Path "OU=IT,DC=lab,DC=local" `
-AccountPassword (Read-Host -AsSecureString "Password") `
-Enabled $true
Purpose: Creates a fully configured AD user, places them in the correct OU, sets a password, and enables the account.

Add a user to a group
powershell
Add-ADGroupMember -Identity "IT-Staff" -Members "John Smith"
Purpose: Assigns the user to a security group for permissions and access control.

Bulk‑create users from CSV
powershell
Import-Csv .\new_users.csv | ForEach-Object {
    New-ADUser -Name $_.Name -SamAccountName $_.Sam `
    -Path $_.OU -Enabled $true `
    -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}
Purpose: Automates onboarding by creating multiple users from a CSV file.

List all users in an OU
powershell
Get-ADUser -Filter * -SearchBase "OU=IT,DC=lab,DC=local"
Purpose: Displays all users inside a specific OU for auditing or verification.

🔁 Active Directory – Replication & Domain Controller Health
Check replication status
powershell
Get-ADReplicationPartnerMetadata -Target * | Format-Table Server,LastReplicationSuccess
Purpose: Shows when each DC last replicated successfully — critical for AD health.

Check core DC services
powershell
Get-Service -Name DNS,NTDS,KDC
Purpose: Confirms that DNS, Directory Services, and Kerberos are running.

Verify SYSVOL & NETLOGON shares
powershell
Get-SmbShare | Where-Object Name -in "SYSVOL","NETLOGON"
Purpose: Ensures the DC is advertising the required shares for GPO and logon scripts.

🌐 DNS & DHCP – Validation & Troubleshooting
List all DNS A records
powershell
Get-DnsServerResourceRecord -ZoneName "lab.local"
Purpose: Shows all host records in the DNS zone — useful for checking stale or missing entries.

Check DNS forwarders
powershell
Get-DnsServerForwarder
Purpose: Displays upstream DNS servers used for external resolution.

List DHCP scopes
powershell
Get-DhcpServerv4Scope
Purpose: Shows all configured IPv4 scopes on the DHCP server.

Show active DHCP leases
powershell
Get-DhcpServerv4Lease -ScopeId 10.0.0.0
Purpose: Lists all devices currently leasing an IP from the specified scope.

🖥 Hyper‑V – VM Deployment & Host Management
Create a new VM
powershell
New-VM -Name "LAB-DC03" -MemoryStartupBytes 4GB -Generation 2 -SwitchName "Lab-Switch"
Purpose: Creates a Generation 2 VM with 4GB RAM and attaches it to the lab virtual switch.

Attach an ISO
powershell
Set-VMDvdDrive -VMName "LAB-DC03" -Path "C:\ISOs\Server2022.iso"
Purpose: Mounts an ISO to the VM for OS installation.

Start or stop a VM
powershell
Start-VM -Name "LAB-DC03"
Stop-VM -Name "LAB-DC03"
Purpose: Controls VM power state.

Check VM network adapters
powershell
Get-VMNetworkAdapter -VMName "LAB-DC03"
Purpose: Shows NIC configuration, MAC address, VLAN, and switch mapping.

List all VMs with status
powershell
Get-VM | Select-Object Name, State, Status
Purpose: Provides a quick operational overview of all VMs.

🔐 Remote Management – WinRM & Host Access
Enable WinRM
powershell
Enable-PSRemoting -Force
Purpose: Enables remote PowerShell management — required for Hyper‑V remote administration.

Run commands on a remote host
powershell
Invoke-Command -ComputerName HV01 -ScriptBlock { Get-VM }
Purpose: Executes PowerShell commands on the Hyper‑V host remotely.

Copy files to a remote host
powershell
Copy-Item .\script.ps1 -Destination "C$\Scripts" -ToSession (New-PSSession HV01)
Purpose: Transfers files securely to a remote server.

🛡 Security & Hardening – Audit & Compliance
Audit local admin group
powershell
Get-LocalGroupMember -Group "Administrators"
Purpose: Shows who has local admin rights — essential for least‑privilege enforcement.

Check installed updates
powershell
Get-HotFix | Sort-Object InstalledOn
Purpose: Lists all Windows updates in chronological order.

List running services
powershell
Get-Service | Where-Object Status -eq "Running"
Purpose: Provides a quick view of active services for security or performance checks.

Check open ports
powershell
Get-NetTCPConnection | Select-Object LocalPort, RemoteAddress, State
Purpose: Shows active TCP connections — useful for detecting unexpected listeners.

🧪 Troubleshooting & Diagnostics
Check event logs
powershell
Get-WinEvent -LogName System -MaxEvents 50
Purpose: Retrieves the latest system events for rapid fault diagnosis.

Test network connectivity
powershell
Test-NetConnection -ComputerName DC01 -Port 3389
Purpose: Tests TCP connectivity to a host and port (e.g., RDP).

Check disk usage
powershell
Get-PSDrive -PSProvider FileSystem
Purpose: Shows free/used space on all file system drives.

Restart a service
powershell
Restart-Service -Name "DNS"
Purpose: Restarts a Windows service — often used after config changes.

⚡ Useful One‑Liners
Find large files
powershell
Get-ChildItem -Path C:\ -Recurse | Sort-Object Length -Descending | Select-Object -First 20
Purpose: Identifies the largest files on the system.

Search for text inside files
powershell
Select-String -Path *.log -Pattern "error"
Purpose: Scans log files for specific keywords.

Quick system info
powershell
Get-ComputerInfo | Select-Object OSName, WindowsVersion, CsManufacturer, CsModel
Purpose: Provides a concise summary of OS and hardware details.
