#!/bin/bash
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
