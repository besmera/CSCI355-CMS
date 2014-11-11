#!/bin/sh

cd /var/www
git clean -d -x -f
git reset --hard HEAD

cd /var/www/setup
mysql -u root < setup.sql
