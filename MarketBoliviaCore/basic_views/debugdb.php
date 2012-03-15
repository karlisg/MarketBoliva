<div class="div-cmd">
    <h3 class="title-debug">DB Debug</h3>
    <?php
    foreach (Query::$log->getLog() as $key => $query) {
        printf("Query #%d) %s<br/>", $key + 1, $query);
    }
    ?>
</div>