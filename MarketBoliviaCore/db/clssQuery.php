<?php

require_once('clssConnection.php');
Connection::getInstance();

class Query
{

    private $query;
    private $result;
    public static $log;

    public function __construct($query)
    {
        $this->query = $query;
    }

    public function getQuery()
    {
        return $this->query;
    }

    private function addLog()
    {
        if (Query::$log == null)
            Query::$log = array();

        array_push(Query::$log, $this->query);
    }

    public function run()
    {
        $this->result = pg_query($this->query) or die("Query:" . $this->query . " failed by " . pg_error());
        $this->addLog();
        return $this->result;
    }

    public function getAll()
    {
        $res = pg_fetch_all($this->result);

        if ($res == null)
            $res = array();

        return $res;
    }

    public function getRow()
    {
        return pg_fetch_array($this->result);
    }

    public function select0($fields, $table)
    {
        return $this->select1($fields, $table, "");
    }

    public function select1($fields, $table, $where)
    {
        return $this->select2($fields, $table, $where, "");
    }

    public function select2($fields, $table, $where, $orderBy)
    {
        $res = "SELECT " . $fields . " FROM " . $table;

        if ($where != "")
            $res .= " WHERE " . $where;

        if ($orderBy != "")
            $res .= " ORDER BY " . $orderBy;

        $res .= " ;";

        $this->query = $res;
    }

    private function getFormatFields($fields)
    {
        $res = "";
        foreach ($fields as $field)
            $res .= '\"' . $field . '\"' . ", ";

        $res = substr($res, 0, strlen($res) - 2) . ")";

        return $res;
    }

    private function getFormatValues($values, $isString)
    {
        $i = 0;
        $res = "";
        foreach ($values as $value) {

            if ($value == "" && !$isString)
                $res .= "null, ";
            else if ($isString[$i] == true)
                $res .= "'" . $value . "', ";
            else
                $res .= "" . $value . ", ";
            $i++;
        }
        $res = substr($res, 0, strlen($res) - 2);

        return $res;
    }

    public function insert($table, $fields, $values, $isString)
    {
        $res = "INSERT INTO " . $table . " (";
        $res .= $this->getFormatFields($fields);
        $res .= " VALUES (";
        $res .= $this->getFormatValues($values, $isString);
        $res .= ");";
        $this->query = $res;
    }

    public function update($tabla, $atributos, $valores, $escadena, $condiciones)
    {
        $res = "UPDATE " . $tabla . " SET ";

        $i = 0;
        foreach ($valores as $valor) {
            $res .= $atributos[$i] . "=";

            if ($valor == "")
                $res .= "null, ";
            else if ($escadena[$i] == true)
                $res .= "'" . $valor . "', ";
            else
                $res .= "" . $valor . ", ";

            $i++;
        }

        $res = substr($res, 0, strlen($res) - 2) . " WHERE " . $condiciones;


        $this->query = $res;
    }

    public function delete($tabla, $condiciones)
    {
        $res = "DELETE FROM " . $tabla;

        if ($condiciones != "")
            $res .= " WHERE " . $condiciones . ";
                    ";
        else
            $res .= ";
                    ";

        $this->query = $res;
    }

    public static function cleanLog()
    {
        Query::$log = null;
        Query::$log = array();
    }

    public static function saveLog()
    {
        Query::saveLogToFile(date("Ymd") . ".sql");
    }

    public static function saveLogToFile($file)
    {
        $fp = fopen($file,"w");
        foreach (Query::$log as $line)
            $write = fputs($fp, $line);

        fclose($fp);
    }

}

?>
