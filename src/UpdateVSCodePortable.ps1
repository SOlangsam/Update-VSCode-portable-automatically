## Run after manual download
## Get latest zip file after downlaod
$downloadFolder = "c:\tmp"
$pathToVSCodePortable = "D:\VSCodePortable"

## Get zip filename
$zipFile = Get-ChildItem $downloadFolder -Filter "*.zip" | Sort-Object -Descending -Property LastWriteTime | Select-Object -First 1 -Property FullName 

## Unblock zip
Unblock-File -Path $zipFile

## Stop VSCode if running
Stop-Process -Name Code -Force -ErrorAction Continue

## Extract and overwrte zip files to VSCodePortable path
Expand-Archive -Path $zipFile -DestinationPath $pathToVSCodePortable -Force 

