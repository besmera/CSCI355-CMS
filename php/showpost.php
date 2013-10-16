<?php
include_once("includes/common.php");

global $db;

if(array_key_exists("pid", $_GET))
    $pid = $_GET["pid"];
else
    $pid = NULL;
    

//Don't use header.php until ready to output HTML
include_once("includes/header.php");
?>

<div class="row">
    <div class="col-md-12">
        <div class="page-header">
          <h1>Post Title <small> - Post Author</small></h1>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-12">
        <p>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin varius posuere lacus, non rhoncus ipsum lacinia non. Nullam malesuada metus id justo sodales eleifend. Nulla laoreet massa ac nibh semper malesuada. Sed eget diam vestibulum, aliquam neque porttitor, molestie velit. In sit amet libero vitae felis ultrices tristique. Vestibulum fermentum tincidunt lectus, ac semper sapien porttitor id. Nullam massa metus, suscipit at adipiscing et, laoreet nec arcu. Aliquam ante leo, feugiat eu commodo eu, condimentum id dui. Donec ac risus id nibh fringilla vehicula. Aliquam erat volutpat. Nunc varius pulvinar rhoncus. Fusce congue velit nibh, a aliquam sapien laoreet eu. Morbi a posuere dolor, et tempor sapien. Suspendisse eleifend mattis mi a vestibulum. Etiam ullamcorper ornare dolor, sit amet luctus mi dapibus eu. Phasellus eu sollicitudin dui.
        </p>
    </div>
</div>

<div class="row">
    <div class="col-md-7 col-md-offset-1">
    
    
    
    
    
    
    
    
        <div class="panel panel-default">
          <div class="panel-heading"><span class="text-primary">admin</span> - <span class="text-muted">10/10/2013</span></div>
          <div class="panel-body">
            Comment text
          </div>
        </div>
        
        
        
        
        
        
        
        
        <div class="panel panel-default">
          <div class="panel-heading"><span class="text-primary">admin</span> - <span class="text-muted">10/11/2013</span> <a href="deletecomment.php?cid=1" class="pull-right"><span class="glyphicon glyphicon-trash"></span></a> </div>
          <div class="panel-body">
            Comment 2 text
          </div>
        </div>
        
        
        
        
        
        
        
        
        <?php 
        if($_SESSION["username"] != "Anonymous") 
        {
        ?>        
        <div class="panel panel-default">
          <div class="panel-heading"><span class="text-primary"><?php echo $_SESSION["username"] ?></span> - <span class="text-muted"><?php echo date("m/d/Y") ?></span></div>
          <div class="panel-body">
            <form action="newcomment.php" method="POST">
                <div class="form-group">
                    <textarea name="comment" placeholder="Comment" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <button class="btn pull-right btn-primary" type="submit">Make Comment</button>
                </div>
              </form>
          </div>
        </div>
        <?php 
        }
        ?>     
        
        
        
        
        
    </div>
</div>




<?php
include_once("includes/footer.php");

?>