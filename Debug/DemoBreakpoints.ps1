function Get-ArchitectureInfo {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$True)]
        [string[]]$ComputerName
    )
    PROCESS {
        foreach ($computer in $computername) {
            # All CPUs should be the same so only get one
            $proc = Get-CimInstance -ClassName Win32_Processor -ComputerName $computer |
                     Select-Object -first 1

            $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $computer

            $properties = @{'ComputerName'=$Computer;
                            'OSArchitecture'=$os.osarchitecture;
                            'ProcArchitecture'=$proc.addresswidth}
            $obj = New-Object -TypeName PSObject -Property $properties
            Write-Output $obj
        }
    }
}

# Set a breakpoint on line 18.
Set-PSBreakpoint -Script C:\PS2\Debugging\DemoBreakpoints.ps1 -Line 18

# Also set a breakpoint that outputs data to a debugging file
# each time $properties is written to
Set-PSBreakpoint -Script C:\PS2\Debugging\DemoBreakpoints.ps1 -Variable properties -Mode Write -Action { $properties | Out-File C:\PS2\Debugging\DemoBreakpoints.ps1.txt -append }

# This will run the command
Get-ArchitectureInfo -ComputerName $env:COMPUTERNAME |
Where-Object { $_.ProcArchitecture -eq $_.OSArchitecture } |
Select-Object -Property ComputerName

# Check the contents of DemoBreakpoints.ps1.txt

