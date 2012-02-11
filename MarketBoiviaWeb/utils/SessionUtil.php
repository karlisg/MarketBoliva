<?php

class SessionUtil {

    public static function setLayoutBasics($title, $header, $footer) {
        $_SESSION['layout']['title'] = $title;
        $_SESSION['layout']['header'] = $header;
        $_SESSION['layout']['footer'] = $footer;
    }

    public static function setMenu($page) {
        $_SESSION['menu'] = $page;
    }

    public static function getTitle() {
        return $_SESSION['layout']['title'];
    }

    public static function getHeader() {
        return $_SESSION['layout']['header'];
    }

    public static function getFooter() {
        return $_SESSION['layout']['footer'];
    }
    
    public static function getMenu(){
        return $_SESSION['menu'];
    }

}

?>
