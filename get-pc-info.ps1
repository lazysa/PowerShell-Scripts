# Get PC's info on the Windows OS

$nas_ip = '192.168.10.252'
$dir = 'tmp'
# From input get name 
$name = Read-Host 'Please enter your "lastname.firstname", (eg: xu.chen)'
$full_path = "$nas_ip\$dir\$name.txt"

# Get PC's Manufacturer and model 
Get-WmiObject -Class Win32_ComputerSystem > $name.txt

# Get SerialNumber in the BIOS info 
Get-WmiObject -Class Win32_BIOS -ComputerName . | select SerialNumber >> $name.txt

# Get PC's Mac Address 
Get-WmiObject win32_networkadapterconfiguration | select IPAddress, description, macaddress, DHCPEnabled >> $name.txt

# Get PC's memory info 
# The unit is Gb and the decimal is two
$mem = "{0:N2}GB" -f (((Get-WmiObject -Class Win32_PhysicalMemory).capacity | Measure-Object -Sum).sum /1gb)
# Obtain the native memory bar number
$slot = ((Get-WmiObject -Class Win32_PhysicalMemory).capacity | Measure-Object -Sum).count
# Get the native memory production vendor
$Manufacturer = (Get-WmiObject -Class Win32_PhysicalMemory).Manufacturer
# Get the free ram, unit Gb, and hold two decimal places
$freemem = "{0:N2}GB" -f ((Get-WmiObject -Class Win32_OperatingSystem).FreePhysicalMemory /1mb)

#打印结果
echo "Total Memory: $mem"  >> $name.txt
echo "Memory Slot Number: $slot" >> $name.txt
echo "Free Memory: $freemem" >> $name.txt
echo "Memory Manufacturer: $Manufacturer" >> $name.txt


Copy-Item "$name.txt" -Destination "\\$full_path" 

