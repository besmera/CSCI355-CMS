#!/bin/sh

echo "Creating working branch"
git branch 3working

echo "Checking out working branch"
git checkout 3working

echo "Starting/Installing MySQL"
mysql-ctl start

echo "Creating CMS Database"
mysql -h $IP -u $C9_USER c9 < mysql/cms.sql

echo "---------------------------------------------"
echo "All done setting everything up."
echo "Now you can open php/index.php and click Run."