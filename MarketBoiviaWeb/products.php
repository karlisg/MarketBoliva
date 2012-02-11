<?php require_once('controllers/productsController.php'); ?>
<?php $products = ProductsController::getInstance()->getProducts($_GET['cat']); ?>
<?php if (count($products) > 0) { ?>
    <h2><?php echo $_SESSION['locale']['list.products']; ?></h2>
    <div data-role="fieldcontain" data-theme="c">
        <fieldset data-role="controlgroup" data-type="horizontal" data-theme="c" >
            <?php foreach ($products as $key => $product) { ?>
                <input type="radio" name="" id="cat<?php echo $key ?>" value="index.php"/>
                <label for="cat<?php echo $key ?>"><?php echo $product['name'] ?></label>

            <?php } ?>
        </fieldset>
    </div>
<?php } ?>
