$users = Get-WmiObject -Class Win32_UserAccount

foreach ($user in $users) {
    $username = $user.Name
    $serviceSid = (New-Object System.Security.Principal.NTAccount($username)).Translate([System.Security.Principal.SecurityIdentifier]).Value

    Write-Output "Username: $username"
    Write-Output "ServiceSid: $serviceSid"
    Write-Output ""
}
