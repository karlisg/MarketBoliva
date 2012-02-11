<?php require_once("db/clssQuery.php"); ?>
<div style="background-color: #000; color: #FFF; font-weight: normal; font-family: 'Courier New'; font-size: 12px; padding: 10px; text-shadow: none;">    
    <h3 class="title-debug">Debug</h3>
    <?php
    foreach (Query::$log as $key => $query) {
        echo "Query #" . ($key + 1) . ")" . $query . "<br/>";
    }
    ?>
</pre>
</div>