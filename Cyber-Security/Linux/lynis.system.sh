#!/Bin/Bash

#running lynis every week

lynis audit system > /tmp/lynis.system_scan.log
