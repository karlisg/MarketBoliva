<?php

require_once("BaseManager.php");
require_once("../models/Category.php");
class CategoryManager extends BaseManager
{

    public static function getParentCategories()
    {
        return CategoryManager::getCategories(0);
    }

    public static function getCategories($cat)
    {
        $categories = new Query("");
        $categories->select1(" * ", "category", " \"parentId\" = $cat");
        $categories->run();
        return BaseManager::convertObjectsToArray("Category", $categories->getAll());
    }
}

print_r(CategoryManager::getParentCategories());
?>
