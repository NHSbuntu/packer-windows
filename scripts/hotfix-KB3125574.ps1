# Windows 7 SP1 Convenience Rollup
$nhsbKbName = "Windows 7 KB3125574"
$nhsbKbUrl = "http://download.windowsupdate.com/d/msdownload/update/software/updt/2016/05/windows6.1-kb3125574-v4-x64_2dafb1d203c8964239af3048b5dd4b1264cd93b9.msu"
$nhsbKbExe = Join-Path "$($env:windir)\Temp" 'nhsb-windows6.1-kb3125574.msu'

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
