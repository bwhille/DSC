Configuration FirewallProfile_ConfigurePrivateFirewallProfile_Config
{
if (Get-Module -ListAvailable -Name NetworkingDsc) {
    Write-Host "Module exists"
    }
else {
      Write-Host "Module does not exist"
      Find-Module NetworkingDsc | Install-Module
    }
    Import-DscResource -Module NetworkingDsc

    Node localhost
    {
        FirewallProfile ConfigurePrivateFirewallProfile
        {
            Name = 'Private'
            Enabled = 'False'
#            DefaultInboundAction = 'Block'
#            DefaultOutboundAction = 'Allow'
#            AllowInboundRules = 'True'
#            AllowLocalFirewallRules = 'False'
#            AllowLocalIPsecRules = 'False'
#            NotifyOnListen = 'True'
#            LogFileName = '%systemroot%\system32\LogFiles\Firewall\pfirewall.log'
#            LogMaxSizeKilobytes = 16384
#            LogAllowed = 'False'
#            LogBlocked = 'True'
#            LogIgnored = 'NotConfigured'
        }
                FirewallProfile ConfigureDomainFirewallProfile
        {
            Name = 'Domain'
            Enabled = 'False'
#            DefaultInboundAction = 'Block'
#            DefaultOutboundAction = 'Allow'
#            AllowInboundRules = 'True'
#            AllowLocalFirewallRules = 'False'
#            AllowLocalIPsecRules = 'False'
#            NotifyOnListen = 'True'
#            LogFileName = '%systemroot%\system32\LogFiles\Firewall\pfirewall.log'
#            LogMaxSizeKilobytes = 16384
#            LogAllowed = 'False'
#            LogBlocked = 'True'
#            LogIgnored = 'NotConfigured'
        }
                FirewallProfile ConfigurePublicFirewallProfile
        {
            Name = 'Public'
            Enabled = 'False'
#            DefaultInboundAction = 'Block'
#            DefaultOutboundAction = 'Allow'
#            AllowInboundRules = 'True'
#            AllowLocalFirewallRules = 'False'
#            AllowLocalIPsecRules = 'False'
#            NotifyOnListen = 'True'
#            LogFileName = '%systemroot%\system32\LogFiles\Firewall\pfirewall.log'
#            LogMaxSizeKilobytes = 16384
#            LogAllowed = 'False'
#            LogBlocked = 'True'
#            LogIgnored = 'NotConfigured'
        }


    }
}
FirewallProfile_ConfigurePrivateFirewallProfile_Config -OutputPath c:\dsc_script

Start-DscConfiguration -Path C:\dsc_script -Verbose -Wait -Force