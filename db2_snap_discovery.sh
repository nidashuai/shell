#!/bin/sh
#Auth       : nds
#Creat time : 2015/01/14

make_json()
{
first=1
count=1
set -A array $*
line=${#array[@]}
echo "{"
echo "\t\"data\":["
for tsname in ${array[@]}
do
  if [ "$count" -lt "$line" ];then
    echo "\t\t{\"{#TSNAME}\":\"$tsname\"},"
  else
    echo "\t\t{\"{#TSNAME}\":\"$tsname\"}"
    break
  fi

  count=`expr $count + 1`
#  echo $count
done
echo "\t]"
echo "}\n"
# return 0
}

fGetname()
{
  grep -i "$1 name" /home/dba/shell/tmp/$1.snap | sed 's/[[:space:]]//' | cut -d= -f2 
}


#
set -A arrayName `fGetname $1`
make_json ${arrayName[@]}
#rm $filename
                
