# April 2015 Service Update KB3020369
$nhsbKbName = "Windows 7 KB3020369"
$nhsbKbUrl = "https://download.microsoft.com/download/5/D/0/5D0821EB-A92D-4CA2-9020-EC41D56B074F/Windows6.1-KB3020369-x64.msu"
$nhsbKbExe = Join-Path "$($env:windir)\Temp" 'nhsb-windows6.1-kb3020369.msu'

Write-Output "INFO: $nhsbKbName"

if (!(Test-Path $nhsbKbExe)) {
    Write-Output "INFO: Downloading from $nhsbKbUrl"
    (New-Object System.Net.WebClient).DownloadFile($nhsbKbUrl, $nhsbKbExe)

    Write-Output "INFO: Installing $nhsbKbName"
    Start-Process wusa "$nhsbKbExe /quiet /norestart" -wait
}
else
{
Write-Output "INFO: Skipping $nhsbKbName"
}
