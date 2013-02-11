<div class="div-cmd">
    <h3 class="title-error">Error</h3>

    <?php
    printf("(%s) %s <br/>", $e->getCode(), $e->getMessage());

    foreach ($e->getTrace() as $lineTrace) {
        printf("&nbsp;&nbsp;&nbsp;&nbsp; %s (%s) %s%s%s(%s)<br/>", $lineTrace['file'], $lineTrace['line'], $lineTrace['class'], $lineTrace['type'], $lineTrace['function'], implode(",", $lineTrace['args']));
    }
    ?>
</div>