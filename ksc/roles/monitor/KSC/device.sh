/usr/sbin/dmidecode -t system | grep "$1" | awk -F: '{print $2}'
