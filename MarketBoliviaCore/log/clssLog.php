<?php
class Log
{
    private $log;

    public function __construct()
    {
        $this->log = array();
    }

    public function addLog($line)
    {
        if ($this->log == null)
            $this->log = array();

        array_push($this->log, $line);
    }

    public function cleanLog()
    {
        $this->log = null;
        $this->log = array();
    }

    public function saveLog()
    {
        $this->saveLogToFile(date("Ymd") . ".log");
    }

    public function saveLogToFile($file)
    {
        $fp = fopen($file, "w");
        foreach ($this->log as $line)
            $write = fputs($fp, $line);
        fclose($fp);
    }

    public function getLog()
    {
        return $this->log;
    }

}
