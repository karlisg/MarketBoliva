<?php
require_once("basic_views/baseView.php");
class Juanita extends BaseView
{
    public function __construct()
    {
        SessionUtil::setMenu("juanita.php?cat=" . $_GET['cat']);
        parent::__construct();
    }

    public function show()
    {
        ?>

    <h2><?php echo $_SESSION['locale']['list.categories']; ?></h2>
    <?php require_once("categories.php") ?>
    <?php require_once("products.php") ?>

    <?php
    }
}

new Juanita();
?>