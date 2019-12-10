#individuelle Dom�nenangaben festlegen
$DomainName = "herdt.ps"
$NetbiosName = "HERDT"

#Installation von AD-Dom�nendiensten, DNS-Server und Gruppenrichtlinienverwaltung
Start-Job -Name neueFeatures -ScriptBlock 
{
	Add-WindowsFeature -Name "AD-Domain-Services" -IncludeAllSubFeature -IncludeManagementTools
	Add-WindowsFeature -Name "DNS" -IncludeAllSubFeature -IncludeManagementTools
	Add-WindowsFeature -Name "GPMC" -IncludeAllSubFeature -IncludeManagementTools
}
Wait-Job -Name neueFeatures

# Erstellen einer neuen Gesamtstruktur + Dom�nencontroller in der Stammdom�ne
Import-Module ADDSDeployment
Install-ADDSForest -DomainName $DomainName `
	-DomainNetbiosName $NetbiosName `
	-ForestMode "WinThreashold" `
	-InstallDns:$True `
	-CreateDnsDelegation:$False `
	-LogPath "C:\Windows\NTDS" `
	-DatabasePath "C:\Windows\NTDS" `
	-SysvolPath "C:\Windows\SYSVOL" `
	-SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "Kennw0rt!" -Force) `
	-NoRebootOnCompletion:$False `
	-Force:$True