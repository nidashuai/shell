#!/bin/ksh
# auth : nds
# create date : 2015/07/13

# Define array
set -A arrayName `fGetvalue "Tablespace name"`

# Define count variable
id=0

# Get the id of $1 in arrayName
while [ "$input_var" != "${arrayName[$id]}" ]
do
  id=`expr $id + 1`
done


fState() {
  # Define array  
  set -A array `fGetvalue "State"`
  eval $input_var=${array[$id]}  
}

fType() {
  # Define array  
  set -A array `fGetvalue "Type"`
  eval $input_var=\"${array[$id]}\"  
}
