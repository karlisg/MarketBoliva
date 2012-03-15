<?php
require_once('log/clssLog.php');
class LogUtil
{
    private $log;
    private static $obj;

    private function __construct()
    {
        $this->log = new Log();
    }

    public static function getInstance(){
        if(LogUtil::$obj == null){
            LogUtil::$obj = new LogUtil();
        }
        return LogUtil::$obj;
    }

    public function debug($line)
    {
        $this->log->addLog($line);
    }

    public function cleanLog()
    {
        $this->log->cleanLog();
    }

    public function saveLog()
    {
        $this->log->saveLog();
    }

    public function saveLogToFile($file)
    {
        $this->log->saveLogToFile($file);
    }

    public function getLog()
    {
        return $this->log->getLog();
    }
}

