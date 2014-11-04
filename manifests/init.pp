class newrelic-appmon(
   $psfile_source      = undef,
   $msiname            = undef,
   $licence_key        = undef,
   $msidisk            = undef,
   $psdisk             = undef,
   $msifile_source     = undef,
   $location           = undef
) {
  #exe_name = "installnewrelic.ps1"
  #$psdisk = 'C:\scripts\installnewrelic.ps1'
  #location = "puppet:///modules/${module_name}/${exe_name}"
  #$msiname = "NewRelicAgent_x86_3.4.24.0.msi"
  #$msifile = "puppet:///modules/${module_name}/${msiname}"
  #$msidisk = 'c:\scripts\NewRelicAgent_x86_3.4.24.0.msi'
 # Upload powershell script
  file { $psdisk:
    ensure => file,
    source => $psfile,
    mode   => '1777',
    owner  => 'administrator',
    group  => 'administrators',
 } 

#Upload exe or msi to server
  file { $msidisk:
    ensure => file,
    source => $msifile,
    mode   => '1777',
    owner  => 'administrator',
    group  => 'administrators',
  }

# Install Newrelic using the powershell command  
  exec { $psdisk:
  	command => "c:\\windows\syswow64\windowspowershell\v1.0\powershell.exe -executionpolicy remotesigned -file  $psdisk -msiName $msiname -licensekey $license_key"
    #command => 'c:\\windows\syswow64\windowspowershell\v1.0\powershell.exe  -executionpolicy remotesigned -file C:\scripts\installnewrelic.ps1 /i $msiname /L*v newrelicappmonitorinstall.log /qn NR_LICENSE_KEY=$license_Key',
  }
}
