dmidecode -t memory | awk  '/[[:cntrl:]]Speed.*MHz/{if($2>1024){getline;print $2}}' | grep -v '^$'
