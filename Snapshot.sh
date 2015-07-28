#!/bin/sh
#auth       : nds
#creat date : 2015/01/13

# Enter db2 profile enviroment.
. /home/dba/sqllib/db2profile

cd /home/dba/shell

# Define a temp filepath.
if [ ! -d ./tmp ] ;then
  mkdir tmp
fi
filepath=`pwd`/tmp/

snap_database=$filepath"database.snap"
snap_locks=$filepath"lock.snap"
snap_dsql=$filepath"dynamicSQL.snap"
snap_bp=$filepath"bufferpool.snap"
snap_ts=$filepath"tablespace.snap"
snap_tb=$filepath"table.snap"

# Get a snapshot for database and put in $snaps.
db2 get snapshot for database on idbyf > $snap_database
db2 get snapshot for locks on idbyf > $snap_locks
db2 get snapshot for dynamic sql on idbyf > $snap_dsql
db2 get snapshot for bufferpools on idbyf > $snap_bp
db2 get snapshot for tablespaces on idbyf > $snap_ts
db2 get snapshot for tables on idbyf > $snap_tb

#rm $snaps
