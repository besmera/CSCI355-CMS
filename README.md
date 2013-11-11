CSCI355-CMS Project Part 4
===========
In this part of the project you will create a table to record data for an A/B test.  
You will also have to insert data into the database and update the data at a later
time.  Do not worry about normalization of the table.  A single table will do.

See this article http://php.net/manual/en/function.uniqid.php to determine the data
type you should use for the uniq id.  HINT: it will be char() something.

I have already written the code to set a cookie that stores the group and a unique id 
for each user.  Some will receive a link to subscribe, others a red button.  The 
idea is to see which one results in more subscriptions.  In order to do that you will:

* Create a table to store the uniqid, group number, and whether it resulted in a conversion. (mysql/cms.sql)
* Insert the uniqid and group into the database (common.php)
* Later update the database if it resulted in a subscription (goal.php)
* Write a SELECT statement to calculate the number of people in each group and the number subscribed. Put that in (mysql/cms.sql) as well.

You can test your mysql/cms.sql by running the command: 
mysql -h $IP -u $C9_USER c9 < mysql/cms.sql