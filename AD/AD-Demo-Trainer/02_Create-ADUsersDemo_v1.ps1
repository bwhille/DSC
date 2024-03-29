#New Users
Write-Host "Starting to create and process new users" -ForegroundColor Green
$count = 0
sl C:\PS\AD
Import-Csv "New-Users_DEMO.csv" | ForEach-Object {
    $count = $count + 1    
    #Write-Host "Creating User: $_.Name - $userPrinc" -ForegroundColor Yellow
    $userPrinc = $_."Logon Username" + "@herdt.ps"
    New-ADUser  -Name $_.Name `
        -Path $_."Container" `
        -SamAccountName $_."Logon Username" `
        -GivenName $_."First Name" `
        -AccountPassword (ConvertTo-SecureString "Passw0rd1"  -AsPlainText -Force ) `
        -SurName $_."Last Name" `
        -Description $_."Department" `
        -UserPrincipalName $userPrinc `
        -DisplayName $_."Name" `
        -Enabled $true ;`
    
    Add-ADGroupMember -identity $_."Department" -Members $_."Logon Username"

    Set-ADUser -identity $_."Logon Username"  -ChangePasswordAtLogon $false 
}

Write-Host "Created and processed: $count Users" -ForegroundColor Green