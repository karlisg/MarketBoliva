<?php
require_once("../db/clssQuery.php");
class BaseManager
{
    public static function convertObjectsToArray($class, $objects)
    {
        $res = array();

        require_once("../models/" . $class . ".php");
        $reflector = new ReflectionClass($class);
        $properties = $reflector->getProperties();

        $attributes = array();
        foreach ($properties as $property) {
            array_push($attributes, $property->getName());
        }

        foreach ($objects as $object) {
            $obj = new $class();
            foreach ($attributes as $attribute) {
                if ($attribute == "id")
                    $obj->{"set" . ucfirst($attribute)}($object[$attribute . $class]);
                else
                    $obj->{"set" . ucfirst($attribute)}($object[$attribute]);
            }
            array_push($res, $obj->toArray());
        }
        return $res;
    }


}
