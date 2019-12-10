#individuelle Werte IPV4 und Rechnername festlegen
$Ip4Address	= "192.168.200.10"
$Ip4Prefix = "24"
$Ip4Gateway = "192.168.200.1"
$RechnerNameNeu = "Test-DC1"

$Adapter = (Get-NetAdapter).InterfaceAlias

#IP-Adresse zuweisen
New-NetIPAddress -IPAddress $Ip4Address -PrefixLength $Ip4Prefix -InterfaceAlias $Adapter -DefaultGateway $Ip4Gateway

#Rechner umbenennen
Rename-Computer -NewName $RechnerNameNeu -Force

#Rechner neu starten
Restart-Computer
