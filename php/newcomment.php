<?php
include_once("includes/common.php");

if($_SESSION["username"] == "Anonymous")  //Check if already logged in as a user
{
     //Redirect to login since can't create comment as anon user
    header("Location: login.php");
    exit();
}

?>

