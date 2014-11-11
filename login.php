<?php
include_once("includes/common.php");

if($_SESSION["username"] != "Anonymous")  //Check if already logged in as a user
{
     //Redirect to index
    header("Location: index.php");
    exit();
}

if(array_key_exists("username", $_POST) && array_key_exists("password", $_POST))  //See if they posted a username and password
{
    $success = login($_POST["username"], $_POST["password"]);
    if($success)  //Successfully logged in
    {
        //Redirect to index
        header("Location: index.php");
        exit();
    }
    else
    {
        $error = true;  //User of pass is invalid
    }
}
else
{
    $error = false; //No error because no login attempted.
}

//Don't use header.php until ready to output HTML
include_once("includes/header.php");
?>








<div class="row">
    <div class="col-md-offset-3 col-md-6 col-md-offset-3">
    
    <?php
        if($error == true)
        {
    ?>
        <div class="alert alert-danger">
          Invalid username or password.
        </div>
    <?php
        }
    ?>
    
      <form action="login.php" method="POST">
        <h2>Sign In:</h2>
        <div class="form-group">
            <input name="username" type="text" class="form-control" placeholder="Username" autofocus>
        </div>
        <div class="form-group">
            <input name="password" type="password" class="form-control" placeholder="Password">
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        </div>
      </form>
      
    </div>
</div>





<?php
include_once("includes/footer.php");

?>
