<#
Phase 5 — DC‑01 GPO Baseline Commands
This script creates and links the DC01 Security Baseline GPO and applies core settings.
#>

# Create the baseline GPO
New-GPO -Name "DC01-Security-Baseline" -Comment "Phase 5 hardening baseline for DC-01"

# Link the GPO to the Domain Controllers OU
New-GPLink -Name "DC01-Security-Baseline" -Target "OU=Domain Controllers,DC=lab,DC=local"

# -----------------------------
# Account Policy Configuration
# -----------------------------
Set-ADDefaultDomainPasswordPolicy `
    -Identity "lab.local" `
    -MinPasswordLength 14 `
    -PasswordHistoryCount 24 `
    -MaxPasswordAge (New-TimeSpan -Days 60) `
    -MinPasswordAge (New-TimeSpan -Days 1) `
    -ComplexityEnabled $true `
    -ReversibleEncryptionEnabled $false

# -----------------------------
# Kerberos Policy (Registry-based)
# -----------------------------
Set-GPRegistryValue -Name "DC01-Security-Baseline" `
    -Key "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" `
    -ValueName "MaxTicketAge" -Type DWord -Value 10

Set-GPRegistryValue -Name "DC01-Security-Baseline" `
    -Key "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters" `
    -ValueName "MaxRenewAge" -Type DWord -Value 7

# -----------------------------
# Security Options
# -----------------------------
# NTLMv2 only
Set-GPRegistryValue -Name "DC01-Security-Baseline" `
    -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" `
    -ValueName "LmCompatibilityLevel" -Type DWord -Value 5

# Disable anonymous SID enumeration
Set-GPRegistryValue -Name "DC01-Security-Baseline" `
    -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" `
    -ValueName "RestrictAnonymousSAM" -Type DWord -Value 1

# -----------------------------
# Firewall Rules (Core DC Ports)
# -----------------------------
$rules = @(
    @{ Name="Allow-RPC";      Port=135; Protocol="TCP" }
    @{ Name="Allow-LDAP";     Port=389; Protocol="TCP" }
    @{ Name="Allow-LDAP-UDP"; Port=389; Protocol="UDP" }
    @{ Name="Allow-Kerberos"; Port=88;  Protocol="TCP" }
    @{ Name="Allow-KerberosU";Port=88;  Protocol="UDP" }
    @{ Name="Allow-DNS";      Port=53;  Protocol="TCP" }
    @{ Name="Allow-DNS-UDP";  Port=53;  Protocol="UDP" }
    @{ Name="Allow-SMB";      Port=445; Protocol="TCP" }
)

foreach ($rule in $rules) {
    New-NetFirewallRule -DisplayName $rule.Name `
        -Direction Inbound `
        -Protocol $rule.Protocol `
        -LocalPort $rule.Port `
        -Action Allow `
        -Profile Domain
}
