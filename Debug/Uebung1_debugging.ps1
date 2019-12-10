 function get-timeup {
Param ( [String] $RechnerName = $env:COMPUTERNAME )
$daten = Get-WmiObject Win32_OperatingSystem -ComputerName $RechnerName
if($daten.LastBootUpTime)
    {
    $startzeit = $daten.ConvertToDateTime($daten.LastBootUpTime)
    $zeitpanne = (Get-Date) - $startzeit

    Write-Output ("Rechnername  : $RechnerName")
    Write-Output ("Letzter Start: " + ($startzeit).ToString("dd.MM.yyyy hh:mn:ss"))
    Write-Output ("Läuft seit   : " + $zeitspanne.Day + "Tage " + $zeitspanne.Hour + " Stunden " + $zeitspanne.Minute + " Minuten")
    }
else
    {
    Write-Warning "keine Verbindung zu $RechnerName."
    }
} 

get-timeup
