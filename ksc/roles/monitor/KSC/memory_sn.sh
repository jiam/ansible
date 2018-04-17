dmidecode -t memory | awk  '/[[:cntrl:]]Speed.*MHz/{if($2>1024){getline;getline;print $3}}'
