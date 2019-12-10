# Einfache Befehlsstruktur zum Anlegen von Benutzern
# Beachten Sie dass z. B. eine entsprechende OU auch vorhanden ist
#----------------------------------------------------
$vorname = "Thea"
$nachname = "Held"
$AdUWerte = @{
    Path = "OU=Benutzer,DC=spielwiese,DC=intern"
    Name = "$vorname $nachname"
    Surname = "$nachname"
    GivenName = "$vorname"
    SamAccountName = "$vorname.$nachname"
    UserPrincipalName = "$($vorname.ToLower()).$($nachname.ToLower())@spielwiese.intern"
    Description = "Ein echter Mustermann"
    Company = "Muster und Mustermann"
    Department = "IT"
    Office = "Koblenz"
    AccountPassword = (ConvertTo-SecureString -AsPlainText "P@ssw0rd" -Force)
    ChangePasswordAtLogon =$true
    Enabled = $true
    }
New-ADUser @AdUWerte