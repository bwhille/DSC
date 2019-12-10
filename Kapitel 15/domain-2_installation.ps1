#individuelle Domänenangaben festlegen
$DomainName = "herdt.ps"
$NetbiosName = "HERDT"

# Hinzufügen eines zweiten Domänencontrollers
Import-Module ADDSDeployment
Install-ADDSDomainController -DomainName $DomainName `
	-SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "Kennw0rt!" -Force) `
	-Credential (Get-Credential -Credential "$NetbiosName\administrator") `
	-NoGlobalCatalog:$False `
	-InstallDns:$False `
	-CreateDnsDelegation:$False `
	-CriticalReplicationOnly:$False `
	-SiteName "Default-First-Site-Name" `
	-LogPath "C:\Windows\NTDS" `
	-DatabasePath "C:\Windows\NTDS" `
	-SysvolPath "C:\Windows\SYSVOL" `
	-NoRebootOnCompletion:$False `
	-Force:$True