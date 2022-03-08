<#
.SYNOPSIS
Use this cmdlet to host files on HTTP for download. The idea of this is to have a PowerShell SimpleHTTPServer that is similar to Python's SimpleHTTPServer module.


.DESCRIPTION
Running this function will open a PowerShell web server hosting files in the current directory. The server can be accessed at http://<host>:<port> You can download files. The directories are not able to be traversed through the web server.

.PARAMETER ListenHost
The listenhost parameter is for easily defining what host (ip or hostname) the http server should listen on. The default value is localhost.

.PARAMETER Port
The port parameter is for easily defining what port the http server should listen on. The default value is 8000.

.PARAMETER DirectoryListing
The directorylisting parameter is used to enable or disable directory listing.  The default is enabled.

.EXAMPLE
Start-SimpleHTTPServer
# This example starts an HTTP server on port 8000 in the current directory.

.EXAMPLE
Start-SimpleHTTPServer -Port 80
# This example starts an HTTP server on port 80 in the current directory.

.EXAMPLE
Start-SimpleHTTPServer -Port 80 -ListenHost 192.168.0.1
# This example starts an HTTP server on 192.168.0.1 port 80 in the current directory.


.NOTES
Author: Chris Meistre
Alias: chrismeistre
Contact: chris@cmcs.co.za
Original Author: Robert H. Osborne (tobor)

.LINK
https://github.com/chrismeistre/SimpleHTTPServer.ps1
https://github.com/tobor88/PowerShell-Red-Team/blob/master/Start-SimpleHTTPServer.ps1

.INPUTS
Int32
String
Bool

.OUTPUTS
None
#>
Function SimpleHTTPServer {
    [CmdletBinding()]
        param(
            [Parameter(
                Mandatory=$False,
                ValueFromPipeline=$False,
                HelpMessage='Enter a port for the HTTP Server to listen on. Valid ports are between 1 and 65535. Example: 1234')]
            [ValidateRange(1,65535)]
            [int32]$Port = 8000,
            [Parameter(
                Mandatory=$False,
                ValueFromPipeline=$False,
                HelpMessage='Enter a hostname or IP for the HTTP Server to listen on. Example: 127.0.0.1')]
            [String]$ListenHost = "localhost",
            [Parameter(
                Mandatory=$False,
                ValueFromPipeline=$False,
                HelpMessage='Enable or disable directory listing. Example: $True')]
            [String]$DirectoryListing = $True
        )

    $Address = "http://" + $ListenHost + ":" + $Port + "/"

    $WebServer = [System.Reflection.Assembly]::LoadWithPartialName("System.Web")
    $WebServer

    $Listener = New-Object -TypeName System.Net.HttpListener
    $Listener.Prefixes.Add("$Address")
    $Listener.Start()

    New-PSDrive -Name 'SimpleHTTPServer' -Root $Pwd.Path -PSProvider FileSystem -Scope Global

    $Root = $Pwd.Path

    Set-Location -Path 'SimpleHTTPServer:\'

    Do {

        $Context = $Listener.GetContext()
        $IP = $Context.Request.RemoteEndPoint.ToString()
        $RequestUrl = $Context.Request.Url
        $Response = $Context.Response
        
        Log-Output -Message $RequestUrl
        [array]$Content = @()

        $LocalPath = $RequestUrl.LocalPath

        Try
        {
            $RequestedItem = Get-Item -Path "SimpleHTTPServer:\$LocalPath" -Force -ErrorAction Stop

            $FullPath = $RequestedItem.FullName

            If($RequestedItem.Attributes -Match "Directory")
            {
                if ($DirectoryListing -eq $True) {
                    $Content = Get-DirectoryContent -Path $FullPath -HeaderName "PowerShell Simple HTTP Server" -RequestURL "$Address" -SubfolderName $LocalPath -Root $Root
                }
                else {
                    $Content = ""
                }
                

                $Encoding = [System.Text.Encoding]::UTF8
                $Content = $Encoding.GetBytes($Content)
                $Response.ContentType = "text/html"
            }
            Else
            {
                $Content = [System.IO.File]::ReadAllBytes($FullPath)

                $Response.ContentType = [System.Web.MimeMapping]::GetMimeMapping($FullPath)
            }
        }
        Catch [System.UnauthorizedAccessException]
        {
            Log-Output -Message "Access Denied" -Color 'Red'
            Log-Output -Message "Current user:  $env:USERNAME" -Color 'Red'
            Log-Output -Message "Requested File: SimpleHTTPServer:\$LocalPath" -Color 'Cyan'
            $Response.StatusCode = 404
            $Content = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 - Page Not Found</h1>")
        }
        Catch [System.Management.Automation.ItemNotFoundException]
        {
            # Log-Output -Message "Could not reach. Verify server is accessible over the network:  `n`tSimpleHTTPServer:\$LocalPath" -Color 'Red'
            $Response.StatusCode = 404
            $Content = [System.Text.Encoding]::UTF8.GetBytes("<h1>404 - Page Not Found</h1>")
        }
        Catch
        {
            $Error[0]
            $Content =  "$($_.InvocationInfo.MyCommand.Name) : $($_.Exception.Message)"
            $Content +=  "$($_.InvocationInfo.PositionMessage)"
            $Content +=  "    + $($_.CategoryInfo.GetMessage())"
            $Content +=  "    + $($_.FullyQualifiedErrorId)"

            $Content = [System.Text.Encoding]::UTF8.GetBytes($Content)
            $Response.StatusCode = 500
        }

        $Response.ContentLength64 = $Content.Length
        $Response.OutputStream.Write($Content, 0, $Content.Length)
        $Response.Close()

        $ResponseStatus = $Response.StatusCode
        Log-Output -Message $ResponseStatus -Color 'Cyan'

    } While ($Listener.IsListening)

}

Function Log-Output {
    [CmdletBinding()]
        param(
            [Parameter(
                Mandatory=$True,
                HelpMessage='Message')]
            [String]$Message = "",
            [Parameter(
                Mandatory=$False,
                HelpMessage='Color')]
            [String]$Color = ""
        )
        $Message = "[" + $(Get-Date -format 's') + "] ["+ $IP + "] " + $Message
        if ($Color -eq "") {
            Write-Host $Message
        } 
        else
        {
            Write-Host $Message -ForegroundColor $Color
        }
}

Function Get-DirectoryContent {
    [CmdletBinding(SupportsShouldProcess = $True)]
        param (
            [Parameter(
                Mandatory = $True,
                HelpMessage = 'Directory Path')]
            [string]$Path,

            [Parameter(
                Mandatory = $False,
                HelpMessage = 'Header Name')]
            [string]$HeaderName,

            [Parameter(
                Mandatory = $False,
                HelpMessage = 'Request URL')]
            [string]$RequestURL,

            [Parameter(
                Mandatory = $False,
                HelpMessage = 'Subfolder Name')]
            [string]$SubfolderName,

            [string]$Root
        )
@"
<html>
<head>
<title>$($HeaderName)</title>
</head>
<body>
<h1>$($HeaderName) - $($SubfolderName)</h1>
<hr>
"@
@"
<a href="./../">[To Parent Directory]</a><br><br>
<table cellpadding="5">
"@
$Files = (Get-ChildItem -Path "$Path")
Foreach ($File in $Files)
{
    $FileURL = ($File.FullName -Replace [regex]::Escape($Root), "" ) -Replace "\\","/"
    If (!$File.Length)
    {
        $FileLength = "[dir]"
    }
    Else
    {
        $FileLength = $File.Length
    }
@"
<tr>
<td align="right">$($File.LastWriteTime)</td>
<td align="right">$($FileLength)</td>
<td align="left"><a href="$($FileURL)">$($File.Name)</a></td>
</tr>
"@
}
@"
</table>
<hr>
</body>
</html>
"@
}
