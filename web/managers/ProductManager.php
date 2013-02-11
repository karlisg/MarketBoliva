<?php

require_once("BaseManager.php");
require_once("models/Product.php");
class ProductManager extends BaseManager
{
    private static function getProducts($where)
    {
        $products = new Query("");
        $products->select1(" * ", "product", $where);
        $products->run();
        return BaseManager::convertObjectsToArray("Product", $products->getAll());
    }

    public static function getAllProducts()
    {
        $products = new Query("");
        $products->select0(" * ", "product");
        $products->run();
        return BaseManager::convertObjectsToArray("Product",$products->getAll());
    }

    public static function getProductsByTextSearch($txtSearch)
    {
        $products = new Query("");
        $products->select1(" * ", "product", " lower(name) like lower('%" . trim($txtSearch) . "%') ");
        $products->run();
        return BaseManager::convertObjectsToArray("Product", $products->getAll());
    }

    public static function getProductsByCategory($cat)
    {
        $products = new Query("");
        $products->select1("p.\"idProduct\" as \"idProduct\", code, name, description, price ", " product p, product_category_mapping pbc ", " p.\"idProduct\" = pbc.\"idProduct\" AND pbc.\"idCategory\" = $cat");
        $products->run();
        return BaseManager::convertObjectsToArray("Product", $products->getAll());
    }
}

//print_r(ProductManager::getAllProducts());

?>
