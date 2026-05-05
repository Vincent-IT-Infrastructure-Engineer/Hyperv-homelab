PowerShell Commands – Operational Reference Guide

Enterprise Lab – April 2026Author: Vincent – IT Infrastructure Engineer

📌 Overview

This guide provides a structured reference for all PowerShell commands used across the enterprise homelab, including:

Active Directory

DNS & DHCP

Hyper‑V

Security & Hardening

Troubleshooting

Remote Management

Each command includes a plain‑English explanation so the reader understands why it is used and what outcome it produces.

📚 Table of Contents

Active Directory – User, Group & OU Operations

Active Directory – Replication & DC Health

DNS & DHCP – Validation & Troubleshooting

Hyper‑V – VM Deployment & Host Management

Remote Management – WinRM & Host Access

Security & Hardening – Audit & Compliance

Troubleshooting & Diagnostics

Useful One‑Liners

🧩 Active Directory – User, Group & OU Operations

Create a new AD user

New-ADUser -Name "John Smith" -GivenName "John" -Surname "Smith" `
-Department "IT" -Path "OU=IT,DC=lab,DC=local" `
-AccountPassword (Read-Host -AsSecureString "Password") `
-Enabled $true

What it does: Creates a fully configured AD user, places them in the correct OU, sets a password, and enables the account.

Add a user to a group

Add-ADGroupMember -Identity "IT-Staff" -Members "John Smith"

What it does: Adds the user to the specified security group for permissions and access control.

Bulk‑create users from CSV

Import-Csv .\new_users.csv | ForEach-Object {
    New-ADUser -Name $_.Name -SamAccountName $_.Sam `
    -Path $_.OU -Enabled $true `
    -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force)
}

What it does: Automates onboarding by creating multiple users from a CSV file.

List all users in an OU

Get-ADUser -Filter * -SearchBase "OU=IT,DC=lab,DC=local"

What it does: Shows all users inside a specific OU for auditing or verification.

🔁 Active Directory – Replication & DC Health

Check replication status

Get-ADReplicationPartnerMetadata -Target * | Format-Table Server,LastReplicationSuccess

What it does: Displays when each DC last replicated successfully — critical for AD health.

Check core DC services

Get-Service -Name DNS,NTDS,KDC

What it does: Confirms that DNS, Directory Services, and Kerberos are running.

Verify SYSVOL & NETLOGON shares

Get-SmbShare | Where-Object Name -in "SYSVOL","NETLOGON"

What it does: Ensures the DC is advertising the required shares for GPO and logon scripts.

🌐 DNS & DHCP – Validation & Troubleshooting

List all DNS A records

Get-DnsServerResourceRecord -ZoneName "lab.local"

What it does: Shows all host records in the DNS zone — useful for checking stale or missing entries.

Check DNS forwarders

Get-DnsServerForwarder

What it does: Displays upstream DNS servers used for external resolution.

List DHCP scopes

Get-DhcpServerv4Scope

What it does: Shows all configured IPv4 scopes on the DHCP server.

Show active DHCP leases

Get-DhcpServerv4Lease -ScopeId 10.0.0.0

What it does: Lists all devices currently leasing an IP from the specified scope.

🖥 Hyper‑V – VM Deployment & Host Management

Create a new VM

New-VM -Name "LAB-DC03" -MemoryStartupBytes 4GB -Generation 2 -SwitchName "Lab-Switch"

What it does: Creates a Generation 2 VM with 4GB RAM and attaches it to the lab virtual switch.

Attach an ISO

Set-VMDvdDrive -VMName "LAB-DC03" -Path "C:\ISOs\Server2022.iso"

What it does: Mounts an ISO to the VM for OS installation.

Start or stop a VM

Start-VM -Name "LAB-DC03"
Stop-VM -Name "LAB-DC03"

What it does: Controls VM power state.

Check VM network adapters

Get-VMNetworkAdapter -VMName "LAB-DC03"

What it does: Shows NIC configuration, MAC address, VLAN, and switch mapping.

List all VMs with status

Get-VM | Select-Object Name, State, Status

What it does: Provides a quick operational overview of all VMs.

🔐 Remote Management – WinRM & Host Access

Enable WinRM

Enable-PSRemoting -Force

What it does: Turns on remote PowerShell management — required for Hyper‑V remote administration.

Run commands on a remote host

Invoke-Command -ComputerName HV01 -ScriptBlock { Get-VM }

What it does: Executes PowerShell commands on the Hyper‑V host remotely.

Copy files to a remote host

Copy-Item .\script.ps1 -Destination "C$\Scripts" -ToSession (New-PSSession HV01)

What it does: Transfers files securely to a remote server.

🛡 Security & Hardening – Audit & Compliance

Audit local admin group

Get-LocalGroupMember -Group "Administrators"

What it does: Shows who has local admin rights — essential for least‑privilege enforcement.

Check installed updates

Get-HotFix | Sort-Object InstalledOn

What it does: Lists all Windows updates in chronological order.

List running services

Get-Service | Where-Object Status -eq "Running"

What it does: Provides a quick view of active services for security or performance checks.

Check open ports

Get-NetTCPConnection | Select-Object LocalPort, RemoteAddress, State

What it does: Shows active TCP connections — useful for detecting unexpected listeners.

🧪 Troubleshooting & Diagnostics

Check event logs

Get-WinEvent -LogName System -MaxEvents 50

What it does: Retrieves the latest system events for rapid fault diagnosis.

Test network connectivity

Test-NetConnection -ComputerName DC01 -Port 3389

What it does: Tests TCP connectivity to a host and port (e.g., RDP).

Check disk usage

Get-PSDrive -PSProvider FileSystem

What it does: Shows free/used space on all file system drives.

Restart a service

Restart-Service -Name "DNS"

What it does: Restarts a Windows service — often used after config changes.

⚡ Useful One‑Liners

Find large files

Get-ChildItem -Path C:\ -Recurse | Sort-Object Length -Descending | Select-Object -First 20

What it does: Identifies the largest files on the system.

Search for text inside files

Select-String -Path *.log -Pattern "error"

What it does: Scans log files for specific keywords.

Quick system info

Get-ComputerInfo | Select-Object OSName, WindowsVersion, CsManufacturer, CsModel

What it does: Provides a concise summary of OS and hardware details.