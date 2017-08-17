<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/16
 * Time: 11:08
 */
class Core{
    public static function run(){
        if(!isset($_SERVER['PATH_INFO'])||$_SERVER['PATH_INFO']=='/'||$_SERVER['PATH_INFO']==''){
            $class_name='home';
            $fn='index';
        }else{
            $path_info=explode('/',substr($_SERVER['PATH_INFO'],1));
            $class_name=$path_info[0];
            $fn=isset($path_info[1])&&$path_info[1]?$path_info[1]:'index';
        }
        if(file_exists("Core/{$class_name}.php")){
            include "Core/{$class_name}.php";
            if(class_exists($class_name)){
                $pages= new $class_name();
                if(method_exists($class_name,$fn)){
                    $pages->$fn();
                }else{
                    include 'Views/404.html';
                }
            }else{
                include 'Views/404.html';
            }
        }else{
            include 'Views/404.html';
        }
    }

}