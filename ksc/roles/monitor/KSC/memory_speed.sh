dmidecode -t memory | awk  '/[[:cntrl:]]Speed.*MHz/{if($2>1024)print $2}'
