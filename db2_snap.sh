#!/bin/ksh
#auth       : nds
#creat date : 2015/07/07

# Get input variable
input_type=$1
input_fun=$2
input_var=$3

# Define file path
shellPath=/home/zabbix/shell/
snapFilePath=/home/dba/shell/tmp/
snapFileName=$snapFilePath$input_type".snap"

#if [ ! -d $shellPath"tmp" ] ; then
#  mkdir $shellPath"tmp"
#fi

# Get value function   
fGetvalue()
{
  #echo $snapFileName
  grep "$1" $snapFileName | sed 's/[[:space:]]*//g' | cut -d= -f2
}

# Calculator function
fCalc()
{
  #echo $1
  echo "scale=3;$1" | bc
}

# Define the specified script
script=$shellPath"db2_snap_"$input_type".sh"
script_map=$shellPath"db2_snap_"$input_type"_map.sh"

# Execute script and function 
. $script
. $script_map $input_fun

#echo $script
#echo $script_map
#echo "$script_map $input_fun"
#echo "$"$input_var
#echo ${!input_var}

eval echo \$$input_var
