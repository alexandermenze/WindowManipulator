$currentDirectory = Get-Location
$pluginName = (Split-Path $currentDirectory -Leaf)

Write-Host $currentDirectory
Write-Host $pluginName

Get-Process -Name StreamDeck

$streamDeckExeInfo = Get-Process -Name StreamDeck | Select-Object Path

Write-Host $streamDeckExeInfo

$streamDeckExePath = $streamDeckExeInfo.Path

Write-Host -Object $streamDeckExePath

Stop-Process -Name StreamDeck -Force

Start-Sleep -Seconds 1

$pluginsDirectory = Join-Path $env:APPDATA 'Elgato\StreamDeck\Plugins\'

Write-Host $pluginsDirectory

$pluginPath = Join-Path $pluginsDirectory $pluginName

Write-Host $pluginPath

Remove-Item $pluginPath -Recurse -Force
Copy-Item -Path . -Recurse -Destination $pluginsDirectory -Container

Start-Process -FilePath $streamDeckExePath