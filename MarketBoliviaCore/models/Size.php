<?php
require_once("BaseObject.php");
class Size extends BaseObject {

    private $id;
    private $name;

    public function __construct() {
    }

    public function toArray() {
        return array("id" => $this->id, "name" => $this->name);
    }

    public function validate() {
        return true;
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
}

?>