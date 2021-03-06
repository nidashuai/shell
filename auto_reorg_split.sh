#!/usr/bin/sh
#
#

#定义变量
TT=`/usr/bin/date +"%Y%m%d%H%M%S"`; export TT
. /home/dba/sqllib/db2profile
cd /home/dba/reorg

#生成reorg.txt
db2 connect to database  
db2 reorgchk current statistics on table all > reorg.txt

#将reorg.txt文件分割成reorg_table.txt和reorg_index.txt
awk '{
       print $0;
       if(/Index statistics:/) exit; 
     }' reorg.txt > reorg_table.txt
     
awk '/Index statistics:/,0' reorg.txt > reorg_index.txt

#在reorg_table.txt中查找表需要重组的表
awk '{
      a[NR]=$0;
      if(/\*/)              
       {
        for(i=NR-1;i>0;i--)
        { 
          if(match(a[i],/Table/)) 
           {
            print a[i] ;
            break;
           }
        }
       }
}' reorg_table.txt >reorg_table_list.txt

#在index_table.txt中查找索引需要重组的表
awk '{ if(/\*/) print $0;print NR; }' reorg_index.txt >reorg_index_list.txt
awk '{
      a[NR]=$0;
      if(/\*/)              
       {
        for(i=NR-1;i>0;i--)
        { 
         if(match(a[i],/Table/))
           {
            print a[i] ;
            break;
           }
        }
       }
}' reorg_index.txt >reorg_index_list.txt


#去除重复的表名及不需要的字段     
grep 'Table:' reorg_table_list.txt| cut -d : -f 2 |sort |uniq > Table.txt
grep 'Table:' reorg_index_list.txt| cut -d : -f 2 |sort |uniq > Index.txt

#生成重组sql脚本
awk '{printf "reorg indexes all for table %s allow write access;\n",$0}' Index.txt > reorg_index.sql
awk '{printf "reorg table %s inplace allow write access;\n",$0}' Table.txt > reorg_table.sql

#执行sql脚本
db2 -vtf reorg_table.sql > auto_reorg_$TT.msg
db2 -vtf reorg_index.sql > auto_reorg_$TT.msg

#关闭数据库连接
db2 terminate
