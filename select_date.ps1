######################################################
#  Sample powerscript to extract and upload data
######################################################
$Last30Days = (Get-Date).AddDays(-32)
$tempFinalFolder = "D:\Temp\log"
$a = get-date -Format "ddMMyyyy"
$rootFolder = "C:\inetpub\logs\LogFiles\W3SVC1"
$ZipFile = "\\gisprdfsc2\GIS_Share\BJ_Share\WSN\download\Ad hoc file submission\extract_Weblog_WB2_$a.zip"
$FileList = Get-ChildItem -Path $rootFolder\* -Include *.log | Where-Object {$_.LastWriteTime -gt $Last30Days}

#Start to copy file into temo
foreach($fileEa in $FileList)
{
    Copy-Item "$fileEa" -destination $tempFinalFolder
}

# Start to zip method for powershell 5
#Compress-Archive -Path $tempFinalFolder -DestinationPath e:\extract_WB1_$a.zip -Force

# Start to zip method for powershell 4
Add-Type -assembly "system.io.compression.filesystem" 
[io.compression.zipfile]::CreateFromDirectory($tempFinalFolder,$ZipFile)



#Remove items from temp folder
Get-ChildItem $tempFinalFolder -File | Remove-Item -Force


