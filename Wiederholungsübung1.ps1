# Kapitel 2: Hilfe


    #1. Finden Sie heraus, was der folgende Befehl bewirkt.
	New-PSDrive myHome FileSystem C:\Windows
    get

    #12. Was ist „Date“ für ein Befehl?
        ## Ist das gleiche wie Get-Date!




# Kapitel 3:

    #2. Wandeln Sie die drei positionalen Parameter des Befehls aus 1.) in benannte Parameter um.
    New-PSDrive -name myHome -psprovider FileSystem -root C:\windows

    #7. Finden Sie heraus, ob bereits eine Instanz des Programms „Notepad“ ausgeführt wird.
    Get-Process -name notepad -ErrorAction SilentlyContinue


# Kapitel 4:

    #3. Listen Sie alle Protokolldateien (*.log) aus dem Windows-Ordner und seinen Unterordnern auf.
    Get-ChildItem -Path $env:systemroot\*.log -file -Recurse
    Get-ChildItem -Path C:\Windows -Filter *.log -Recurse

    #13. Erzeugen Sie eine Befehlspipeline, um alle Dienste, welche mit „P“ beginnen, zu beenden.
    Get-Service -name p* | Stop-Service -whatif
    Get-Service | Where-Object { $_.name -like 'P*' } | stop-service -force -whatif

    #14. Entwickeln Sie eine Befehlspipeline, die den Client-DNS-Dienst prüft und bei Bedarf neu startet.
    Get-Service dns* | Where-Object Status -ne Running | Start-Service
    Get-Service dnscache |  where-object { $_.status -notlike 'Running' } | Start-Service

    #16. Erzeugen Sie eine Pipeline, die die Größe des Ordners „c:\program files“ incl. aller Ordner und Files ermittelt!
    Get-ChildItem 'C:\Program Files' -Recurse | Measure-Object -Property length -sum


# Kapitel 5:

    #5. Erstellen Sie einen Schlüssel und einen Eintrag in der Registry.
    Set-Location HKCU:\Software\
    New-Item Test_9102 -ItemType Container
    New-ItemProperty HKCU:\Software\Test_9102\ Testwert -PropertyType DWORD -Value 0x7AFF



    #8. Zeigen Sie den Inhalt der Umgebungsvariable „%Path%“ in der PowerShell an.
    $env:Temp
    Write-Output $env:Path

    #9. Ändern Sie die Umgebungsvariable „%Path%“ so, das Wordpad.exe direkt ausgeführt werden kann!
    $env:Path = "C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;c:\Program Files\Windows NT\Accessories\"
    $env:Path += ";c:\Program Files\Windows NT\Accessories"

    #11. Sie wollen eine Testdatei mit einer Größe von 1MB erstellen. Fällt Ihnen mit der PowerShell ein Weg ein?
    Set-Content $env:TEMP\testdatei.txt ('x' * 1MB)



# Kapitel 6:

    #10. Legen Sie einen neuen Alias „ie“ an, der den Internet Explorer startet.
    New-Alias -name ie -value "C:\Program Files\Internet Explorer\iexplore.exe"

# Hilfe nutzen:

    #4. Stellen Sie die Maximalgröße des Ereignisprotokolls „Windows PowerShell“ auf 20 MB ein.
    Limit-Eventlog -Logname "Windows PowerShell" -MaximumSize 20MB

    #6. Starten Sie den Windows-Editor notepad.exe in einem maximierten Fenster, und sorgen Sie dafür, dass die PS so lange wartet, bis der Editor wieder geschlossen wurde.
    Start-Process notepad -WindowStyle Maximized -Wait
    Start notepad.exe -WindowStyle Maximized -Wait



    #15. Erzeugen Sie eine Pipeline, die die Anzahl der Warnungen im Ereignisprotokoll „system“ der letzten 3 Tage ermittelt!
    Get-EventLog -LogName system -EntryType warning -before (Get-Date).AddHours(72) | Measure-Object -Property Index
    Get-EventLog -LogName system -EntryType warning -before (Get-Date).AddHours(72) | Measure-Object | Select-Object -ExpandProperty count
    get
    Get-EventLog -LogName system | Where-Object -property TimeGenerated -GT (Get-Date).AddDays(-3)
    #17. Erzeugen Sie eine Befehlspipeline, die ermittelt, ob der Security-Patch „KB2729452“ installiert ist.
    Get-HotFix | Where-Object HotfixID -eq "KB3191564"
    get-hotfix | Where-Object { $_.hotfixid -eq 'KB3191564' }

    get-date | select *


    #18. Zeigen Sie alle Patche an, die vor dem 01.01.2012 installiert wurden.
    Get-HotFix | Where-Object InstalledOn -lt "01.01.2012"
    Get-HotFix | Where-Object { $_.InstalledOn -lt "01.01.2012" -and $_.InstalledOn -notlike ""}

    set-location env:
