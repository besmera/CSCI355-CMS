DROP DATABASE website;

CREATE DATABASE website;

USE website;

DROP TABLE IF EXISTS Comment, Tag, Post, User;

CREATE TABLE User(
	id INT UNSIGNED NOT NULL auto_increment,
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
	id INT UNSIGNED NOT NULL auto_increment,
	created TIMESTAMP NOT NULL DEFAULT NOW(),
	title VARCHAR(255) NOT NULL,
	content TEXT NOT NULL,
	published BOOLEAN NOT NULL DEFAULT 0,
	userid INT UNSIGNED,
	PRIMARY KEY(id),
	FOREIGN KEY(userid) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE = InnoDB;
	
CREATE TABLE Tag( 
    postid INT UNSIGNED NOT NULL, 
    tag varchar(20) NOT NULL, 
    PRIMARY KEY(postid, tag),
    FOREIGN KEY(postid) REFERENCES Post(id) ON DELETE CASCADE ON UPDATE CASCADE) 
    ENGINE = InnoDB;
	
CREATE TABLE Comment(
	id INT UNSIGNED NOT NULL auto_increment,
	created TIMESTAMP NOT NULL DEFAULT NOW(),
	content TEXT NOT NULL,
	userid INT UNSIGNED,
	postid INT UNSIGNED,
	PRIMARY KEY(id),
	FOREIGN KEY(userid) REFERENCES User(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(postid) REFERENCES Post(id) ON DELETE CASCADE ON UPDATE CASCADE)
	ENGINE = InnoDB;

#Unfortunately the password will be viewable in the MySQL logs if you use this command, better to prepare SHA1 in PHP then send just SHA1.
Insert INTO User (id, Username, Salt, Hash, Fname, Lname, Email) VALUES (NULL, "admin", "9c8ffcdf2b", SHA1("9c8ffcdf2badmin"), "Admin", "Admin", "admin@localhost");

INSERT INTO Post (title, content, published, userid) VALUES ("Hello!", "Welcome to the site.  Hope there are no problems!", TRUE, 1);

INSERT INTO Post (title, content, published, userid) VALUES ("Logging in", "You can login with the username admin and the password admin", TRUE, 1);

INSERT INTO Comment (content, userid, postid) VALUES ("I think there is an issue...", 1, 1);

INSERT INTO Tag (postid, tag) VALUES (1, "SQL"), (1, "Injection"), (2, "Auth");


# Project Part 4




# End Project Part 4




