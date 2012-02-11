<?php
require_once("basic_views/baseView.php");
class Index extends BaseView
{
    public function __construct()
    {
        SessionUtil::setMenu("index.php");
        parent::__construct();
    }

    public function show()
    {

        ?>

        HOME PAGE HERE!!!
    <?php
    }
}
new Index();
?>
