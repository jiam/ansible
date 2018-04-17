c=`netstat -s | grep "$1" | awk '{print $1}'`
#echo $1
if [ -z "$c" ]
then
   echo 0
else
   echo $c
fi

