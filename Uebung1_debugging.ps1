 function get-timeup {
Param ( [String] $RechnerName = $env:COMPUTERNAME )
$daten = Get-WmiObject Win32_OperatingSystem -ComputerName $RechnerName
if($daten.LastBootUpTime)
    {
    $startzeit = $daten.ConvertToDateTime($daten.LastBootUpTime)
    $zeitspanne = (Get-Date) - $startzeit

    Write-Output ("Rechnername : $RechnerName")
    Write-Output ("Letzter Start: " + ($startzeit).ToString("dd.MM.yyyy hh:mn:ss"))
    Write-Output ("Läuft seit  : " + $zeitspanne.Days + "Tage " + $zeitspanne.Hours + " Stunden " + $zeitspanne.Minutes + " Minuten")
    }
else
    {
    Write-Warning "keine Verbindung zu $RechnerName."
    }
} 

get-timeup
