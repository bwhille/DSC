# Nimmt das Cert welches für CodeSigning verfügbar steth
$cscert = (dir Cert:\CurrentUser\my -CodeSigningCert)[0]
# signiert das unter Path angegebene ps1 File
Set-AuthenticodeSignature path.ps1 $cscert