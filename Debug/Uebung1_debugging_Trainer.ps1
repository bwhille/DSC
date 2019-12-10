#Set-PSDebug -trace 1
# Set-PSDebug -Trace 2 -step
Set-PSDebug -Off

# Set a breakpoint on line 18.
Set-PSBreakpoint -Script C:\PS2\Debugging\Uebung1_debugging_Trainer.ps1 -Line 18

# Also set a breakpoint that outputs data to a debugging file
# each time $properties is written to
Set-PSBreakpoint -Script C:\PS2\Debugging\Uebung1_debugging_Trainer.ps1 -Variable zeitpanne -Mode Write -Action { $zeitpanne | Out-File C:\PS2\Debugging\Übung1.txt -append }






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
