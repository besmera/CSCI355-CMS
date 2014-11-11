<!DOCTYPE html>
<html lang="en">

<head>
    <title>CSCI355 - CMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.js"></script>
    
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
    
    <!-- Optional theme -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-theme.min.css">
    
    <!-- Latest compiled and minified JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    
</head>

<body>
<nav class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
          <a class="navbar-brand" href="index.php">355 CMS</a>
        </div>
        
        <ul class="nav navbar-nav">
            <li><a href="index.php">Home</a></li>
            <li><a href="newpost.php">New Post</a></li>
        </ul> 
        
        <?php 
        if($_SESSION["username"] == "Anonymous") 
        {
        ?>
            <p class="navbar-text pull-right">Hi there, <?php echo $_SESSION["username"];?> - <a href="login.php" class="navbar-link">Login</a></p>
        <?php 
        }
        else
        {
        ?>
            <p class="navbar-text pull-right">Welcome back, <?php echo $_SESSION["username"];?> - <a href="logout.php" class="navbar-link">Logout</a></p>
        <?php
        }
        ?>
        
</nav>

   
<div class="container">


<?php 
    if(isset($_COOKIE["abtest"])) 
    {
        if($_COOKIE["abtest"]["group"] == "1")
        {
?>
<a href="goal.php">Subscribe</a>
<?php 
        }
        else
        {
            ?>
<a href="goal.php" class="btn btn-danger">Subscribe</a>
            <?php
        }
    }
?>

