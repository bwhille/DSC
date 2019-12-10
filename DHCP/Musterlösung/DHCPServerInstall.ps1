# Rolle incl MgmtTools installieren:
Install-WindowsFeature DHCP -IncludeManagementTools
# Erstellen von DHCP-Sicherheitsgruppen via netsh Befehl
netsh dhcp add securitygroups
# Neustart des DHCP Dienstes
Restart-Service dhcpserver
#DHCP-Server im AD Authorisieren und prüfen
Add-DhcpServerInDC -DnsName Test-DC1.herdt.ps -IPAddress 192.168.200.10
Get-DhcpServerInDC
#Configure scope Spielwiese
Add-DhcpServerv4Scope -name "herdt" -StartRange 192.168.200.10 -EndRange 192.168.200.150 -SubnetMask 255.255.255.0 -State Active 
#GW
Set-DhcpServerv4OptionValue -OptionID 3 -Value 192.168.200.1 -ScopeID 192.168.200.0 -ComputerName Test-DC1.herdt.ps
#DNS
Set-DhcpServerv4OptionValue -DnsDomain herdt.ps -DnsServer 192.168.200.10
#Lease Duration
Set-DhcpServerv4Scope -scopeid 192.168.200.0  -LeaseDuration 4.00:00:00
# Neustart des DHCP Dienstes
Restart-Service dhcpserver
#Warnungsunterdrückung durch Registryeintrag registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2
Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2
