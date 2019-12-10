$xml = 
foreach ($User in (get-AdUser -filter * -SearchBase "OU=Path,DC=spielwiese,DC=intern" -Property *)){
    $DisplayName = $User.DisplayName
    $EmailAddress = $User.EmailAddress
    $OfficePhone = $User.OfficePhone
    $MobilePhone = $User.MobilePhone
    $Office = $User.Office
    $Department = $User.Department

    $Prop=[ordered]@{
        "DisplayName" = $DisplayName
        'EmailAddress' = $EmailAddress
        'OfficePhone' = $OfficePhone
        'MobilePhone' = $MobilePhone
        'Office' = $Office
        'Department' = $Department
    }
    New-Object -TypeName PSObject -Property $Prop
}

$xml | Export-Clixml W:\skripts\OutFile.xml