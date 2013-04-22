
$oldPassword = Read-Host -assecurestring "Please enter your current password"
$oldPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($oldPassword))

$newPassword = Read-Host -assecurestring "Please enter your newPassword password"
$newPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPassword))

[XML]$config = Get-Content "config.xml"

$config.config.domain | ForEach-Object {

  $fqdn = $_.name
  $dc = $_.controller

  $_.user | ForEach-Object {

    $username = $_

    Write-Output ("WinNT://{0}.{1}/{2},user" -f $dc,$fqdn,$username)

    [ADSI]$user = ("WinNT://{0}.{1}/{2},user" -f $dc,$fqdn,$username)
    $user.ChangePassword($oldPassword, $newPassword)
  }

}
