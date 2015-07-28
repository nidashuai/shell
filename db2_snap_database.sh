#!/bin/ksh
# Auth       : nds
# Creat date : 2015/07/08
# Get the information of database

# Get filesystem (fs) space
fFilesystem()
{
  fsFreespace=`fGetvalue "Storage path free space"`
  fsUsedspace=`fGetvalue "File system used space"`
  fsTotalspace=`fGetvalue "File system total space"`
}

# Get applications 
fApplication()
{
  appHighwatermark=`fGetvalue "High water mark for connections"`
  appCurrent=`fGetvalue "Applications connected currently"`
}

#Get Locks
fLock()
{
  lockHeld=`fGetvalue "Locks held currently"`
  lockWait=`fGetvalue "Lock waits"`
  lockWaittime=`fGetvalue "Time database waited on locks"`
  lockList=`fGetvalue "Lock list memory in use"`
  lockDead=`fGetvalue "Deadlocks detected"`
  lockEscalation=`fGetvalue "Lock escalations"`
  lockXescalation=`fGetvalue "Exclusive lock escalations"`
  lockAgentwait=`fGetvalue "Agents currently waiting on locks"`
  lockTimeout=`fGetvalue "Lock Timeouts"`
  lockIndoubttrans=`fGetvalue "Number of indoubt transactions"`
}

# Get sorts
fSort()
{
  sortPrivateheap=`fGetvalue "Total Private Sort heap allocated"`
  sortSharedheap=`fGetvalue "Total Shared Sort heap allocated"`
  sortHighwatermark=`fGetvalue "Shared Sort heap high water mark"`
  sortPostthreshlod=`fGetvalue "Post threshold sorts"`
  sortTotal=`fGetvalue "Total sorts"`
  sortTotaltime=`fGetvalue "Total sort time"`
  sortOverflow=`fGetvalue "Sort overflows"`
  sortActive=`fGetvalue "Active sorts"`
  sortTime=`fCalc "$sortTotaltime/$sortTotal"`
}

# Get buffer pool (bp)
fBufferpool()
{
  bpDatalogicalread=`fGetvalue "Buffer pool data logical reads"`
  bpDataphysicalread=`fGetvalue "Buffer pool data physical reads"`
  bpDatatemplogicalread=`fGetvalue "Buffer pool temporary data logical reads"`
  bpDatatempphysicalread=`fGetvalue "Buffer pool temporary data physical reads"`
  bpIndexlogicalread=`fGetvalue "Buffer pool index logical reads"`
  bpIndexphysicalread=`fGetvalue "Buffer pool index physical reads"`
  bpIndextemplogicalread=`fGetvalue "Buffer pool temporary index logical reads"`
  bpIndextempphysicalread=`fGetvalue "Buffer pool temporary index physical reads"`
  bpXdalogicalread=`fGetvalue "Buffer pool xda logical reads"`
  bpXdaphysicalread=`fGetvalue "Buffer pool xda physical reads"`
  bpXdatemplogicalread=`fGetvalue "Buffer pool temporary xda logical reads"`
  bpXdatempphysicalread=`fGetvalue "Buffer pool temporary xda physical reads"`
  bpLogicalread=`fCalc "$bpDatalogicalread+$bpDatatemplogicalread+$bpIndexlogicalread+$bpIndextemplogicalread + $bpXdalogicalread+$bpXdatemplogicalread"`
  bpPhysicalread=`fCalc "$bpDataphysicalread+$bpDatatempphysicalread+$bpIndexphysicalread+$bpIndextempphysicalread+$bpXdaphysicalread+$bpXdatempphysicalread"`
  bpHitratio=`fCalc "(1-$bpPhysicalread/$bpLogicalread)*100"`
}

# Get statements (stmt) 
fStatement()
{
  stmtCommit=`fGetvalue "Commit statements attempted"`
  stmtRollback=`fGetvalue "Rollback statements attempted"`
  stmtDynamic=`fGetvalue "Dynamic statements attempted"`
  stmtStatic=`fGetvalue "Static statements attempted"`
  stmtFailed=`fGetvalue "Failed statement operations"`
  stmtSelect=`fGetvalue "Select SQL statements executed"`
  stmtXquery=`fGetvalue "Xquery statements executed"`
  stmtUID=`fGetvalue "Update/Insert/Delete statements executed"`
  stmtDDL=`fGetvalue "DDL statements executed"`
  stmtInactive=`fGetvalue "Inactive stmt history memory usage"`
}

# Get Log
fLog()
{
  logAvailable=`fGetvalue "Log space available to the database"`
  logUsed=`fGetvalue "Log space used by the database"`
  logSecondary=`fGetvalue "Maximum secondary log space used"`
  logTotal=`fGetvalue "Maximum total log space used"`
  logSecallocated=`fGetvalue "Secondary logs allocated currently"`
  logRead=`fGetvalue "Log pages read"`
  logReadtime=`fGetvalue "Log read time"`
  logWrite=`fGetvalue "Log pages written"`
  logWritetime=`fGetvalue "Log write time"`
  logReadspeed=`fCalc "$logRead/$logReadtime"`
  logWritespeed=`fCalc "$logWrite/$logWritetime"`
}
