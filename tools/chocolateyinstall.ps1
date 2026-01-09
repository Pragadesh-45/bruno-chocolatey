$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v3.0.2/bruno_3.0.2_x64_win.exe'
$checksum = '9520156B5D187B8BA896EC9B4A5153CC912BE26F18EFCE898518A852899AF246'

$osArchitecture = Get-ProcessorArchitecture
if ($osArchitecture -eq 'arm64') {
  $url = 'https://github.com/usebruno/bruno/releases/download/v3.0.2/bruno_3.0.2_arm64_win.exe'
  $checksum = '695286e25d208e7b1a9c7fbb1e4ba693eae409b7a36f988df6402b751712c3e4'
}

$packageArgs = @{
  packageName  = '$env:ChocolateyPackageName'
  fileType     = 'exe'
  url          = $url
  softwareName = 'Bruno*'
  checksum     = $checksum
  checksumType = 'sha256'
  silentArgs   = '/S /allusers'
}

Install-ChocolateyPackage @packageArgs
