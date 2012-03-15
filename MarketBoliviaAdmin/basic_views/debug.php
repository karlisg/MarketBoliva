<div class="div-cmd">
    <h3 class="title-debug">Code Debug</h3>
    <?php
    foreach (LogUtil::getInstance()->getLog() as $key => $query) {
        printf("Log #%d) %s<br/>", $key + 1, $query);
    }
    ?>
</div>