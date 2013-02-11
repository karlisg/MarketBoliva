<?php
require_once("utils/SessionUtil.php");
require_once("utils/LogUtil.php");
require_once("db/clssQuery.php");
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
            require_once("basic_views/debugdb.php");
        }
        catch (Exception $e) {
            require_once("basic_views/error.php");
        }
        ?>
    </div>

    <?php
    }

    public abstract function show();
}
?>