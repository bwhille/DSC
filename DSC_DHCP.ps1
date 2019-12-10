configuration Sample_xDhcpsServerScope_NewScope
{
    Import-DscResource -module xDHCpServer

    # Autorisiert den Unter IPAddress hinterlegten Server im AD
    xDhcpServerAuthorization Activation
    {
        Ensure = 'Present'
        IPAddress = '192.168.200.10'
    }
    #
    # Setzt den Route OptionID in der Scope
    #
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
    #
    # Setzt die DNS Server OptionID in der Scope
    #
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
    #
    # Erstellt die Scope im DHCP Server
    #    
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
# Erzeugung der mof Dateien
Sample_xDhcpsServerScope_NewScope -OutputPath C:\dsc_scripts
#
#
# Führt die mof Dateien die für diesen Host passen / matchen aus.
#Start-DscConfiguration -Path C:\dsc_scripts -Force -Wait -Verbose
#