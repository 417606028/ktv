<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/21
 * Time: 16:54
 */
class storeManager{
    public function __construct()
    {
        checkLogin();
    }

    function index(){
        $title='商店管理';
        include 'Views/stroreManager.html';
    }
    function add_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $name=$_REQUEST['name'];
        $src = $_FILES['file']['tmp_name'];
        $dist = 'Public/img/'. $_FILES['file']['name'];
        move_uploaded_file($src, $dist);
        $pic='/'.$dist;
        $price=$_REQUEST['price'];
        $hot=$_REQUEST['hot'];
        $type=$_REQUEST['type'];
        $stmt=$db->pdo->prepare('insert into goods (name,price,hot,pic,type) values (?,?,?,?,?) ');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$price);
        $stmt->bindValue(3,$hot);
        $stmt->bindValue(4,$pic);
        $stmt->bindValue(5,$type);
        $stmt->execute();
        $data=$db->pdo->lastInsertId();
        echo $data;
    }
    function delete_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $src=$_REQUEST['pic'];
        $filename=explode('/',$src)[1].'/'.explode('/',$src)[2].'/'.explode('/',$src)[3];
        $stmt=$db->pdo->prepare('delete from goods WHERE id= ?');
        $stmt->bindValue(1,$id);
        $stmt->execute();
        unlink($filename);
        echo 'ok';
    }
    function update(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $name=$_REQUEST['name'];
        $value=$_REQUEST['value'];
        $stmt=$db->pdo->prepare("update goods set {$name}=? WHERE id= ?");
        $stmt->bindValue(1,$value);
        $stmt->bindValue(2,$id);
        $stmt->execute();
        echo $stmt->rowCount();
    }
    function adinfo(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $stmt=$db->pdo->query('select * from goods ORDER BY id DESC');
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }
}

// git config http.postBuffer 524288000
//大小写问题
//页面传完善
//所有视图 完成修改