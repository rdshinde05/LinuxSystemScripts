#! /bin/bash
printf "Memory\n"
end=$((SECONDS+20))
while [ $SECONDS -lt $end ]; do
MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%\t\t", $3*100/$2 }')
echo "$MEMORY"
sleep 5
done
