<?php
include_once("includes/common.php");

logout();  //Do the logout
header("Location: login.php"); //Send them to login page
exit();

?>