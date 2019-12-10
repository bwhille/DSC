#individuelle Werte IPV4 und Rechnername festlegen
$Ip4Address	= "192.168.200.20"		#Wert für künftigen 2. DC
$Ip4Prefix = "24"					#wie in Bsp. 1
$Ip4Gateway = "192.168.200.1"		#wie in Bsp. 1
$Ip4DnsPrimary = "192.168.200.10"	#Domänen-DNS, IP von DC1
$RechnerNameNeu = "Test-DC2"		#Wert für künftigen 2. DC

$Adapter = (Get-NetAdapter).InterfaceAlias

#IP-Adresse zuweisen
New-NetIPAddress -IPAddress $Ip4Address -PrefixLength $Ip4Prefix -InterfaceAlias $Adapter -DefaultGateway $Ip4Gateway

#DNS-Servereintrag vornehmen
Set-DnsClientServerAddress -InterfaceAlias $Adapter -ServerAddresses $Ip4DnsPrimary

#Rechner umbenennen
Rename-Computer -NewName $RechnerNameNeu -Force

#Installation von AD-Domänendiensten
Add-WindowsFeature -Name "AD-Domain-Services" -IncludeAllSubFeature -IncludeManagementTools

#Rechner neu starten
Restart-Computer
