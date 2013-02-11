<?php require_once('controllers/categoriesController.php'); ?>

<div data-role="fieldcontain" data-theme="c" style="float:left;">
    <fieldset data-role="controlgroup" data-type="horizontal" data-theme="c" >
        <input type="radio" name="menu" id="mindex" value="index.php" 
        <?php if ($_SESSION['menu'] == "index.php")
            echo 'checked="checked"'; ?> />
        <label for="mindex"><?php echo $_SESSION['locale']['menu.home']; ?></label>


        <?php foreach (CategoriesController::getInstance()->getParentCategories() as $key => $category) {
            $id= $category['id'] ?>
            <input type="radio" name="menu" id="mcat<?php echo $id ?>" value="juanita.php?cat=<?php echo $id ?>"
            <?php if ($_SESSION['menu'] == "juanita.php?cat=$id")
                echo 'checked="checked"'; ?> />
            <label for="mcat<?php echo $id ?>"><?php echo $category['name'] ?></label>
        <?php } ?>            

    </fieldset>

</div>

<form action="search.php" method="GET" data-ajax="false">
    <table id="tabSearch">
        <tr>
            <td>
                <input type="search" name="txtSearch" data-theme="a" id="txtSearch" value="<?php echo $_GET['txtSearch']; ?>" data-inline="true" placeholder="<?php echo $_SESSION['locale']['menu.search']; ?>"  />
            </td>
            <td>
                <input type="submit"  data-icon="search" data-iconpos="notext" data-inline="true" /> 
            </td>
        </tr>
    </table>
</form>
<div style="clear:both"></div>



<script type="text/javascript">
    $(document).ready(function() {                
        $("input[name$='menu']").change(function() {
            window.location.href = $(this).val()+"";
        });
                
    });
</script>
