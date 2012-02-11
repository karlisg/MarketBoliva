<?php
require_once("controllers/searchController.php");
require_once("basic_views/baseView.php");
class Search extends BaseView
{
    public function __construct()
    {
        SessionUtil::setMenu("search.php");
        parent::__construct();
    }

    public function show()
    {
        ?>

    <div id="content" style="display:none;">
        Has wuscado isto:
        <?php echo $_GET['txtSearch']; ?>
        <div data-role="fieldcontain" data-theme="c">
            <fieldset data-role="controlgroup" data-type="horizontal" data-theme="c" >
                <?php foreach (SearchController::getInstance()->getProducts($_GET['txtSearch']) as $key => $product) { ?>
                <input type="radio" name="" id="cat<?php echo $key ?>" value="index.php"/>
                <label for="cat<?php echo $key ?>"><?php echo $product['name'] ?></label>
                <?php } ?>
            </fieldset>
        </div>
    </div>


    <?php
    }
}

new Search();
?>