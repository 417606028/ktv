<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/18
 * Time: 0:52
 */
class sing{
    public function index (){
        include 'Core/db.php';
        $data1=new Db();
        $l=1;
        $m=2;
        $s=3;
        $stmt= $data1->pdo->query('select * from singerlist WHERE class='.$l);
        $stmt1= $data1->pdo->query('select * from singerlist WHERE class='.$m);
        $stmt2= $data1->pdo->query('select * from singerlist WHERE class='.$s);
        $fn=$stmt->fetchAll();
        $fn1=$stmt1->fetchAll();
        $fn2=$stmt2->fetchAll();
        include 'Views/songs.html';
    }
    public function singer (){
        include 'Core/db.php';
        $data1=new Db();
        $id=$_REQUEST['id'];
        $name=$_REQUEST['name'];
        $stmt= $data1->pdo->query("select * from singerinfos WHERE cid='{$id}' ");
        $fn=$stmt->fetchAll();
        include 'Views/singer1.html';
    }
    public function singerinfo(){
        $id=$_REQUEST['id'];
        include 'Core/db.php';
        $data1=new Db();
        $data=new Db();
        $data2=new Db();
        $id=$_REQUEST['id'];
        $stmt= $data1->pdo->query('SELECT a.*,c.name as class_name
FROM singerinfos as a,singerlist as c
WHERE a.cid=c.id AND  a.id='.$id);
        $fn=$stmt->fetchAll();
        $stmt1= $data->pdo->query('SELECT * FROM singerinfos WHERE id='.$id );
        $s=$stmt1->fetch();
        $stmt2= $data2->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id AND i.id='.$id);
        $fn1=$stmt2->fetchAll();
        include 'Views/singer2.html';
    }
    public function rank(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 9');
        $fn1=$stmt->fetchAll();
        include 'Views/singer8.html';
    }
    public function months(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 5');
        $fn1=$stmt->fetchAll();
        echo json_encode($fn1);
    }
    public function seation(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 6');
        $fn1=$stmt->fetchAll();
        echo json_encode($fn1);
    }
    public function year(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        echo json_encode($fn1);
    }

    public function rec(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('select * from rec');
        $fn=$stmt->fetchAll();
        include 'Views/singer9.html';
    }
    public function recinfo1(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        $class='摔跤吧 爸爸';
        include 'Views/singer10.html';
    }
    public function recinfo2(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        $class='青春励志歌曲';
        include 'Views/singer10.html';
    }
    public function recinfo3(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        $class='一人一首成名曲';
        include 'Views/singer10.html';
    }
    public function recinfo4(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        $class='菠萝菠萝蜜';
        include 'Views/singer10.html';
    }
    public function fav(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id limit 8');
        $fn1=$stmt->fetchAll();
        $class='常唱';
        include 'Views/singer10.html';
    }
    public function select(){
        include 'Views/singer6.html';
    }
    public function show(){
        $id=$_REQUEST['id'];
        include 'Core/db.php';
        $data=new Db();
        $stmt= $data->pdo->query('SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id AND s.id='.$id);
        $data=$stmt->fetch();
        include 'Views/singer7.html';
    }
}


