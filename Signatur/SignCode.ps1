﻿dir Cert:\CurrentUser\My$cert = @(dir "Cert:\CurrentUser\My\")[0]Set-AuthenticodeSignature c:\ps\forest-1_vorbereitung.ps1 $cert