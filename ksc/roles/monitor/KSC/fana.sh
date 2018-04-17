/usr/bin/ipmitool sdr |  awk -F'|' '/RPM/{print $1}'
