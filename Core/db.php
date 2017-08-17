<?php
/**
 * Created by PhpStorm.
 * User: MACHENIKE
 * Date: 2017/6/16
 * Time: 11:14
 */
class Db{
   public $pdo;
    public $options=array(
    //默认是PDO::ERRMODE_SILENT, 0, (忽略错误模式)
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    // 默认是PDO::FETCH_BOTH, 4
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
);
    public function __construct()
    {
        $this->pdo=$pdo=new PDO('mysql:host=sqld.duapp.com;dbname=cJaeEQvedEJmRcmiJbHA;port=4050;charset=utf8','fb79d50d824a4219825b795c36495e21','b174659f9b264268b20a38b36f1691dd');

    }
}
