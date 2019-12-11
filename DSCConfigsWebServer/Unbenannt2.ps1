configuration ConfigWebsite {
    # Module für alle verwendeten Ressourcen importieren
    Import-DscResource -Module xWebAdministration, PSDesiredStateConfiguration, ComputerManagementDsc
        
    # Betroffene Computer aus ConfigurationData ermitteln
    Node $AllNodes.where{$_.Role -eq "Web"}.NodeName
    {
        # Existierende Webseite stoppen
        xWebsite DefaultSite
        {
        Ensure = "Absent"
        Name = "Default Web Site"
        State = "Stopped"
        PhysicalPath = $Node.DefaultWebSitePath
        DependsOn = "[WindowsFeature]IIS"
        }

        # IIS-Rolle installieren
        WindowsFeature IIS
        {
        Ensure = "Absent"
        Name = "Web-Server"

        }

        # .NET 4.5 installieren
        WindowsFeature AspNet45
        {
        Ensure = "Absent"
        Name = "Web-Asp-Net45"
        }

        # Webseiteninhalt kopieren
        File WebContent
        {
        Ensure = "Absent"
        SourcePath = $Node.SourcePath
        DestinationPath = $Node.DestinationPath
        Recurse = $true
        Type = "Directory"
        DependsOn = "[WindowsFeature]AspNet45"
        }

        # neue Webseite generieren
        xWebsite NewWebSite
        {
        Ensure = "Absent"
        Name = $Node.WebsiteName
        State = "Started"
        PhysicalPath = $Node.DestinationPath
        DependsOn = "[File]WebContent"
        }
        # See if a reboot is required after installing Exchange
        PendingReboot AfterInstall
        {
            Name      = 'AfterInstall'
            
        }
    }
}

ConfigWebsite -ConfigurationData C:\DSCConfigsWebServer\webpts.psd1 -OutputPath c:\DSCConfigsWebServer

