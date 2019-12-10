function New-WS19Diff ($VMName = "DC02", $MemorySize = 2GB , $VHDSize = 53687091200, $vmhub= (Get-VMSwitch -Name Intern), $Masterplatte = ".\WS2019Master1911.vhdx") 
{

# Windows Server 2019 als Differenz-Gastsystem

$Basepath = "C:\vms\"
$VHDPath = "$Basepath\$VMName\$VMName.vhdx"
$VMPath = "$Basepath\$VMName"


if (!(Test-Path $VMPath)) {New-Item -Path $Basepath -Name $VMName -ItemType "Directory"} else {echo "Ordner vorhanden"}
if (!(Test-Path $VHDPath)) {New-VHD -ParentPath $Masterplatte -Path $VHDPath -Differencing} else {echo "Disk vorhanden"}


# Create New Virtual Machine
New-VM -Name $VMName -MemoryStartupBytes $MemorySize -Generation 2 -VHDPath $VHDPath  -Path $VMPath -SwitchName $vmhub.Name
Set-VMProcessor -Name $VMName -VMProcessor 2

Start-VM -VMname $VMname
}

New-WS19Diff
