######################################################
#  Sample powerscript to extract and upload data
######################################################
$Last30Days = (Get-Date).AddDays(-30)
$tempFinalFolder = C:\Temp\log
$a = "{0:d}" -f (get-date)
$rootFolder = "C:\Users\xxx\Downloads"
#$ZipFile = G:\Project\extract_$(Get-Date -format 'u').zip
$FileList = Get-ChildItem -Path $rootFolder\* -Include *.pdf | Where-Object {$_.LastWriteTime -gt $Last30Days}

#Start to copy file into temo
foreach($fileEa in $FileList)
{
    Copy-Item "$fileEa" -destination $tempFinalFolder
}

# Start to zip
Compress-Archive -Path $tempFinalFolder -DestinationPath G:\Project\extract_WB1_$a.zip -Force


Get-ChildItem $tempFinalFolder -File | Remove-Item -Force

