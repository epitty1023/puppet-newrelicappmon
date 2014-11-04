# add code to copy the msi here
param(
 [string]$msiName,
 [string]$licensekey
 )
#$msiName = "c:\scripts\NewRelicAgent_x86_3.4.24.0.msi"
#$licenseKey = "aaaaabbbbbbcccccdddddeeeeeffffggggghhhhh"
$arguments = "/i $msiName /L*v newrelicappmonitorinstall.log /qn NR_LICENSE_KEY=$licenseKey"
if ($msiName -ne $null) {
    $exitCode = (Start-Process -FilePath "msiexec" -ArgumentList $arguments -Wait -PassThru).ExitCode;
    if($exitCode -eq 0) {
        Write-Host "Installation successful!" -ForegroundColor Green
    } else {
        Write-Host "Installation unsuccessful. Exitcode: $exitCode" -ForegroundColor Red        
    }
}
