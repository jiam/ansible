for  size in `dmidecode -t memory | awk '/Size.*MB/{if($2>1024)print $2}'`
do
  size=$(($size * 1024))
  echo $size
done
