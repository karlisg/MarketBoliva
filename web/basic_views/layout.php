<!DOCTYPE html> 
<html> 
    <head>
        <title><?php echo SessionUtil::getTitle(); ?></title>
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <link rel="stylesheet" href="css/jquery.mobile-1.0.min.css" />
        <link rel="stylesheet" href="css/marketbolivia.css" />
        <script type="text/javascript" src="js/jquery-1.6.4.min.js"></script>
        <?php require_once("scripts.php"); ?>
    </head> 
    <body> 
        <div data-role="page" id="page" style="display:none" > 
            <div data-role="header">
                <?php require_once("header.php"); ?>
            </div> 
            <div data-role="content">                
                <?php require_once("menu.php"); ?>
                <div id="contentHTML">
                </div>
            </div> 
            <div data-role="footer">                
                <?php require_once("footer.php"); ?>
            </div> 
        </div>
        <script type="text/javascript">
            $(document).ready(function() {                
                $("#contentHTML").html($("#content").html());

                $.getScript("js/jquery.mobile-1.0.min.js", function(data, textStatus){
                    $("#page").show();
                }); 
            });
        </script>
    </body>
</html>