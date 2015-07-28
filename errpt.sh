#!/bin/ksh
filename=/home/zabbix/shell/tmp/errpt.tmp

# If file does not exist, create it
if [ ! -f $filename ] ; then
  touch $filename
fi

# Get the timestamp of the latest error
timeStamp=`errpt | awk '{if(NR==2)print $2}'`

# If $timeStamp exists in the file, it echo "OK",
# else echo an error report.
if grep $timeStamp $filename > /dev/null ; then
    echo "OK"
else
  errpt | grep $timeStamp >> $filename
  grep $timeStamp $filename
fi
