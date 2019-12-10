try {
$Eingabe = Read-Host -Prompt "Name der neuen OU (angelegt im Stamm der Domain; Abbruch mit STRG+C)"
New-ADOrganizationalUnit -Name $Eingabe
}
catch {
Write-Host "Etwas ist schief gegangen (OU existiert bereits?) Der Vorgang wird abgebrochen..."
break
}

$DNBasisOU = (Get-ADOrganizationalUnit -Filter 'Name -eq $Eingabe').DistinguishedName

$ImportOU = Import-Csv .\OU-Vorlage.csv -UseCulture
$Struktur = @("Verwaltung","Einkauf","Produktion","Verkauf","Leitung")

foreach ($NeueOU in $ImportOU)
{
    New-ADOrganizationalUnit -Name $NeueOU.Name -Path $DNBasisOU -Description $NeueOU.Description -ProtectedFromAccidentalDeletion:$false
    $SubPath = "OU=" + $NeueOU.Name + "," + $DNBasisOU
    foreach ($Eintrag in $Struktur)
    {
        New-ADOrganizationalUnit -Name ($NeueOU.Sto + "-" + $Eintrag) -Path $SubPath -Description "Abteilung $Eintrag des Standorts"
    }
}