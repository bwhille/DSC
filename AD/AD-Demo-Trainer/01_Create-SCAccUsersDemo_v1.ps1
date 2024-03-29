#Service Accounts
Write-Host "Starting to create and process new service accounts" -ForegroundColor Green
$count = 0
sl C:\PS\AD
Import-Csv "New-SRVUsers_Demo.csv" | ForEach-Object {
    $count = $count + 1
    #Write-Host "Creating Service Account: $_.Name - $userPrinc" -ForegroundColor Green
    $userPrinc = $_."Logon Username" + "@herdt.ps"
    New-ADUser  -Name $_.Name `
        -Path $_."Container" `
        -SamAccountName $_."Logon Username" `
        -GivenName $_."First Name" `
        -AccountPassword (ConvertTo-SecureString "Passw0rd1"  -AsPlainText -Force ) `
        -SurName $_."Last Name" `
        -Description $_."Description" `
        -UserPrincipalName $userPrinc `
        -DisplayName $_."Name" `
        -Enabled $true ;`
    
    
    Set-ADUser -identity $_."Logon Username"  -ChangePasswordAtLogon $false 
}

Write-Host "Created and processed: $count Service Accounts" -ForegroundColor Green
