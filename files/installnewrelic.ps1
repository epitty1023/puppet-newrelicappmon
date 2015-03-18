# add code to copy the msi here
$msiName = "c:\scripts\NewRelicAgent_x86_3.4.24.0.msi"
$licenseKey = "aaaaabbbbbbcccccdddddeeeeeffffggggghhhhh"
# /L*v install.log means log verbose output to install.log | /qn means display no user interface
$arguments = "/i $msiName /L*v newrelicappmonitorinstall.log /qn NR_LICENSE_KEY=$licenseKey"
if ($msiName -ne $null) {
    $exitCode = (Start-Process -FilePath "msiexec" -ArgumentList $arguments -Wait -PassThru).ExitCode;
    if($exitCode -eq 0) {
        Write-Host "Installation successful!" -ForegroundColor Green
    } else {
        Write-Host "Installation unsuccessful. Exitcode: $exitCode" -ForegroundColor Red        
    }
}
