# Cmdlets für die AD-Verwaltung
# Zu Begin die grundlegenden Cmdlet
# Im weiteren Verlauf folgen zunehmend komplexere Beispiele
# 
# In dem Buch "PowerShell 5 - Grundlagen und Verwaltung des Active Directory" finden Sie ab Kapitel 11 entsprechenden Inhalt
# Beispielcode können Sie auf der Verlagsseite herunter laden
#
#----------------------------------------------------------------------------------------------------------------------------
# Falls nicht vorhanden, Modul importieren
#
Get-Module ActiveDirectory

#----------------------------------------------------------------------------------------------------------------------------
# Befehle anzeigen lassen
#
Get-Command -Module ActiveDirectory

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu allen AD-Usern abfragen
#
Get-ADUser -Filter *

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu allen AD-Gruppen abfragen
#
Get-ADGroup -Filter *

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu allen AD-Organisationseinheiten abfragen
#
Get-ADOrganizationalUnit -Filter *

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu allen AD-Computern abfragen
#
Get-ADComputer -Filter *

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu einer Organisationseinheit "Domain Controllers" abrufen
#
Get-ADOrganizationalUnit -Filter {Name -eq "Domain Controllers"}

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu dem Benutzer hans dampf auslesen
#
Get-ADUser -filter {cn -eq "Max Mustermann"} 

#----------------------------------------------------------------------------------------------------------------------------
# Informationen zu einem Server mit dem Namen CL1W10 abrufen 
# 
Get-ADComputer -Filter {Name -eq  "CL1W10"}

#----------------------------------------------------------------------------------------------------------------------------
# Minimaleingabe
# Neuen ADComputer "Client01" anlegen
#
New-ADComputer -Name "Client05"

#----------------------------------------------------------------------------------------------------------------------------
# Grundgerüst
# Neuen ADComputer "Client02" in der OU "Koblenz" anlegen (OU muss vorhanden sein)
#
New-ADComputer -Name "Client06" -Path "OU=Koblenz,DC=spielwiese,DC=intern"

#----------------------------------------------------------------------------------------------------------------------------
# Minimaleingabe
# Neue ADGruppe anlegen
#
New-ADGroup -Name "KIT_Berlin" -GroupScope Global

#----------------------------------------------------------------------------------------------------------------------------
# Grundgerüst
# Neue ADGruppe anlegen -> OU = Koblenz, als domänenlokale Sicherheitsgruppe
#
New-ADGroup -Name "PS_II_KIT_Berlin" -GroupCategory Security -GroupScope DomainLocal -Path "OU=Berlin,DC=spielwiese,DC=intern"

#----------------------------------------------------------------------------------------------------------------------------
# Minimaleingabe
# Neue AD-OU "Koblenz" anlegen
#
New-ADOrganizationalUnit -Name "Berlin"

#----------------------------------------------------------------------------------------------------------------------------
# Grundgerüst
# Neue AD-OU "Team KIT-Koblenz"in ou "KIT-Koblenz" anlegen, kein Schutz vor versehentlichem Löschen
#
New-ADOrganizationalUnit -Name "TEAM KIT-Koblenz" -Path "OU=Koblenz,DC=spielwiese,DC=intern" -ProtectedFromAccidentalDeletion:$false

#----------------------------------------------------------------------------------------------------------------------------
# Detailiert
# Neue AD-OU "Koblenz" in der OU "KIT", mit Beschreibung
#
New-ADOrganizationalUnit -Name "Test-KIT-Koblenz" -Path "OU=Koblenz,DC=spielwiese,DC=intern" -City "Koblenz" -Country "DE" -PostalCode 56076 -State "Rheinland-Pfalz" -Description "Ressourcen im KIT Koblenz"

#----------------------------------------------------------------------------------------------------------------------------
# Minimaleingabe
# Neuen ADUser anlegen --> Neue Benutzer ohne Kennwort sind deaktiviert
#
New-ADUser -Name "Max Schmidt"

#----------------------------------------------------------------------------------------------------------------------------
# Grundgerüst
# ADUser anlegen
#
New-ADUser -Name "Karl Mustermann" -SamAccountName "Karl.mustermann" -Path "OU=Benutzer,DC=spielwiese,DC=intern"

#----------------------------------------------------------------------------------------------------------------------------
# Detailiert
# ADUser anlegen
#
New-ADUser -Path "OU=Benutzer,DC=spielwiese,DC=intern" -Name "Otto Mustermann" -Surname "Mustermann" -GivenName "Otto" -SamAccountName "otto.mustermann" -UserPrincipalName "otto.mustermann@spielwiese.intern" -Description "Ein echter Mustermann" -Company "Muster und Mustermann" -Department "IT" -Office "Koblenz" -AccountPassword (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force) -ChangePasswordAtLogon:$true -Enabled:$true

#----------------------------------------------------------------------------------------------------------------------------
# ADComputer anpassen
# Standort eines ADComputers ändern
#
Set-ADComputer -Identity "CN=Client01,CN=Computers,DC=spielwiese,DC=intern" -Location "Schulungsraum xyz, am Fenster"

#----------------------------------------------------------------------------------------------------------------------------
# ADGroup anpassen
# Allen Gruppen in der OU=Koblenz den Benutzer Max Mustermann zum Verwalter machen
#
Get-ADGroup -Filter * -SearchBase "OU=Koblenz,DC=spielwiese,DC=intern" | Set-ADGroup -ManagedBy "CN=Max Mustermann,CN=Users,DC=spielwiese,DC=intern"

#----------------------------------------------------------------------------------------------------------------------------
# Beschreibung der OU Koblenz ändern
# 
Set-ADOrganizationalUnit -Identity "OU=Koblenz,DC=spielwiese,DC=intern" -Description "In dieser OU sind alle User und Gruppen aus Koblenz zusammengefasst."

#----------------------------------------------------------------------------------------------------------------------------
# Max Mustermann soll sich an der Arbeitsstation "Client01" anmelden können
#
Set-ADUser -Identity "CN=Max Mustermann,CN=Users,DC=spielwiese,DC=intern" -LogonWorkstation "Client1"

#----------------------------------------------------------------------------------------------------------------------------
# Mehrfachbearbeitung an einem Objekt
# 
#
Set-ADUser -Identity "CN=Max Mustermann,CN=Users,DC=spielwiese,DC=intern" -Add @{otherTelephone=999222434;url="spielwiese.intern"}

#----------------------------------------------------------------------------------------------------------------------------
# ADUser entfernen
####Remove-ADUser -Identity "CN=Max Mustermann,CN=Users,DC=spielwiese,DC=intern" 