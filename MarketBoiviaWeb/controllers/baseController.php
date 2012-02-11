<?php
class BaseController
{
    protected function __construct($type)
    {
        require_once("managers/" . $type . "Manager.php");
        require_once("models/" . $type . ".php");
    }

}

?>