#!/bin/ksh
# auth: nds
# create date: 2015/07/09

case $1 in
  fs)
    funName=fFilesystem
    ;;
  app)
    funName=fApplication
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

$funName
