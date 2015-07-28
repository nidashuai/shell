#!/bin/ksh

case $1 in
  state)
    funName=fState
    ;;
  type)
    funName=fType
    ;;
  *)
    echo "Input parameters are incorrect.This parameter should be state, type."
    ;;
esac

# Excute function
$funName
