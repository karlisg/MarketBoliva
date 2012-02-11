<?php
require_once("utils/SessionUtil.php");
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
        require_once("basic_views/layout.php");
        ?>
    <div id="content" style="display:none;">
        <?php
        try {
            $this->show();
            require_once("basic_views/debug.php");
        }
        catch (Exception $e) {
            require_once("basic_views/error.php");
        }

        ?>

    </div>

    <?php
    }

    public abstract function show();

    //$arrayRequest = explode("?", $_SERVER['REQUEST_URI']);
    //$className = ucfirst(basename($arrayRequest[0], ".php"));
    //$view = new $this->name();
}


?>