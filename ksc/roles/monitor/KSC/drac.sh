/usr/bin/ipmitool lan print | grep  "IP Address" | grep -v Source | awk -F: '{print $2}'
