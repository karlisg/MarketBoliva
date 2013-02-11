<?php
require_once("BaseObject.php");
class Category extends BaseObject {

    private $id;
    private $code;
    private $name;
    private $parentId;

    public function __construct() {
    }

    public function toArray() {

        array("id" => $this->id, "code" => $this->code, "name" => $this->name, "parentId" => $this->parentId);
    }

    public function validate() {
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

    public function setParentId($parentId)
    {
        $this->parentId = $parentId;
    }

    public function getParentId()
    {
        return $this->parentId;
    }


}

?>