<?php
require_once("baseController.php");
class CategoriesController extends BaseController {

    private static $categoriesController = FALSE;

    protected  function __construct() {
        parent::__construct("Category");
    }

    public static function getInstance() {
        if (!self::$categoriesController)
            self::$categoriesController = new CategoriesController();
        return self::$categoriesController;
    }

    public function getParentCategories() {
        return CategoryManager::getParentCategories();
    }

    public function getCategories($cat) {
        return CategoryManager::getCategories($cat);
    }

}

?>
