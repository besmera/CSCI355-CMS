#!/bin/sh

echo "Starting/Installing MySQL"
mysql-ctl start

echo "Creating CMS Database"
mysql -h $IP -u $C9_USER c9 < mysql/cms.sql