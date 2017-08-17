<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/18
 * Time: 0:52
 */
class play{
    public function index(){
        include 'Core/db.php';
        $data=new Db();
       $stmt= $data->pdo->query('select * from games');
        $fn=$stmt->fetchAll();
        include 'Views/games.html';
    }
    public function truth(){
        include 'Core/db.php';
        $data=new Db();
        $stmt= $data->pdo->query('select * from game WHERE type=1 ORDER BY id DESC limit 9');
        $fn=$stmt->fetchAll();
        include 'Views/truth.html';
    }
    public function db(){
        include 'Core/db.php';
        $page=($_REQUEST['page']-1)*9;
        $data=new Db();
        $stmt= $data->pdo->query('select * from game WHERE type=1 ORDER BY id DESC limit 9 offset '.$page);
        $fn=$stmt->fetchAll();
        echo json_encode($fn);
    }
    public function zxh(){
        include 'Core/db.php';
        $data=new Db();
        $stmt= $data->pdo->query('select * from game WHERE type=1 ORDER BY id DESC limit 9');
        $fn=$stmt->fetchAll();
       echo json_encode($fn);
    }
    public function dmx(){
        include 'Core/db.php';
        $data=new Db();
        $stmt= $data->pdo->query('select * from game WHERE type=2 ORDER BY id DESC limit 9');
        $fn=$stmt->fetchAll();
        echo json_encode($fn);
    }
    public function dmxs(){
        include 'Core/db.php';
        $page=($_REQUEST['page']-1)*9;
        $data=new Db();
        $stmt= $data->pdo->query('select * from game WHERE type=2 ORDER BY id DESC limit 9 offset '.$page);
        $fn=$stmt->fetchAll();
        echo json_encode($fn);
    }
}