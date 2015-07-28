#!/bin/sh
first=1
echo "{\n"
echo "\t\"data\":[\n\n"
for disk in `lsdev -c disk |awk '{print $1}`
do
  if [ "$first" -eq "0" ];then
    echo "\t,\n"
  fi
  first=0
  echo "\t{\n"
  echo "\t\t\"{#DISKNAME}\":\"$disk\"\n"
  echo "\t}\n" 
done
echo "\n\t]\n"
echo "}\n"
