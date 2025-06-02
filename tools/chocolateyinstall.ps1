$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/usebruno/bruno/releases/download/v2.4.0/bruno_2.4.0_x64_win.exe'

$packageArgs = @{
  packageName    = '$env:ChocolateyPackageName'
  fileType      = 'exe'
  url           = $url
  softwareName  = 'Bruno*'
  checksum      = 'D29FDCB5AF71B36CBEC6E2D5059EF29EC23491967D6974C9DA8F29327FA1B1BD'
  checksumType  = 'sha256'
  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
