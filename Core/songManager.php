<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/27
 * Time: 8:43
 */
class songManager{
    public function __construct()
    {
        checkLogin();
    }

    public function index()
    {
        $title = "歌曲管理";
        include 'Views/songManager.html';
    }
    public function add_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $name=$_REQUEST['name'];
        $time=$_REQUEST['time'];
        $type=$_REQUEST['aid'];
        $tmp=$_FILES['file']['tmp_name'];
        $dist='Public/music/'.$_FILES['file']['name'];
        move_uploaded_file($tmp,$dist);
        $src='/'.$dist;
        $stmt=$db->pdo->prepare('insert into song (name,aid,src,duration) values (?,?,?,?) ');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$type);
        $stmt->bindValue(3,$src);
        $stmt->bindValue(4,$time);
        $stmt->execute();
        $data=$db->pdo->lastInsertId();
        echo $data;
    }
    function delete_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $src=$_REQUEST['src'];
        $filename=explode('/',$src)[1].'/'.explode('/',$src)[2].'/'.explode('/',$src)[3];
        $stmt=$db->pdo->prepare('delete from song WHERE id= ?');
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
        $stmt=$db->pdo->prepare("update song set {$name}=? WHERE id= ?");
        $stmt->bindValue(1,$value);
        $stmt->bindValue(2,$id);
        $stmt->execute();
        echo $stmt->rowCount();
    }
    function adinfo(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $stmt=$db->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id ORDER BY id DESC');
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }
    public function search(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $data=$_REQUEST['keyword'];
        $stmt=$db->pdo->query("select * from singerinfos WHERE name LIKE '%{$data}%';");
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }
}