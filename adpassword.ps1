
$oldPassword = Read-Host -assecurestring "Please enter your current password"
$oldPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($oldPassword))

$newPassword = Read-Host -assecurestring "Please enter your newPassword password"
$newPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($newPassword))

$users = @(
@{"domain" = "smiths.net"; "server" = "cuscs006"; "username" = "jchqdgee"},
@{"domain" = "smiths.net"; "server" = "cuscs006"; "username" = "jchqdgee-la"},
@{"domain" = "medical.smgpplc.com"; "server" = "cuscs013"; "username" = "mpaudgee"},
@{"domain" = "medical.smgpplc.com"; "server" = "cuscs013"; "username" = "mpaudgee-la"}
)

$users | ForEach-Object {

  $domain = $_["domain"]
  $username = $_["username"]
  $server = $_["server"]

  Write-Output ("Changing password for {0}@{1}" -f $username,$domain)

  [ADSI]$user = ("WinNT://{0}.{1}/{2},user" -f $server,$domain,$username)
  $user.ChangePassword($oldPassword, $newPassword)
}
