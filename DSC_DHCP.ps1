configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer

    xDhcpServerAuthorization Activation
    {
        Ensure = 'Present'
        IPAddress = '192.168.200.10'
    }
    DhcpScopeOptionValue Gateway
    {
        OptionId = '3'
        Value = '192.168.200.1'
        ScopeId =   '192.168.200.0'
        VendorClass = ''
        UserClass   = ''
        AddressFamily = 'IPv4'
        DependsOn = '[xDhcpServerScope]Scope'
    }
    DhcpScopeOptionValue DNS
    {
        OptionId = '6'
        Ensure = 'Present'
        # Hier muss auf jedem angegebenen Host auch der DNS Dienst laufen.
        Value = '192.168.200.20','192.168.200.10'
        ScopeId =   '192.168.200.0'
        VendorClass = ''
        UserClass   = ''
        AddressFamily = 'IPv4'
        DependsOn = '[xDhcpServerScope]Scope'
    }
    xDhcpServerScope Scope
    {
        ScopeId = '192.168.200.0'
        Ensure = 'Present'
        IPEndRange = '192.168.200.254'
        IPStartRange = '192.168.200.100'
        Name = 'PowerShellScope'
        SubnetMask = '255.255.255.0'
        LeaseDuration = ((New-TimeSpan -Hours 8 ).ToString())
        State = 'Active'
        AddressFamily = 'IPv4'
        DependsOn = '[xDhcpServerAuthorization]Activation'
    }
}
Sample_xDhcpsServerScope_NewScope -OutputPath C:\dsc_scripts

Start-DscConfiguration -Path C:\dsc_scripts -Force -Wait -Verbose