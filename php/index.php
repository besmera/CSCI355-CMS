<?php
include_once("includes/common.php");

global $db;

//Write the SQL statement and prepare it for running
$stmt = $db->prepare("SELECT id, title, content, created FROM Post ORDER BY created DESC LIMIT 3");
//Run the SQL statement
$stmt->execute();
//Later on you can fetch the results


//Don't use header.php until ready to output HTML
include_once("includes/header.php");
?>

<div class="row">
    <div class="col-md-12">
        <div class="media">
        <?php
        
        //Fetch the results one by one in a loop
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        //$row["title"] will hold the title columns value!
        ?>
           
            <div class="media-body">
                <h4><?php echo $row["title"] ?> - <span class="text-muted"><?php echo $row["created"] ?></span></h4>
                <p>
                    <?php
                        //Get all the tags associated with the post being outputed
                        //You shouldn't trust data from your DB either.
                        $tagStmt = $db->prepare("SELECT tag FROM Tag WHERE postid = :postid");
                        $tagStmt->bindValue(":postid", $row["id"]); 
                        $tagStmt->execute();
                        
                        //Loop through all the tags and output them on the screen.
                        while($tagRow = $tagStmt->fetch(PDO::FETCH_ASSOC))
                        {
                    ?>
                        <span class="label label-default"><?php echo $tagRow["tag"] ?></span>    
                    <?php        
                        }
                    ?>
                    
                </p>
                <p>
                    <?php echo $row["content"] ?>
                </p>
                
                
            </div>
        <?php
        }
        ?>
        </div>
    </div>
</div>


<?php
include_once("includes/footer.php");

?>