<?php
include_once("includes/common.php");

if($_SESSION["username"] == "Anonymous")  //Check if already logged in as a user
{
     //Redirect to login since they are anonymous and anon users should not make posts
    header("Location: login.php");
    exit();
}

//Check and see if this was a POST (trying to create post)
if($_SERVER['REQUEST_METHOD'] == "POST")
{
    $error = FALSE; //No errors yet
    
    global $db; //Use the global db connection/PDO object
    
    //A title and post should have been specified to save to db
    if(isset($_POST["title"]) && isset($_POST["content"]) && $_POST["title"] != "" && $_POST["content"] != "")
    {
        try
        {

            /*
            * Security Good: There is nothing good here. Weary souls beware.
            * Security Bad: Extremely vulnerable to SQL injection.
            */

            //I don't bother dealing with SQL injection... I'll trust users are honest.
            $query = "INSERT INTO Post (title, content, published, userid) VALUES ('" . $_POST['title'] . "', '" . $_POST['content'] . "', TRUE, " . $_SESSION['uid'] . ")";
            $db->exec($query);  //Insert Post into DB

            $postid = $db->lastInsertId(); //Gets the id for the newly inserted post
            
            //Check and see if they added tag1
            if(isset($_POST["tag1"]) && $_POST["tag1"] != "")
            {  
                $query = "INSERT INTO Tag (postid, tag) VALUES (" . $postid . ",'" . $_POST["tag1"] . "')";
                $db->exec($query); //Insert the first tag into DB
            }
            
            //Check and see if they added tag2
            if(isset($_POST["tag2"]) && $_POST["tag2"] != "")
            {
                $query = "INSERT INTO Tag (postid, tag) VALUES (" . $postid . ",'" . $_POST["tag2"] . "')";
                $db->exec($query); //Insert the second tag into the DB
            }
            
        }
        catch (Exception $ex)
        {

            $error = TRUE;
            //Forcing an error message similar to if no try/catch was done
            $errorMessage = print_r($ex, true);  
        }

        if(!$error)
        {
            header("Location: index.php");
        }
        
    }
    else
    {
        $error = TRUE;
        $errorMessage = "You must specify both a post title and content."; 
    }
}

//Don't use header.php until ready to output HTML
include_once("includes/header.php");
?>

    <?php
        if(isset($error) && $error == true)
        {
    ?>
        <div class="alert alert-danger">
          <strong>Error:</strong> <?php echo $errorMessage ?>
        </div>
    <?php
        }
    ?>
    

<div class="row">
    <div class="col-md-12">
    <h2>New Post</h2>
    </div>
</div>

<div class="row">
    <div class="col-md-11 col-md-offset-1">
    

      <form action="newpost.php" method="POST">
        <div class="form-group">
            <label>Post Title:</label>
            <input name="title" type="text" class="form-control" placeholder="Your Post Title" value="<?php echo isset($_POST['title']) ? $_POST['title'] : '' ?>" autofocus>
        </div>
        
        <div class="form-group">
            <label>Post Content:</label>
            <textarea name="content" rows="5" class="form-control" placeholder="Your Post's Content"><?php echo isset($_POST['content']) ? $_POST['content'] : '' ?></textarea>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Tag 1:</label>
                    <input name="tag1" type="text" class="form-control" placeholder="First Tag" value="<?php echo isset($_POST['tag1']) ? $_POST['tag1'] : '' ?>">
                </div>
            </div>
            <div class="col-md-4">    
                <div class="form-group">
                    <label>Tag 2:</label>
                    <input name="tag2" type="text" class="form-control" placeholder="Second Tag" value="<?php echo isset($_POST['tag2']) ? $_POST['tag2'] : '' ?>">
                </div>
            </div>
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary" type="submit">Create</button>
        </div>
      </form>
    </div>
</div>





<?php
include_once("includes/footer.php");

?>
