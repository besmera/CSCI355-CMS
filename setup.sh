#!/bin/sh

echo "Creating working branch"
git branch 2working

echo "Checking out working branch"
git checkout 2working

echo "Starting/Installing MySQL"
mysql-ctl start

echo "Creating CMS Database"
mysql -h $IP -u $C9_USER c9 < mysql/cms.sql