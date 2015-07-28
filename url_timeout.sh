#!/bin/ksh
filename=/home/zabbix/shell/tmp/url_$1_$2
address="www.abc.com"
YYMMDD=`date +"%Y%m%d"`
pName=$1
# Map process name to port
case $1 in
  S01)
    port=9001
    ;;
  S02)
    port=9002
    ;;
  S03)
    port=9003
    ;;
  S04)
    port=9004
    ;;
esac

# Define a function to count time
fTIMEOUT(){
  waitsec=1 #Wait time 1 sec.
  #echo $*
  ( $* ) &
  runPid=$!
  #echo $runPid
  #echo `ps -ef|grep $runPid|grep -v grep`
  ( sleep $waitsec; kill -9 $runPid > /dev/null 2>&1 && echo "TIMEOUT" ) &
  waitPid=$!
  # If run pid finish 
  if wait $runPid > /dev/null 2>&1;then
    kill -9 $waitPid > /dev/null 2>&1 
  fi
}

# Get Url
fGETURL(){
  curl -s --connect-timeout 1 "http://${address}:${port}/erp/jsp/mgmt/status.jsp" > $filename
}

# 
    fTIMEOUT fGETURL
    status=`grep -v "^$" $filename | sed s/[[:space:]]//g `    #Remove spaces
    echo $status
