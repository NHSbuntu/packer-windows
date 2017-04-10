# Windows 7 SP1 require KB3102810 hotfix
$nhsbKbName = "Windows 7 KB3102810"
$nhsbKbUrl = "https://download.microsoft.com/download/F/A/A/FAABD5C2-4600-45F8-96F1-B25B137E3C87/Windows6.1-KB3102810-x64.msu"
$nhsbKbExe = Join-Path "$($env:windir)\Temp" 'nhsb-windows6.1-kb3102810.msu'

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
