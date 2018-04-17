/usr/bin/ipmitool sdr |  awk -F'|' '/RPM/{print $2}' | awk '{print $1}'
