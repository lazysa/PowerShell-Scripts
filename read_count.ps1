<#
# Used to:   Read count's value from log file
#------------------------------------------------------------------------------------------------
# Developer:    xu.chen
# Blog:         http://chenxu.info
# Email:        linuxjosery@gmail.com
# Created on:   2017/06/10
# Location:
# Execution:    read_count.ps1
# Description:  读取日志文件的总行数
# Revision History:
#
# Name             Date            Description
#------------------------------------------------------------------------------------------------
# xu.chen        2017/06/10      Initial Version
#------------------------------------------------------------------------------------------------
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
