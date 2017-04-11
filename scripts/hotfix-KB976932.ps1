# Install KB
$nhsbKbName = "Windows 7 Service Pack 1"
$nhsbKbUrl = "https://download.microsoft.com/download/0/A/F/0AFB5316-3062-494A-AB78-7FB0D4461357/windows6.1-KB976932-X64.exe"
$nhsbKbExe = Join-Path "$($env:windir)\Temp" 'nhsb-windows6.1-kb976932.exe'

Write-Output "INFO: $nhsbKbName"

if (!(Test-Path $nhsbKbExe)) {
    Write-Output "INFO: Downloading from $nhsbKbUrl"
    (New-Object System.Net.WebClient).DownloadFile($nhsbKbUrl, $nhsbKbExe)

    Write-Output "INFO: Installing $nhsbKbName"
    Start-Process -FilePath $nhsbKbExe -ArgumentList "/quiet /nodialog /forcerestart" -Wait
}
else
{
Write-Output "INFO: Skipping $nhsbKbName"
}

#C:\Windows\Temp\nhsb-windows6.1-kb976932.exe /quiet /nodialog /forcerestart
#C:\Windows\Temp\nhsb-windows6.1-kb976932.exe /X:C:\Windows\Temp
#C:\Windows\Temp\SPInstall.exe /quiet /nodialog /forcerestart
