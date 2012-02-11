<?php
require_once("managers/ProductManager.php");
require_once("baseController.php");
class SearchController extends BaseController {

    private static $searchController = FALSE;

    protected  function __construct() {
    }

    public static function getInstance() {
        if (!self::$searchController)
            self::$searchController = new SearchController();
        return self::$searchController;
    }

    public function getProducts($txtSearch) {        
        return ProductManager::getProductsByTextSearch($txtSearch);
    }

}

?>
