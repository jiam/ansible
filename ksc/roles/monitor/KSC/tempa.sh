/usr/bin//ipmitool sdr | grep -v 'DIMM' | awk -F'|' '/degrees/{print $1}'
