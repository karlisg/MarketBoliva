<?php

class BaseObject
{
    private $status;
    private $creationDate;
    private $modificationDate;
    private $lastModUser;

    public function __construct()
    {
    }

    public function toArray()
    {
        return array("status" => $this->status, "creationDate" => $this->creationDate, "modificationDate" => $this->modificationDate, "lastModUser" => $this->lastModUser);
    }

    public function setStatus($status)
    {
        $this->status = $status;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function setCreationDate($creationDate)
    {
        $this->creationDate = $creationDate;
    }

    public function getCreationDate()
    {
        return $this->creationDate;
    }

    public function setModificationDate($modificationDate)
    {
        $this->modificationDate = $modificationDate;
    }

    public function getModificationDate()
    {
        return $this->modificationDate;
    }

    public function setLastModUser($lastModUser)
    {
        $this->lastModUser = $lastModUser;
    }

    public function getLastModUser()
    {
        return $this->lastModUser;
    }

}

?>