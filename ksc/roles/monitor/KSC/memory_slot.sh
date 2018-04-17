dmidecode -t memory | awk  '/Size.*MB/{getline;getline;getline;if($2>1024)print $2}'
