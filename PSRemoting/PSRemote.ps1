# Powershell-Remoting auf Computer ohne Vertrauensbeziehung (Forest)
# Liste der vertrauenswürdigen entfernten Rechner pflegen:
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "192.168.200.10" -Force
Get-Item WSMan:\localhost\Client\TrustedHosts
# bei beliebigen Zielen:
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force
Get-Item WSMan:\localhost\Client\TrustedHosts

#######################################################################################
# auf dem Zielrechner PS Remoting einschalten: !!!!!!!!!
#Auf dem Remote-Host:
#		Enable-PSRemoting -SkipNetworkProfileCheck -Force
	#Bzw.
#		Enable-PSRemoting -Force
#		Set-NetFirewallRule –Name "WINRM-HTTP-In-TCP-PUBLIC" –RemoteAddress Any
###########################################################################################

# Sitzungsaufbau:
$Credentials = (Get-Credential -Credential "Herdt\administrator")
Enter-PSSession -ComputerName 192.168.200.10 -Credential $Credentials
