<?php require_once('controllers/categoriesController.php'); ?>
<div data-role="fieldcontain" data-theme="c">
    <fieldset data-role="controlgroup" data-type="horizontal" data-theme="c" >
        <?php foreach (CategoriesController::getInstance()->getCategories($_GET['cat']) as $key => $category) { ?>
            <input type="radio" name="cat" id="cat<?php echo $category['id'] ?>" value="index.php"/>
            <label for="cat<?php echo $category['id']; ?>"><?php echo $category['name'] ?></label>
        <?php } ?>
    </fieldset>
</div>