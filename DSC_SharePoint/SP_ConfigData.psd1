@{
    AllNodes = @(
        @{
            NodeName        = "SPWFE.contoso.com"
            RunCentralAdmin = $false
            ServerRole      = "WebFrontEnd"
        },
        @{
            NodeName        = "SPApp.contoso.com"
            RunCentralAdmin = $true
            ServerRole      = "Application"
        },
        @{
            NodeName        = "SPSearch.contoso.com"
            RunCentralAdmin = $false
            ServerRole      = "Search"
        },
        @{
            NodeName                    = "*"
            PSDSCAllowPlainTextPassword = $true
            PSDSCAllowDomainUser        = $true
        }
    )
    SharePoint = @{
        Settings = @{
            DatabaseServer = "SPSQL"
            BinaryPath     = "C:\SP2019\"
            ProductKey     = "M692G-8N2JP-GG8B2-2W2P7-YY7J6"
        }
    }
}
