<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/24
 * Time: 16:15
 */
class singerClassManager{
    public function __construct()
    {
        checkLogin();
    }

    function index(){
        $title='分类管理';
        include 'Views/singerlistManager.html';
    }
    function add_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $name=$_REQUEST['name'];
        $type=$_REQUEST['type'];
        $src=$_FILES['file']['tmp_name'];
        $dist='Public/music/'.$_FILES['file']['name'];
        move_uploaded_file($src,$dist);
        $pic='/'.$dist;
        $url=$_REQUEST['url'];
        $stmt=$db->pdo->prepare('insert into singerlist (name,class,pic,url,name2) values (?,?,?,?,?) ');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$type);
        $stmt->bindValue(3,$pic);
        $stmt->bindValue(4,$url);
        $stmt->bindValue(5,"无");
        $stmt->execute();
        $data=$db->pdo->lastInsertId();
        echo $data;
    }
    function delete_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $pic=$_REQUEST['pic'];
        $filename=explode('/',$pic)[1].'/'.explode('/',$pic)[2].'/'.explode('/',$pic)[3];
        unlink($filename);
        $stmt=$db->pdo->prepare('delete from singerlist WHERE id= ?');
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
        $stmt=$db->pdo->prepare("update singerlist set {$name}=? WHERE id= ?");
        $stmt->bindValue(1,$value);
        $stmt->bindValue(2,$id);
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
        $stmt=$db->pdo->query('select * from singerlist ORDER BY id DESC');
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }
    function logout(){
        unset($_COOKIE['login']);
        setcookie('login',null,-1,'/');
    }
}