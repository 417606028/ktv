<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/30
 * Time: 11:21
 */
class login{
    public function index(){
        if(isset($_COOKIE['login'])){
                header('/index.php/storeManager');
        }else{
            include 'Views/login.html';
        }
    }
    public function check(){
        include 'Core/db.php';
        $db=new Db();
        $user=$_REQUEST['username'];
        $password=$_REQUEST['password'];
        $stmt=$db->pdo->prepare('select * from userManager WHERE user=?');
        $stmt->bindValue(1,$user);
        $stmt->execute();
        $data=$stmt->fetchAll();
        if(isset($data)){
            foreach ($data as $v){
               if(($v['user']==$user) && ($v['password']==md5($password))){
                    setcookie('login','true',time()+60*60*24*7,'/');
                    echo 'ok';
                    return;
               }

                echo 'error';
            }
        }
            echo 'error';
    }
    public function logout(){
        unset($_COOKIE['login']);
        setcookie('login',null,-1,'/');
        header('Location:/index.php/login/');
    }
}