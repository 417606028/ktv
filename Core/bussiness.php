<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/18
 * Time: 0:53
 */
class bussiness{
    public function index(){
        include 'Core/db.php';
        $data1=new Db();
        $stmt= $data1->pdo->query('select * from goods WHERE type=1');
        $stmt1= $data1->pdo->query('select * from goods WHERE type=2');
        $fn=$stmt->fetchAll();
        $fn1=$stmt1->fetchAll();
        include 'Views/shooping.html';
    }
    public function recived(){
        $arr=$_REQUEST['date'];
        $fn=json_decode($arr);
        echo "ok";

    }
    public function buy(){
        include 'Views/buy.html';
    }
    public function resback(){
        include 'Views/tjcg.html';
    }

}









//public function wine(){
//        include 'Core/db.php';
//        $data1=new Db();
//        $stmt= $data1->pdo->query('select * from store');
//        $fn=$stmt->fetchAll();
//        echo json_encode($fn);
//    }
//    public function food(){
//        include 'Core/db.php';
//        $data1=new Db();
//        $stmt= $data1->pdo->query('select * from foods ');
//        $fn=$stmt->fetchAll();
//        echo json_encode($fn);
//    }