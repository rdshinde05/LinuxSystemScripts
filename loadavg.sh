#!/bin/bash
loadavg=`uptime | awk '{print $10+0}'`
# bash doesn't understand floating point
# so convert the number to an interger
thisloadavg=`echo $loadavg|awk -F \. '{print $1}'`
if [ "$thisloadavg" -ge "2" ]; then
 echo "Busy - Load Average $loadavg ($thisloadavg) "
 top -bn 1
else
 echo "Okay - Load Average $loadavg ($thisloadavg) "
fi

\

####################################################
#! /bin/bash
printf "Memory\t\tDisk\t\tCPU\n"
end=$((SECONDS+3600))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
DISK=$(df -h | awk '$NF=="/"{printf "%s\t\t", $5}')
CPU=$(top -bn1 | grep load | awk '{printf "%.2f%%\t\t\n", $(NF-2)}')
echo "$MEMORY$DISK$CPU"
sleep 5
done


