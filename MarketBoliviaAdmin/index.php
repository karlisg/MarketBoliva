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

    <h3> This the home page </h3>
    <br/>

    <?php
    }
}
new Index();
?>
