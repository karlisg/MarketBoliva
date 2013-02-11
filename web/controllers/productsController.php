<?php
require_once("baseController.php");
class ProductsController extends BaseController
{

    private static $productsController = FALSE;

    protected function __construct()
    {
        parent::__construct("Product");
    }

    public static function getInstance()
    {
        if (!self::$productsController)
            self::$productsController = new ProductsController();
        return self::$productsController;
    }

    public function getProducts($cat)
    {
        return ProductManager::getProductsByCategory($cat);
    }
}

?>
