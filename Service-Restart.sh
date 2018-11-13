#!/bin/bash
###edit the following with service requored for restart
service=crond
###stop editing

echo "********** output of service $service status **********"
service $service status
echo "********** end output **********"

UP=$(pgrep $service | wc -l)
if [ "$UP" -ne 1 ]
then
        echo $service is down, service will be restarted
        service $service start
	sleep 15
	if [ "$UP" -ne 1 ]
	then
		echo $service service was started successfully
		echo "********** output of service $service status **********\n"
		service $service status
		echo "********** end output **********\n"
	else
		echo $service service did not successfully started, please perform manual intervention
	fi
else
        echo $service service is already running, no action was taken
fi
