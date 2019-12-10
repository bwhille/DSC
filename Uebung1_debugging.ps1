configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer
    {
        xDhcpServerAuthorization LocalServerActivation
        {
            Ensure = 'Present'
        }
        xDhcpServerScope Scope
        {
            Ensure = 'Present'
            Name = 'PowerShellScope'
            ScopeId = '192.168.200.0'
            SubnetMask = '255.255.255.0'
            IPStartRange = '192.168.200.100'
            IPEndRange = '192.168.200.254'
            LeaseDuration = ((New-TimeSpan -Hours 8 ).ToString())
            State = 'Active'
            AddressFamily = 'IPv4'
            DependsOn = 'LocalServerActivation'
        }
    }
}