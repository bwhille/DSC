Write-Host "Starting to create and process OU Structure and Groups" -ForegroundColor Green

# create OU structure Top Level
New-ADObject -Type OrganizationalUnit -Name 'Demo Users' -Path "DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Demo Clients' -Path "DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Demo Servers' -Path "DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Demo Mobile Devices' -Path "DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Demo Groups' -Path "DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Demo Service Accounts' -Path "DC=herdt,DC=ps"

#First Level OU

New-ADObject -Type OrganizationalUnit -Name 'System Center' -Path "OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Departments'  -Path "OU=Demo Users,DC=herdt,DC=ps"

#Second Level OU
New-ADObject -Type OrganizationalUnit -Name 'Finance' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Human Resources' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Information Technology' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Marketing' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Research' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Management' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Sales' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'Solutions' -Path "OU=Departments,OU=Demo Users,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCCM' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCOM' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCDPM' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCSM' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCVMM' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"
New-ADObject -Type OrganizationalUnit -Name 'SCO' -Path "OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps"

# create user groups

New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Finance' -SamAccountName 'Finance' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Human Resources' -SamAccountName 'Human Resources' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Information Technology' -SamAccountName 'Information Technology' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Marketing' -SamAccountName 'Marketing' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Management' -SamAccountName 'Management' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Research' -SamAccountName 'Research' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Sales' -SamAccountName 'Sales' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=Demo Groups,DC=herdt,DC=ps" -Name 'Solutions' -SamAccountName 'Solutions' -GroupCategory Security -GroupScope DomainLocal


#Create Service account groups

New-ADGroup -Path "OU=SCCM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCCM Global Admins' -SamAccountName 'SCCM Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCCM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCCM Site Servers' -SamAccountName 'SCCM Site Servers' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCCM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCCM Site Systems' -SamAccountName 'SCCM Site Systems' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCDPM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCDPM Global Admins' -SamAccountName 'SCDPM Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCO,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCO Global Admins' -SamAccountName 'SCO Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCO,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCO_CON_Users' -SamAccountName 'SCO_CON_Users' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCO,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCO_RBD_Users' -SamAccountName 'SCO_RBD_Users' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCOM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCOM Global Admins' -SamAccountName 'SCOM Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCSM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCSM Global Admins' -SamAccountName 'SCSM Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCSM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCSM Report Global Admins' -SamAccountName 'SCSM Report Global Admins' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCSM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCSM Report Publishers' -SamAccountName 'SCSM Report Publishers' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCSM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCSM Report Readers' -SamAccountName 'SCSM Report Readers' -GroupCategory Security -GroupScope DomainLocal -Description 'SCSM SSRS Report accesed by Users'
New-ADGroup -Path "OU=SCSM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCSM Srv Accounts' -SamAccountName 'SCSM Srv Accounts' -GroupCategory Security -GroupScope DomainLocal
New-ADGroup -Path "OU=SCVMM,OU=System Center,OU=Demo Service Accounts,DC=herdt,DC=ps" -Name 'SCVMM Global Admins' -SamAccountName 'SCVMM Global Admins' -GroupCategory Security -GroupScope DomainLocal


Write-Host "Completed processing of OU Structure and Groups" -ForegroundColor Green