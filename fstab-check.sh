#!/bin/bash
 
FSTABCheck()
	{
FSTAB_ENTRIES=$(cat /etc/fstab | awk '$1 !~/#|^$|swap/ {print $2}')
 
printf "%-40s%-15s%-15s%-s\n" FILESYSTEM ETC_FSTAB MOUNTED
printf "%-40s%-15s%-15s%-s\n" ---------- --------- -------
 
for FS in ${FSTAB_ENTRIES}
do
df -hPT | grep -wq ${FS}
 
if [ $? -eq 0 ]
 then
    PR_FSTAB="Yes"
    PR_MOUNT="Yes"
 else
    PR_FSTAB="Yes"
    PR_MOUNT="No"
fi
 
printf "%-40s%-15s%-15s%-s\n" $FS $PR_FSTAB $PR_MOUNT
done
}
FSTABCheck

# Shell script to monitor or watch the low-disk space
# of space is >= 85%
# Disk Space Monitoring Script
#### Script START here ###
## You can change your threshold value whatever you want ##
THRESHOLD=85
PATHS=/
AWK=/bin/awk
DU=`/usr/bin/du -ks`
GREP=/bin/grep
SED=/bin/sed
CAT=/bin/cat
for path in $PATHS
do
## Validate the Percentage of Disk space ##
DISK_AVAIL=`/bin/df -k / | grep -v Filesystem |awk '{print $5}' |sed 's/%//g'`
if [ $DISK_AVAIL -ge $THRESHOLD ]
then
echo "Root space is more than 90% utilized Please clean up your stuff"
else
echo "Root space sufficient for Patching"
fi
done
## END of the Script ##
