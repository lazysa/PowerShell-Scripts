
<# SQL Server 2016 table => csv file
 Export table data from SQL Server 2016 to csv file by bcp 
 Powershell script
#>

$arg = '-t, -r\n -c -T -k -C65001'
$dir = 'D:\table'
$log = 'D:\log'
$db0 = 'buy2016'
$db0_tb = 'buy22016_03', 'buy22016_04', 'buy22016_05', 'buy22016_06'
$query0 = "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM"
$num0 = $db0_tb.Length

for ($i=0; $i -lt "$num0"; $i++)
{
    $tb0 = $db0_tb[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM $db0.dbo.$tb0" queryout "$dir\$tb0.dat" -o "$log\$tb0.log" "-t," -r\n -c -T -k -C65001 
}


$db1 = 'buy2016_2'
$db1_tb = 'buy22016_10','buy22016_11','buy22016_12','buy22016_78','buy22016_9'
$num0 = $db1_tb.Length

for ($i=0; $i -lt "$num0"; $i++)
{
    $tb1 = $db1_tb[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM $db1.dbo.$tb1" queryout "$dir\$tb1.dat" -o "$log\$tb1.log" "-t," -r\n -c -T -k -C65001  
}




$db2 = 'buy2017'
$db2_tb0 = 'buy2_201703','buy2_20170322_31','buy2_201704','buy2_20170426_30'
$db2_tb1 = 'buy22017_01','buy22017_02','buy22017_03','buy22017_04','buy22017_05'

$num0 = $db2_tb0.Length
for ($i=0; $i -lt "$num0"; $i++)
{
    $tb0 = $db2_tb0[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,'',fildate,gdcode,dealtime FROM $db2.dbo.$tb0" queryout "$dir\$tb0.dat" -o "$log\$tb0.log" "-t," -r\n -c -T -k -C65001
}

$num1 = $db2_tb1.Length
for ($i=0; $i -lt "$num1"; $i++)
{
    $tb1 = $db2_tb1[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM $db2.dbo.$tb1" queryout "$dir\$tb1.dat" -o "$log\$tb1.log" "-t," -r\n -c -T -k -C65001 
}



$db3 = 'buy20170525'
$db3_tb0 = 'buy22015_07','buy22015_08','buy22015_0901_0910','buy22015_09011_0920','buy22015_0921_0930','buy22015_1001_1010','buy22015_1011_1020','buy22015_1021_1030','buy22015_1101_1111','buy22015_1111_1120','buy22015_1121_1130','buy22015_1201_1212','buy22015_1212_1220','buy22015_1221_1230','[buy22015_1-6]'
$db3_tb1 = 'buy22016_01','buy22016_02'

$num0 = $db3_tb0.Length
for ($i=0; $i -lt "$num0"; $i++)
{
    $tb0 = $db3_tb0[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,'' FROM $db3.dbo.$tb0" queryout "$dir\$tb0.dat" -o "$log\$tb0.log" "-t," -r\n -c -T -k -C65001 
}

$num1 = $db3_tb1.Length
for ($i=0; $i -lt "$num1"; $i++)
{
    $tb1 = $db3_tb1[$i]
    bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM $db3.dbo.$tb1" queryout "$dir\$tb1.dat" -o "$log\$tb1.log" "-t," -r\n -c -T -k -C65001
}










<#


 bcp "SELECT gid,code,name,code2,sort,sname FROM buy20170525.dbo.goods" queryout "D:\tables\goods.csv" -t',' -c -T -k -w

sqlcmd -Q "SELECT gid,code,name,code2,sort,sname FROM buy20170525.dbo.goods" -o "D:\tables\goods.csv" -s',' -u



white 
bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM buy2016.dbo.buy22016_03" queryout "D:\tables\buy22016_03.csv" -t',' -c -T -k -w

black
bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM buy2016_2.dbo.buy22016_10" queryout "D:\tables\buy2016_2 buy22016_10.csv" -t',' -c -T -k -w

white 
bcp "SELECT FLOWNO,POSNO,ITEMNO,GID,QTY,PRICE,REALAMT,LSTUPDTIME,fildate,gdcode,dealtime FROM buy2017.dbo.buy22016_10" queryout "D:\tables\buy2016_2 buy22016_10.csv" -t',' -c -T -k -w -o ""

#>

