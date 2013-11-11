<?php

//Start session before content sent
session_start();

//Initialize username if one does not exist.
if(!array_key_exists("username", $_SESSION))
    $_SESSION['username'] = "Anonymous";

//Per Cloud9 docs
$C9_IP = getenv("IP");
$C9_USER = getenv("C9_USER");
$C9_PASS = NULL;
$C9_DB = "c9"; 

try
{
    $db = new PDO("mysql:host=$C9_IP;dbname=$C9_DB", $C9_USER, $C9_PASS);
    
    //Makes PDO throw exceptions for invalid SQL
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch(Exception $ex)
{
    die($ex->getMessage());
}
 

/**************************************               
 * 
 * Project Part 4
 * 
 **************************************/
 
//Set a seperate cookie for A/B Testing
if(!isset($_COOKIE['abtest']))
{
    $group = rand(1,2);
    $uniq = uniqid();
    setcookie('abtest[group]', $group);
    setcookie('abtest[uniq]', $uniq);
    
    //Setup the cookie so it can be used on first run.
    $_COOKIE['abtest'] = array("group" => (string) $group, "uniq" => $uniq);

    //HINT: An insert to the DB would be appropriate here.

}

/**************************************               
 * 
 * End Project Part 4
 * 
 **************************************/


/*
* Accepts user credentials and returns true if login succeeds, otherwise false.
*/
function login($username, $password)
{
    
    /*
    * Security Good: Uses paramaterized queries... no SQL injection
    * Security Bad: User/Pass will be stored in plaintext for MySQL logs
    */
    global $db; //Use the $db declared already
    
    $stmt = $db->prepare("Select * from User where (username, hash) = (Select username, SHA1(CONCAT(salt, :password)) as hash FROM User where username = :username)");
    $stmt->bindValue(":username", $username);
    $stmt->bindValue(":password", $password);
    $stmt->execute();
    
    if($stmt->rowCount() == 1)
    {
        $row = $stmt->fetch(PDO::FETCH_ASSOC);
        $_SESSION = array(); //Unset all session vars now
        $_SESSION['username'] = $username; //Set the username var
        $_SESSION['uid'] = $row["id"];
        
        return true;
    }
    return false;
}

/*
* Logs the user our by destroying their session, unsetting all array keys and setting user to Anonymous.
*/
function logout()
{
    session_destroy();
    $_SESSION = array(); //Unset all session vars now
    $_SESSION['username'] = "Anonymous"; //Set username back to anoymous
    return true;
}

