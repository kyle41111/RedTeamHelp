$member = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
Add-LocalGroupMember -Group "Administrators" -Member "$member"
Set-ExecutionPolicy unrestricted
New-Item -Path $Profile -Type File -Force
Add-Content -Path C:\Windows\System32\WindowsPowerShell\v1.0\profile.ps1 -Value 'Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward'


Invoke-Command { & "powershell.exe" } -NoNewScope


