#!/usr/bin/bash

DUMP=/usr/bin/mysqldump    #mysqldump备份程序执行路径
OUT_DIR=/home/mysql_data   #备份文件存放路径

#要备份的数据库名字
DB_NAME=dbname
#数据库账号 注意：非root用户要用备份参数 --skip-lock-tables，否则可能会报错
DB_USER=root
#数据库密码
DB_PASS=123456
#DAYS=7代表删除7天前的备份，即只保留最近7天的备份
DAYS=7



cd $OUT_DIR                #进入备份存放目录
DATE=`date +%Y_%m_%d`      #获取当前系统时间
OUT_SQL="$DATE.sql"        #备份数据库的文件名

#最终保存的数据库备份文件名
TAR_SQL="mysqldata_bak_$DATE.tar.gz"

#备份
$DUMP -u$DB_USER -p$DB_PASS $DB_NAME --default-character-set=utf8 --opt -Q -R --skip-lock-tables> $OUT_SQL

#压缩为.tar.gz格式
tar -czf $TAR_SQL ./$OUT_SQL

#删除.sql格式的备份文件
rm $OUT_SQL

#删除7天前的备份文件
find $OUT_DIR -name "mysqldata_bak*" -type f -mtime +$DAYS -exec rm {} \;
