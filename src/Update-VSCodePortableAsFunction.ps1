<#
 .Synopsis
  Tries to update vscode portable for you with a defined zip file
 .Description
  The function updates vscode portable automatically to vscode portable folder
 .Parameter vscodeZipFile
  The zip file you want to extract to vscode portable folder
 .Parameter pathToVSCodePortable
  The folder files you want to overwrite with vscodeZipFile
 .Example
   # Updates c:\tmp\vscodeportable folder with the zip file
   Update-VSCodePortable -vscdoeZipFile "C:\Users\admin\Documents\VSCode-win32-x64-1.60.2.zip" -pathToVSCodePortable "c:\tmp\vscodeportable"
#>

function Update-VSCodePortable {
    [CmdletBinding()]
    param (        
        [Parameter(Mandatory = $true, Position = 0)]
        [string]        
        $vscodeZipFile,    
        [Parameter(Mandatory = $true, Position = 1)]
        [string]
        $pathToVSCodePortable   
    )
    $ErrorActionPreference = 'SilentlyContinue'
    ## Unblock zip
    Unblock-File -Path $vscodeZipFile
    ## Stop VSCode if running
    Stop-Process -Name Code -Force -ErrorAction $ErrorActionPreference
    ## Extract and overwrite VSCodePortable files
    Expand-Archive -Path $vscodeZipFile -DestinationPath $pathToVSCodePortable -Force 
}
