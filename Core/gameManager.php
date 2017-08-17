<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/21
 * Time: 16:54
 */
class gameManager{
    public function __construct()
    {
        checkLogin();
    }

    function index(){
        $title='游戏管理';
        include 'Views/gameManager.html';
    }
    function add_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $name=$_REQUEST['name'];
        $type=$_REQUEST['type'];
        $stmt=$db->pdo->prepare('insert into game (content,type) values (?,?) ');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$type);
        $stmt->execute();
        $data=$db->pdo->lastInsertId();
        echo $data;
    }
    function delete_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $stmt=$db->pdo->prepare('delete from game WHERE id= ?');
        $stmt->bindValue(1,$id);
        $stmt->execute();
        if($stmt->rowCount()){
            echo 'ok';
        }else{
            echo 'error';
        }
    }
    function update(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $name=$_REQUEST['name'];
        $value=$_REQUEST['value'];
        $stmt=$db->pdo->prepare("update game set {$name}=? WHERE id= ?");
        $stmt->bindValue(1,$value);
        $stmt->bindValue(2,$id);
        $stmt->execute();
        if($stmt->rowCount()){
            echo 'ok';
        }else{
            echo 'error';
        }
    }
    function update_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $name=$_REQUEST['name'];
        $type=$_REQUEST['type'];
        $stmt=$db->pdo->prepare('update game set content = ?,type= ? where id = ?');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$type);
        $stmt->bindValue(3,$id);
        $stmt->execute();
        if($stmt->rowCount()){
            echo 'ok';
        }else{
            echo 'error';
        }
    }
    function adinfo(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $stmt=$db->pdo->query('select * from game ORDER BY id DESC');
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }
    function logout(){
        unset($_COOKIE['login']);
        setcookie('login',null,-1,'/');
    }
}