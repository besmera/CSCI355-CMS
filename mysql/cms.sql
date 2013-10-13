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

Insert INTO User (id, Username, Salt, Hash, Fname, Lname, Email) VALUES (NULL, "admin", "9c8ffcdf2b", SHA1("9c8ffcdf2badmin"), "Admin", "Admin", "admin@localhost");
