#!/bin/sh

cd /var/www
git reset --hard HEAD

cd /var/www/setup
mysql -u root < setup.sql
