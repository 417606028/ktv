--userSheet
DROP TABLE IF EXISTS userManager;
CREATE TABLE userManager(
id int (12) PRIMARY KEY AUTO_INCREMENT,
user VARCHAR (255),
password VARCHAR (255)
)DEFAULT CHARSET=utf8;
INSERT INTO userManager(user,password)VALUES
('admin','123456'),
('admin','456754'),
('super','lovewxj');


--GoodsSheet
DROP TABLE IF EXISTS goods;
CREATE TABLE goods (
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  name  varchar(255),
  price varchar(255),
  hot int(12) NOT NULL,
  pic varchar(255) NOT NULL,
  type int(12) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO goods (name, price, hot, pic, type) VALUES
( 'HELMSAN啤酒', '8.6', 3, '/Public/img/34.png', 1),
('HELMSAN啤酒', '8.6', 6, '/Public/img/34.png', 1),
('HELMSAN啤酒', '8.6', 3, '/Public/img/34.png', 1),
('HELMSAN啤酒', '8.6', 6, '/Public/img/34.png', 1),
('cocacola', '8.6', 3, '/Public/img/34.png', 1),
('VIO', '9', 4, '/Public/img/34.png', 1),
('cocacola', '8.6', 3, '/Public/img/34.png', 1),
('VIO', '9', 4, '/Public/img/34.png', 1),
('CHIL', '3.6', 3, '/Public/img/34.png', 2),
('MUIc', '3.6', 6, '/Public/img/34.png', 2),
('ARMANI', '3.6', 3, '/Public/img/34.png', 2),
('POSCAR', '3.6', 6, '/Public/img/34.png', 2),
('cocacola', '3.6', 3, '/Public/img/34.png', 2),
('VIO', '3.6', 4, '/Public/img/34.png', 2),
('cocacola', '3.5', 3, '/Public/img/34.png', 2),
('VIO', '99', 4, '/Public/img/34.png', 2);

--GameSheet
DROP TABLE IF EXISTS game;
CREATE TABLE game (
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  name  varchar(255),
  type int(12) NOT NULL
)DEFAULT CHARSET=utf8;
INSERT INTO game (name,type) VALUES
('对你身边最近的人说我爱你。', 2),
('出门左转，对遇到的第三位女性说我爱你', 2),
('含着一口水说绕口令', 2),
('拿起手机自拍并做怪异姿势上传社交网络', 2),
('对房间内单身的人说我爱你', 2),
('一口气喝完一瓶啤酒', 2),
('到Ktv的超市买酒，并对收银员说我是同性恋', 2),
('将一桶爆米花在三分钟内吃完', 2),
('一口气喝三瓶啤酒', 2),
( '将桌子上的已开盖啤酒清空', 2),
( '亲吻你的脚踝', 2),
( '嚼着冰块喝啤酒，并大声说 我是XXX', 2),
('你今天穿了什么颜色的胖次', 1),
('你第一次夜不归宿是几岁，和谁', 1),
('第一次说脏话是几岁', 1),
('第一次自己出远门是几岁', 1),
('第一次赚钱是几岁', 1),
('赚到最大的钱是多少', 1),
('你的初吻是几岁', 1),
('你最喜欢的歌手是谁？', 1),
('你第一次去网吧是几岁', 1),
('你第一次喝酒是和谁', 1),
('你的胸围是多少', 1),
('你的初恋是谁', 1);


--singerSheet
DROP TABLE IF EXISTS singerinfos;
CREATE TABLE singerinfos (
  id int (12) PRIMARY KEY AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  cid int(12) NOT NULL,
  urL varchar(255) NOT NULL,
  pic varchar(255) NOT NULL,
  count int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singerinfo`
--

INSERT INTO singerinfos (name, cid, url, pic, count) VALUES
('蔡妍', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 382),
('林夕', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 385),
('王菲', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 599),
('那英', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 557),
('孙燕姿', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 666),
('莫文蔚', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 542),
('张惠妹', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 254),
('叮当', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 654),
('蔡卓妍', 1, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 999),
('蔡妍', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 368),
('林夕', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 368),
('王菲', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('那英', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('孙燕姿', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('莫文蔚', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('张惠妹', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 268),
('叮当', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('蔡卓妍', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 968),
('王菲', 2, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('那英', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('孙燕姿', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('莫文蔚', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('张惠妹', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 268),
('叮当', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('蔡卓妍', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 968),
('那英', 3, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('孙燕姿', 4, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('莫文蔚', 4, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('张惠妹', 4, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 268),
('叮当', 4, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('蔡卓妍',4, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 968),
('孙燕姿', 5, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('莫文蔚', 5, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('张惠妹', 5, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 268),
('叮当', 5, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('蔡卓妍',5, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 968),
('孙燕姿', 6, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('莫文蔚', 6, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 568),
('张惠妹', 6, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 268),
('叮当', 6, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 668),
('蔡卓妍',6, '/index.php/sing/singerinfo', '/Public/img/singer-nvneidi_03.png', 968);

--歌曲表
DROP TABLE IF EXISTS song;
CREATE TABLE song (
  `id` int(12) PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `aid` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `song`
--

INSERT INTO `song` (`name`, `src`, `duration`, `aid`) VALUES
('斑马，斑马', '/Public/music/1.mp3', '3:55', 1),
('画', '/Public/music/2.mp3', '3:55', 2),
('成都', '/Public/music/3.mp3', '3:55', 3),
('贝加尔湖畔', '/Public/music/4.mp3', '3:55', 4),
('暧昧', '/Public/music/5.mp3', '3:55', 5),
('吻别', '/Public/music/6.mp3', '3:55', 6),
('告白气球', '/Public/music/7.mp3', '3:55', 7),
('父亲写的散文诗', '/Public/music/8.mp3', '3:55', 8),
('绅士', '/Public/music/9.mp3', '3:55', 9),
('南方姑娘', '/Public/music/10.mp3', '3:55', 10);

--视图2
DROP VIEW IF EXISTS song_view;
CREATE VIEW song_view AS
SELECT s.* ,i.name as singer_name ,i.pic as singer_pic
FROM song as s,singerinfos as i
WHERE s.aid=i.id;



--视图1
DROP VIEW  IF EXISTS as_view;
CREATE VIEW as_view AS
SELECT a.*,c.name as class_name
FROM singerinfos as a,singerlist as c
WHERE a.cid=c.id;
