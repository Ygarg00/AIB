#region Variables
 
$verboseSettings = $VerbosePreference
$VerbosePreference = 'Continue'
$toolsPath = "C:\temp\Tools"
$optimalizationScriptURL = 'https://github.com/The-Virtual-Desktop-Team/Virtual-Desktop-Optimization-Tool/archive/refs/heads/master.zip'
$optimalizationScriptZIP = "$toolsPath\WVDOptimalization.zip"
$OptimalizationFolderName = "$toolsPath\" + [System.IO.Path]::GetFileNameWithoutExtension("$optimalizationScriptZIP")
 
$toolsTest = Test-Path -Path $toolsPath
if ($toolsTest -eq $false){
    Write-Verbose "Creating '$toolsPath' directory"
    New-Item -ItemType Directory -Path $toolsPath | Out-Null
}
else {
   
 Write-Verbose "Directory '$toolsPath' already exists."
}
 
#endregion
 
#region Optimalization
 
Write-Verbose "Downloading '$optimalizationScriptURL' into '$optimalizationScriptZIP'"
Invoke-WebRequest -Uri $optimalizationScriptURL -OutFile $optimalizationScriptZIP
New-Item -ItemType Directory -Path "$OptimalizationFolderName"
Write-Verbose "Expanding Archive '$optimalizationScriptZIP ' into '$OptimalizationFolderName'"
Expand-Archive -LiteralPath $optimalizationScriptZIP -DestinationPath $OptimalizationFolderName
Set-Location "$OptimalizationFolderName\Virtual-Desktop-Optimization-Tool-master"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
#endregion
