DROP TABLE Comment, Post, User;

CREATE TABLE User(
	id INT(10) NOT NULL auto_increment,
	username VARCHAR(20) NOT NULL,
        salt CHAR(10) NOT NULL,
        hash CHAR(40) NOT NULL,
        fname VARCHAR(20) NOT NULL,
        lname VARCHAR(20) NOT NULL,
        email VARCHAR(30) NOT NULL,
        PRIMARY KEY(id),
        UNIQUE KEY(username),
        UNIQUE KEY(email))
	ENGINE = InnoDB;

CREATE TABLE Post(
	id INT(10) NOT NULL auto_increment,
	created TIMESTAMP NOT NULL DEFAULT NOW(),
    title VARCHAR(255) NOT NULL,
	content TEXT NOT NULL,
	published BOOLEAN NOT NULL DEFAULT 0,
	userid INT(10),
	PRIMARY KEY(id),
	FOREIGN KEY(userid) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE = InnoDB;
	
CREATE TABLE Comment(
	id INT(10) NOT NULL auto_increment,
	created TIMESTAMP NOT NULL DEFAULT NOW(),
	content TEXT NOT NULL,
	userid INT(10),
	postid INT(10),
	PRIMARY KEY(id),
	FOREIGN KEY(userid) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(postid) REFERENCES Post(id) ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE = InnoDB;

#Unfortunately the password will be viewable in the MySQL logs if you use this command, better to prepare SHA1 in PHP then send just SHA1.
Insert INTO User (id, Username, Salt, Hash, Fname, Lname, Email) VALUES (NULL, "admin", "9c8ffcdf2b", SHA1("9c8ffcdf2badmin"), "Admin", "Admin", "admin@localhost");

INSERT INTO Post (title, content, published, userid) VALUES ("Debugging", "Cloud9 does not have a debugger for PHP (neither does deltona) however Cloud9 makes it IMHO much easier to work with php remotely.  No permission problems, inflexible setup, etc... In order to help you debug I've set the php.ini to report all errors and notices.  Additionally, if your interested in variable contents I suggest using var_dump($your_variable); to take a peek inside.  It's very good for understanding what your working with.", TRUE, 1);

INSERT INTO Post (title, content, published, userid) VALUES ("Getting an grip", "This is the a template that you can use for your project in this class.  Take a look at the code in <strong>index.php</strong>, <strong>includes/common.php</strong>, and <strong>login.php</strong> to get an idea of how to work with PHP's PDO.  You can use this later as a template for your own additions and changes.  You should also consult the docs for PHP's PDO to get an idea of how to retrieve for example, just one result, all results, etc...", TRUE, 1);

INSERT INTO Comment (content, userid, postid) VALUES ("You could have done this faster with a framework :(", 1, 1);