<?php
require_once("BaseObject.php");

class Product extends BaseObject
{
    private $id;
    private $code;
    private $name;
    private $description;
    private $price;


    public function __construct()
    {
    }

    public function toArray()
    {
        return array("id" => $this->id, "code" => $this->code, "name" => $this->name, "description" => $this->description, "price" => $this->price);
    }

    public function validate()
    {
        return true;
    }

    public function setCode($code)
    {
        $this->code = $code;
    }

    public function getCode()
    {
        return $this->code;
    }

    public function setDescription($description)
    {
        $this->description = $description;
    }

    public function getDescription()
    {
        return $this->description;
    }

    public function setId($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setName($name)
    {
        $this->name = $name;
    }

    public function getName()
    {
        return $this->name;
    }

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function getPrice()
    {
        return $this->price;
    }
}

?>
