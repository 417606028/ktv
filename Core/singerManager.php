<?php
class singerManager{
    public function __construct(){
        checkLogin();
    }
    function index(){
        $title='歌手管理';
        include 'Core/db.php';
        $db=new Db();
        $stmt=$db->pdo->query('select * from singerlist ORDER BY id DESC');
        $data=$stmt->fetchAll();
        include 'Views/singerManager.html';
    }
    function add_admins(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        dump($_REQUEST);
        $name=$_REQUEST['name'];
        $pictmp=$_FILES['pic']['tmp_name'];
        $pic='/'.$pictmp;
        $distp='Public/music/'.$_FILES['pic']['name'];
        $disp='/'.$distp;
        move_uploaded_file($pictmp,$distp);
        $bactmp=$_FILES['bac']['tmp_name'];
        $bac='/'.$bactmp;
        $distb='Public/music/'.$_FILES['bac']['name'];
        $disb='/'.$distb;
        move_uploaded_file($bactmp,$distb);
        $count=$_REQUEST['count'];
        $type=$_REQUEST['type'];
        $stmt=$db->pdo->prepare('insert into singerinfos (name,cid,bac,pic,count) values (?,?,?,?,?) ');
        $stmt->bindValue(1,$name);
        $stmt->bindValue(2,$type);
        $stmt->bindValue(3,$disb);
        $stmt->bindValue(4,$disp);
        $stmt->bindValue(5,$count);
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
        $filepic=explode('/',$pic)[1].'/'.explode('/',$pic)[2].'/'.explode('/',$pic)[3];
        unlink($filepic);
        $bac=$_REQUEST['bac'];
        $filebac=explode('/',$bac)[1].'/'.explode('/',$bac)[2].'/'.explode('/',$bac)[3];
        unlink($filebac);
        $stmt=$db->pdo->prepare('delete from singerinfos WHERE id= ?');
        $stmt->bindValue(1,$id);
        $stmt->execute();
        echo 'ok';
    }
    function update(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $id=$_REQUEST['id'];
        $name=$_REQUEST['name'];
        $value=$_REQUEST['value'];
        $stmt=$db->pdo->prepare("update singerinfos set {$name}=? WHERE id= ?");
        $stmt->bindValue(1,$value);
        $stmt->bindValue(2,$id);
        $stmt->execute();
        echo $stmt->rowCount();
    }
    function adinfo(){
        sleep(2);
        include 'Core/db.php';
        $db=new Db();
        $stmt=$db->pdo->query('SELECT a.*,c.name as class_name
                               FROM singerinfos as a,singerlist as c
                               WHERE a.cid=c.id ORDER BY id DESC');
        $data=$stmt->fetchAll();
        echo json_encode($data);
    }

}