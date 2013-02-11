<?php
require_once("utils/SessionUtil.php");
require_once("utils/LogUtil.php");
abstract class BaseView
{
    private $name;

    public function __construct()
    {
        SessionUtil::setLayoutBasics("Market Bolivia", "Market Bolivia", "");
        $this->name = get_class($this);
        $this->init();
    }

    public function init()
    {
        require_once("db/clssQuery.php");
        require_once("basic_views/layout.php");
        ?>


        <?php
        try {
            $this->show();
            require_once("basic_views/debug.php");
            require_once("basic_views/debugdb.php");
        }
        catch (Exception $e) {
            require_once("basic_views/error.php");
        }
        ?>

    <?php
    }

    public abstract function show();
}

?>