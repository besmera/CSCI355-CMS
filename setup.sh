#!/bin/sh

echo "Creating branch for working"
git branch working

echo "Checking out working branch"
git checkout working

echo "Starting/Installing MySQL"
mysql-ctl start

echo "Creating CMS Database"
mysql -h $IP -u $C9_USER c9 < mysql/cms.sql