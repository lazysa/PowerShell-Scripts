<#
Read count's value from log file 
2017-6-10 
version 1.0
#>

# Define a log file list 
$log = 'D:\log'
cd $log 
$filelist = Get-ChildItem $log -Recurse *.log 

# Traverse filelist
foreach ($filelist in $filelist)
{
echo $filelist | Select-Object Name
# Read third last line - count
$count = (Get-Content $filelist)[-3]
# Only save count field       
$count.Split(' ')[0]
echo +++++++++++++++++++++++
echo ''
}