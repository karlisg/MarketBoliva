<?php

require_once('cnstDB.php');

class Connection {

    private $link;
    private $dbmanager;
    private static $instance = FALSE;

    private function __construct($dbmanager, $host, $port, $dbname, $user, $password) {

        $this->dbmanager = $dbmanager;

        switch (strtolower($dbmanager)) {
            case 'postgresql': case 'postgres':
                $this->link = $this->connectPostgresql($host, $port, $dbname, $user, $password);
                break;
            case 'mysql':
                $this->link = $this->connectMysql($host, $port, $dbname, $user, $password);
                break;
            default : assert(FALSE);
        }
    }

    private function connectPostgresql($host, $port, $dbname, $user, $password) {
        return pg_connect(
                        "host=" . $host .
                        " port=" . $port .
                        " dbname=" . $dbname .
                        " user=" . $user .
                        " password=" . $password) or die("cannot connect");
    }

    private function connectMysql($host, $port, $dbname, $user, $password) {
        $link = mysql_connect("$host", "$user", "$password") or die("cannot connect");
        mysql_select_db("$dbname") or die("cannot select DB");
        return $link;
    }

    public static function getInstance() {
        if (!self::$instance)
            self::$instance = new Connection(DBMANAGER, HOST, PORT, DBNAME, USRNAME, PASS);
        return self::$instance;
    }

    public function getLink() {
        return $this->link;
    }

    public function getDbManager() {
        return $this->dbmanager;
    }

}

?>
