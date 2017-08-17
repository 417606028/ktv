<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/30
 * Time: 11:19
 */
function checkLogin(){
    if(!isset($_COOKIE['login'])){
        header('Location:/index.php/login/');
    }
}