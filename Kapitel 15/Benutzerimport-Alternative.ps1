﻿Import-Csv -Path .\Verwaltung-Neue-MA.csv -UseCulture -Encoding Default | `ForEach-Object {    Write-Host "Lege Benutzer" $_.Name "an..."    If($_.City -eq "Hildesheim")    {        $StoText = "Zentrale --- "    }    Else    {        $StoText = "Filiale --- "    }    New-ADUser  -Name $_.Name `		-GivenName $_.GivenName `		-Surname $_.Surname `		-SamAccountName $_.sAMAccountName `		-Path $_.Path `		-StreetAddress $_.StreetAddress `		-PostalCode $_.PostalCode `		-City $_.City `		-AccountPassword (ConvertTo-SecureString -AsPlainText ($_.TempPass) -Force) `		-Description ($StoText + "Temporäres Kennwort: " + $_.TempPass) `		-Enabled:$True `		-ChangePasswordAtLogon:$True}