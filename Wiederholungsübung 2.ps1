# 1. Kopieren sie Sich den Ordner "Get-Content" aus dem Verzeichnis: \\192.168.20.1\install\01. Kurse\Kurs 9102\ auf Ihre Umgebung.
Copy-Item "\\192.168.20.1\install\01. Kurse\Kurs 9102\Get-Content" -Destination "C:\Get-Content" -Recurse

# Kein direkter Bestandteil der �bung, es vereinfacht bzw. verk�rzt die Schreibweise der folgenden cmdlets
$hp = "C:\Uebung\Get-Content"

# 2. Erstellen sie von allen Dateien in diesem Ordner ein BackUp. (*_bckp.*)
Get-ChildItem $hp | ForEach-Object { Copy-Item -Path $_.FullName -Destination ($_.DirectoryName + "\" + $_.BaseName + "_bckp" + $_.Extension) }

# 3. Erstellen Sie f�r jeden Dateityp einen neuen Ordner.
Get-ChildItem $hp | Sort-Object -Property Extension -unique | ForEach-Object { New-Item -Path $_.Directory -Name ($_.Extension.Split('.')[1]) -ItemType directory }

# 4. Verschieben Sie die Backup-Dateien in diese Ordner.
Get-ChildItem ($hp + "\*_bckp*") | ForEach-Object { Move-Item -Path $_.FullName -Destination ($_.DirectoryName + "\" + $_.Extension.Split('.')[1] + "\")}

# 5. Setzen Sie die BackUp-Dateien "drei" und "eins" auf den Status "Schreibgesch�tzt"
Set-ItemProperty -Path ($hp + "\txt\drei_bckp.txt") -Name IsReadOnly -Value $true
Set-ItemProperty -Path ($hp + "\log\eins_bckp.log") -Name IsReadOnly -Value $true

# 6. Lassen sie Sich alle Eigenschaften der Dateien, innerhalb und au�erhalb der neu angelegten Ordner, anzeigen. Was f�llt Ihnen dabei auf?
Get-ChildItem $hp -Recurse -File | ForEach-Object { Get-ItemProperty $_.FullName | Select-Object -Property Name, Mode, IsReadOnly, Length } | Sort-Object -Property Length |Out-GridView  

# 7. L�schen Sie die normalen Dateien (ohne *_bckp.* im Namen)
Get-ChildItem $hp -File | Remove-Item

# 8. Kopieren Sie die Dateien aus den "BackUp"-Ordnern zur�ck in das Hauptverzeichnis
Get-ChildItem $hp -Directory | ForEach-Object { Copy-Item ($hp + "\" + $_.Name + "\*") $hp }

# Zusatz: Benennen Sie die Dateien wieder um, sodass der Ursprungszustand hergestellt ist
Get-ChildItem $hp -file | ForEach-Object { Rename-Item ($hp + "\" + $_.Name) -NewName ($hp + "\" + $_.Name.Split('_')[0] + $_.Extension)} 

# Zusatz 2: Jede Datei mit Inhalt f�llen
Get-ChildItem $hp -file | ForEach-Object { Add-Content $_.FullName -Value (-join ((33..126) + 10 | Get-Random -Count 512 | % {[char]$_} )) }

