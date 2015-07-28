#!/bin/ksh

case $1 in
  state)
    funName=fState
    ;;
  type)
    funName=fType
    ;;
  lock)
    funName=fLock
    ;;
  sort)
    funName=fSort
    ;;
  bp)
    funName=fBufferpool
    ;;
  stmt)
    funName=fStatement
    ;;
  log)
    funName=fLog
    ;;
  *)
    echo "Input parameters are incorrect.This parameter should be fs, app, lock, sort, bp, stmt, log."
esac

# Excute function
$funName
