# DC‑01 Certificate Configuration

## 🔐 Overview
Certificates are required for secure Kerberos authentication, LDAP signing, and DC identity validation.

## 🧩 Certificates Deployed
- Domain Controller Authentication
- Kerberos Authentication
- Directory Email Replication (if applicable)
- Auto‑enrollment enabled via GPO

## 🛠️ Configuration Steps
1. Enable Certificate Auto‑Enrollment in GPO  
2. Ensure DC has a valid certificate template  
3. Validate CRL distribution points  
4. Confirm certificate is installed in the Local Computer → Personal store

## 🧪 Verification Commands
certutil -dcinfo verify  
certutil -viewstore my  
certutil -getreg  

