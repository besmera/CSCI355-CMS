<?php
include_once("includes/common.php");

if($_SESSION["username"] == "Anonymous")  //Check if already logged in as a user
{
     //Redirect to login since can't create post as anon user
    header("Location: login.php");
    exit();
}


//Don't use header.php until ready to output HTML
include_once("includes/header.php");
?>


<div class="row">
    <div class="col-md-offset-3 col-md-6 col-md-offset-3">
    
      <form action="newpost.php" method="POST">
        <h2>New Post:</h2>
        
        <div class="form-group">
            <input name="title" type="text" class="form-control" placeholder="Post Title" autofocus>
        </div>
        
        <div class="form-group">
            <textarea name="content" class="form-control" placeholder="Post Content..."></textarea>
        </div> 
          
        <div class="form-group">
            <button class="btn btn-primary pull-right" type="submit">Create</button>
        </div>
      </form>
      
    </div>
</div>



<?php
include_once("includes/footer.php");

?>