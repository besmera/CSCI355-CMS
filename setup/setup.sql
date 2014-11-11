DROP DATABASE IF EXISTS website;

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



DROP DATABASE IF EXISTS payments;

CREATE DATABASE payments;

USE payments;

DROP TABLE `PaymentDetails`;

CREATE TABLE `PaymentDetails` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `id` mediumint,
  `name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `city` varchar(255),
  `state` varchar(50) default NULL,
  `zip` varchar(10) default NULL,
  `cardnum` varchar(16) default NULL,
  `exp` varchar(255),
  `cvv` varchar(255),
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;

INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (1,"Jena Lynn","9766 Praesent Street","Independence","MO","65595","4816045447671784","04/14","352"),(2,"Faith Acevedo","P.O. Box 449, 6545 Vestibulum Street","Newport News","VA","67699","346089026833416","03/17","655"),(3,"Kane Aguirre","7613 Ipsum Rd.","San Diego","CA","90269","372553020062398","02/17","742"),(4,"Orli Dickson","P.O. Box 232, 3168 Elit, Road","Norfolk","VA","24921","372820965660272","12/20","982"),(5,"Gregory Lamb","377-5070 Penatibus Road","Toledo","OH","25454","5210785267483445","06/19","220"),(6,"Desirae Battle","P.O. Box 868, 5623 Quam St.","Saint Paul","MN","93576","5150114965015092","09/20","819"),(7,"Chiquita Campos","965-7302 Mauris, St.","Sandy","UT","91093","378262432193389","12/14","307"),(8,"Nathaniel Garner","P.O. Box 100, 1057 Lorem, Rd.","Rockville","MD","77804","345382127734836","01/18","872"),(9,"Beck Britt","Ap #964-9746 Scelerisque Avenue","Cincinnati","OH","26990","376075836358125","05/19","113"),(10,"Rachel Weiss","7989 At St.","Los Angeles","CA","90672","5190871100109074","03/18","893");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (11,"Alfonso Curry","8661 Augue, Av.","Fairbanks","AK","99787","5161911440459089","10/20","711"),(12,"Theodore Oliver","895-4091 Non, Street","Bear","DE","83743","5123013892942103","08/19","325"),(13,"Ulysses Dillard","125-4110 Lectus Ave","Gulfport","MS","20571","4491575277084482","04/20","478"),(14,"Ezekiel Alford","P.O. Box 199, 6960 In St.","San Francisco","CA","94540","5345851434068756","05/15","658"),(15,"Leo Fitzpatrick","P.O. Box 851, 1131 Dui Avenue","Iowa City","IA","11652","5121170822489070","12/19","666"),(16,"Ingrid Mccray","414-3596 Libero Rd.","Tacoma","WA","15901","5286263111457220","11/14","173"),(17,"Savannah Bowers","622 Vestibulum Rd.","Saint Paul","MN","25627","349531850000373","02/20","890"),(18,"Amber Mercer","Ap #324-1919 Lectus. Road","Bridgeport","CT","31378","5161281863725747","10/16","434"),(19,"Gail Finch","P.O. Box 305, 9488 Etiam St.","Fayetteville","AR","72239","5327409045458777","01/20","936"),(20,"Shelley Harper","400-5281 Elit, Rd.","South Bend","IN","49935","5190492093958892","07/20","845");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (21,"Jeremy Medina","2846 Mauris Avenue","Casper","WY","20301","349249519933482","07/19","469"),(22,"Brooke Decker","5217 Viverra. Avenue","Lewiston","ME","80788","372898234377142","07/20","598"),(23,"Olivia Chandler","9464 Eget, Street","Kansas City","MO","57280","5120562566509470","07/14","985"),(24,"Taylor Scott","273-9401 Enim. Avenue","Annapolis","MD","57539","5176024238038807","07/13","450"),(25,"Raja Maynard","652-4709 Hendrerit. Ave","Baton Rouge","LA","31727","5339666206771508","12/18","560"),(26,"Phillip Ashley","9823 Condimentum St.","San Diego","CA","90933","5314397683893337","01/18","424"),(27,"Castor Hodges","5611 Sit Ave","Kenosha","WI","10483","346089584297034","06/14","378"),(28,"Miriam Crosby","825-119 Rutrum Street","Warren","MI","27523","5137299492089074","12/20","885"),(29,"Leigh Mercado","2741 Et, St.","Dallas","TX","92240","349083998560437","06/16","168"),(30,"Audra Pace","Ap #500-8650 Erat. St.","Kaneohe","HI","24072","5154675023891039","06/20","963");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (31,"Connor Ramos","P.O. Box 565, 1381 Nec Rd.","Norfolk","VA","35891","4976998762274168","04/20","889"),(32,"Miranda Melton","Ap #555-7062 Mus. St.","Cambridge","MA","72474","5221519087464548","02/13","187"),(33,"Craig Clements","Ap #496-4400 Sem Rd.","Montpelier","VT","52088","5157022925936617","11/18","291"),(34,"Dennis Castro","9163 Vehicula. Av.","Omaha","NE","24492","4397415923094378","10/18","944"),(35,"Shaeleigh Ross","Ap #781-6041 Ipsum Street","Fayetteville","AR","71164","5177884743143805","02/20","348"),(36,"Maile Ballard","Ap #997-3783 Donec Street","Olympia","WA","48473","348223764600693","10/17","391"),(37,"Chandler Foster","6127 Elit. St.","Miami","FL","45741","349291526583029","04/14","894"),(38,"Kibo Cline","215 Odio St.","Southaven","MS","65380","4925419246312239","11/18","274"),(39,"Emily Lawson","Ap #405-3704 Ridiculus Rd.","Saint Paul","MN","34905","5134938899674450","07/20","184"),(40,"Olga Battle","Ap #344-3855 Suscipit Rd.","Clarksville","TN","45556","5160864554625002","07/17","625");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (41,"Geraldine Winters","3268 Nascetur St.","Naperville","IL","89792","347118998955009","06/16","602"),(42,"Tad Mercado","P.O. Box 221, 5108 Vitae, St.","Springdale","AR","72257","372782664495059","05/17","716"),(43,"Priscilla Zamora","P.O. Box 252, 7071 Urna, Av.","Aurora","CO","76961","5133788413768630","03/19","292"),(44,"Carlos Mcfadden","Ap #446-788 Congue Avenue","Tucson","AZ","85956","4382328237127516","12/17","586"),(45,"Hadley Cobb","P.O. Box 186, 4608 Sodales Rd.","Overland Park","KS","59563","4770113089354701","02/13","367"),(46,"Brynne Conway","3166 Egestas. Road","Fairbanks","AK","99775","377129469184204","02/19","192"),(47,"Sylvester Riddle","522-8858 Natoque Road","Huntsville","AL","36922","5197346083973534","11/18","122"),(48,"Callum Doyle","Ap #455-6406 Cursus Av.","Lansing","MI","46131","376048398524982","09/20","937"),(49,"Burke Whitehead","453-2122 Commodo Avenue","Annapolis","MD","95183","341199025948064","09/15","294"),(50,"Vivien Preston","702-1457 Erat, Street","Southaven","MS","36119","5159273952082736","09/17","797");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (51,"Hadassah Howe","P.O. Box 319, 9957 Aenean Avenue","Bloomington","MN","47881","4128271570149807","09/16","512"),(52,"Candace Porter","Ap #215-1492 Et Av.","Montgomery","AL","35268","344514507365416","06/17","688"),(53,"Remedios Blackwell","110 Vitae St.","Grand Rapids","MI","54191","5185210045771677","07/13","923"),(54,"Xerxes Holloway","7729 Senectus Rd.","Nampa","ID","20944","345358463983514","12/20","313"),(55,"Rhiannon Tucker","736-3373 Egestas, Road","Springfield","MA","58800","5316293093967256","09/16","975"),(56,"Ariel Moon","238-9878 Dis Avenue","Grand Rapids","MI","73995","5193001614939427","10/15","691"),(57,"Kieran Dejesus","Ap #989-8504 Non Road","Auburn","ME","68518","5118107886603100","04/20","665"),(58,"Moana Lindsay","940-2174 Egestas. Avenue","West Valley City","UT","82901","5122507752012466","09/14","275"),(59,"Ignatius Wolf","2006 Egestas Ave","Memphis","TN","67220","5143500703256576","08/13","295"),(60,"September Payne","P.O. Box 866, 4682 Odio St.","Duluth","MN","58825","377192672598176","11/17","781");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (61,"Josephine Hodges","Ap #505-456 Vel St.","Eugene","OR","46726","376246084403719","08/19","809"),(62,"Callie Adams","311-4670 Ante Avenue","Broken Arrow","OK","60217","371280293369208","03/16","267"),(63,"Murphy Doyle","731-1105 Non, Road","Oklahoma City","OK","70565","342447208241099","02/17","121"),(64,"Cailin Flowers","P.O. Box 270, 3439 Ante. Avenue","Anchorage","AK","99961","4544912162143730","03/15","552"),(65,"Vivian Grant","P.O. Box 862, 7705 Id Rd.","Chattanooga","TN","60013","344260192732795","05/14","614"),(66,"Jamalia Morrow","P.O. Box 706, 7593 Dui, Street","Tacoma","WA","78008","375668895897925","11/15","545"),(67,"Hadassah Lang","P.O. Box 648, 6911 Tellus, Rd.","Racine","WI","51532","5178989957175212","09/19","625"),(68,"Claudia Hood","167-8267 Amet, Av.","Laramie","WY","10097","4124201877042658","12/17","749"),(69,"Reed Elliott","P.O. Box 484, 302 Aliquet Avenue","Akron","OH","27047","5129521575281391","11/16","190"),(70,"Beverly Rasmussen","888-5414 Pellentesque Avenue","Frederick","MD","55819","346523301953911","04/14","802");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (71,"Colette Whitaker","6145 Bibendum. Avenue","Newark","DE","45388","348041907510256","03/19","431"),(72,"Delilah Sampson","384-7657 Nullam Ave","San Antonio","TX","25490","344626973156354","03/20","459"),(73,"Roth Delacruz","547-7793 Fringilla. Road","Ketchikan","AK","99985","5370611633872616","12/14","602"),(74,"Ryan Carpenter","P.O. Box 120, 4868 Et, St.","Hilo","HI","65212","5187233195756565","11/16","152"),(75,"Nero Coffey","240-3944 At, Street","Overland Park","KS","96694","5134367240970029","05/20","474"),(76,"Ann Wyatt","Ap #375-1276 Faucibus Av.","Boston","MA","90276","5169025078448466","06/19","936"),(77,"Urielle Townsend","891-1680 Tincidunt, Street","Springfield","MO","42635","5372501400033944","04/20","728"),(78,"Kenyon Mcgowan","P.O. Box 398, 5398 Facilisis St.","Jackson","MS","65761","374214228974181","06/14","752"),(79,"Kennedy Rhodes","8411 Natoque St.","Rock Springs","WY","59223","5128431732822207","04/15","945"),(80,"Xaviera Huff","P.O. Box 492, 9939 Quisque Rd.","Grand Island","NE","33288","373335998875558","11/14","601");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (81,"Iona Griffin","3370 Mollis. Ave","Lexington","KY","77383","341620100962464","11/14","408"),(82,"Rebecca Dean","151-5599 Sit Street","Orlando","FL","85406","5169781952486378","12/15","766"),(83,"Lynn Blackwell","789-3024 Adipiscing Rd.","Essex","VT","25522","5249247890952972","02/14","476"),(84,"Willa Blackwell","111-4162 Pellentesque Avenue","Owensboro","KY","12588","342980887087993","09/17","350"),(85,"Amber Battle","P.O. Box 957, 6564 Sed Av.","West Valley City","UT","54768","4550495320605116","05/14","591"),(86,"Blythe Frost","220-4653 Posuere Street","Pike Creek","DE","90272","374126296850388","02/16","285"),(87,"Faith Cole","Ap #790-3389 Vitae St.","Jacksonville","FL","99960","4714507951494306","12/17","902"),(88,"Daquan Jacobson","Ap #817-4648 Dis Rd.","Denver","CO","71767","5163720898600294","03/18","330"),(89,"Brenden Finley","P.O. Box 898, 4607 Pede Road","Memphis","TN","55869","343058103095277","01/14","513"),(90,"Kameko George","Ap #691-5801 Et Ave","Augusta","ME","72423","5195531895421448","10/13","743");
INSERT INTO `PaymentDetails` (`id`,`name`,`address`,`city`,`state`,`zip`,`cardnum`,`exp`,`cvv`) VALUES (91,"Marah Richard","P.O. Box 557, 2267 Et, St.","Boise","ID","94528","345050021798817","02/15","805"),(92,"Kasimir Brock","8996 Quam, Rd.","Oklahoma City","OK","61957","343794684273190","01/18","506"),(93,"Gil Campbell","Ap #574-6494 Sodales Avenue","Omaha","NE","83372","4606747033447024","12/13","894"),(94,"Aladdin Koch","P.O. Box 351, 3893 Nonummy Road","Indianapolis","IN","54783","374315588219550","05/14","200"),(95,"Reuben Glenn","Ap #379-5117 Purus. Avenue","Nashville","TN","44916","5329881595582703","05/20","645"),(96,"Damon Cherry","409-8568 Non St.","Metairie","LA","39900","5153453770792118","06/16","954"),(97,"Fallon Rodriguez","660-6086 Cras Rd.","Hilo","HI","61306","377056136684498","12/18","672"),(98,"Julie Castro","P.O. Box 803, 4954 Non, Road","Pittsburgh","PA","24240","376019434091631","05/16","314"),(99,"Abdul Trujillo","Ap #172-6956 Quam Av.","Shreveport","LA","21303","5124772880710666","02/14","517"),(100,"Hyacinth Stokes","P.O. Box 152, 3738 Praesent St.","Missoula","MT","49273","377381856155117","03/18","473");
