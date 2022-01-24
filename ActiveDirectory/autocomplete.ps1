Set-ExecutionPolicy unrestricted
New-Item -Path $Profile -Type File -Force
Add-Content -Path C:\Users\Administrator\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -Value 'Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward'


Invoke-Command { & "powershell.exe" } -NoNewScope


