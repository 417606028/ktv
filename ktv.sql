-- phpMyAdmin SQL Dump
-- http://www.phpmyadmin.net
--
-- 生成日期: 2017 年 08 月 10 日 08:36

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `cJaeEQvedEJmRcmiJbHA`
--

-- --------------------------------------------------------

--
-- 表的结构 `foods`
--

CREATE TABLE IF NOT EXISTS `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `hot` int(12) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `foods`
--

INSERT INTO `foods` (`id`, `name`, `price`, `hot`, `pic`, `type`) VALUES
(1, 'CHIL', '3.6', 3, '/Public/img/1.png', 2),
(2, 'MUIc', '3.6', 6, '/Public/img/2.png', 2),
(3, 'ARMANI', '3.6', 3, '/Public/img/3.png', 2),
(4, 'POSCAR', '3.6', 6, '/Public/img/34.png', 2),
(5, 'cocacola', '3.6', 3, '/Public/img/05.png', 2),
(6, 'VIO', '3.6', 4, '/Public/img/40.png', 2),
(7, 'cocacola', '3.5', 3, '/Public/img/1.png', 2),
(8, 'VIO', '99', 4, '/Public/img/2.png', 2);

-- --------------------------------------------------------

--
-- 表的结构 `game`
--

CREATE TABLE IF NOT EXISTS `game` (
  `id` int(12) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `game`
--

INSERT INTO `game` (`id`, `content`, `type`) VALUES
(1, '对你身边最近的人说我爱你。', 2),
(2, '出门左转，对遇到的第三位女性说我爱你', 2),
(3, '含着一口水说绕口令', 2),
(4, '拿起手机自拍并做怪异姿势上传社交网络', 2),
(5, '对房间内单身的人说我爱你', 2),
(6, '一口气喝完一瓶啤酒', 2),
(7, '到Ktv的超市买酒，并对收银员说我是同性恋', 2),
(8, '将一桶爆米花在三分钟内吃完', 2),
(9, '一口气喝三瓶啤酒', 2),
(10, '将桌子上的已开盖啤酒清空', 2),
(11, '亲吻你的脚踝', 2),
(12, '嚼着冰块喝啤酒，并大声说 我是XXX', 2),
(13, '你今天穿了什么颜色的胖次', 1),
(14, '你第一次夜不归宿是几岁，和谁', 1),
(15, '第一次说脏话是几岁', 1),
(16, '第一次自己出远门是几岁', 1),
(17, '第一次赚钱是几岁', 1),
(18, '赚到最大的钱是多少', 1),
(19, '你的初吻是几岁', 1),
(20, '你最喜欢的歌手是谁？', 1),
(21, '你第一次去网吧是几岁', 1),
(22, '你第一次喝酒是和谁', 1),
(23, '你的胸围是多少', 1),
(24, '你的初恋是谁', 1);

-- --------------------------------------------------------

--
-- 表的结构 `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `imgs` text NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `games`
--

INSERT INTO `games` (`id`, `name`, `imgs`, `url`) VALUES
(1, '真心话大冒险', '/Public/img/games_03.png', '/index.php/play/truth'),
(2, '真心话大冒险', '/Public/img/games_05.png', '/index.php/play/truth'),
(3, '真心话大冒险', '/Public/img/games_09.png', '/index.php/play/truth'),
(4, '真心话大冒险', '/Public/img/games_10.png', '/index.php/play/truth'),
(5, '真心话大冒险', '/Public/img/games_05.png', '/index.php/play/truth'),
(6, '真心话大冒险', '/Public/img/games_05.png', '/index.php/play/truth');

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `id` int(12) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `hot` int(12) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`id`, `name`, `price`, `hot`, `pic`, `type`) VALUES
(1, 'HELMSAN啤酒', '8.6', 3, '/Public/img/1.png', 1),
(2, 'HELMSAN啤酒', '8.6', 3, '/Public/img/2.png', 1),
(3, 'HELMSAN啤酒', '8.6', 3, '/Public/img/3.png', 1),
(4, 'HELMSAN啤酒', '8.6', 3, '/Public/img/34.png', 1),
(5, 'cocacola', '8.6', 3, '/Public/img/40.png', 1),
(6, 'VIO', '9', 4, '/Public/img/1.png', 1),
(7, 'cocacola', '8.6', 3, '/Public/img/2.png', 1),
(8, 'VIO', '9', 4, '/Public/img/3.png', 1),
(9, 'CHIL', '3.6', 3, '/Public/img/34.png', 2),
(10, 'MUIc', '3.6', 3, '/Public/img/1.png', 2),
(11, 'ARMANI', '3.6', 3, '/Public/img/34.png', 2),
(12, 'POSCAR', '3.6', 3, '/Public/img/2.png', 2),
(13, 'cocacola', '3.6', 3, '/Public/img/1.png', 2),
(14, 'VIO', '3.6', 4, '/Public/img/3.png', 2),
(15, 'cocacola', '3.5', 3, '/Public/img/34.png', 2),
(16, 'VIO', '99', 4, '/Public/img/1.png', 2);

-- --------------------------------------------------------

--
-- 表的结构 `rec`
--

CREATE TABLE IF NOT EXISTS `rec` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `men` varchar(255) NOT NULL,
  `count` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rec`
--

INSERT INTO `rec` (`id`, `name`, `men`, `count`, `pic`, `url`) VALUES
(1, '摔跤吧，爸爸', '27', '86', '/Public/img/r_03.png', '/index.php/sing/recinfo1'),
(2, '青春励志歌曲', '27', '86', '/Public/img/r_07.png', '/index.php/sing/recinfo2'),
(3, '一人一首成名曲', '27', '86', '/Public/img/r_11.png', '/index.php/sing/recinfo3'),
(4, '菠萝菠萝蜜', '27', '86', '/Public/img/r22.png', '/index.php/sing/recinfo4');

-- --------------------------------------------------------

--
-- 表的结构 `rec1`
--

CREATE TABLE IF NOT EXISTS `rec1` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rec1`
--

INSERT INTO `rec1` (`id`, `name`, `time`, `pic`) VALUES
(1, '小丑', '04"52''', '/Public/img/singer-1.png'),
(2, '天净沙', '03"56''', '/Public/img/singer-2.png'),
(3, '爱无罪', '04"55''', '/Public/img/singer-3.png'),
(4, '十年', '04"55"', '/Public/img/singer-4.png'),
(5, '传奇', '03"22''', '/Public/img/singer-5.png'),
(6, '我害怕', '03"42''', '/Public/img/singer-6.png'),
(7, '大城小爱', '03"25''', '/Public/img/singer-7.png'),
(8, '大演说家', '04"22''', '/Public/img/singer-8.png'),
(9, '今天你要嫁给我', '04"35''', '/Public/img/singer-9.png');

-- --------------------------------------------------------

--
-- 表的结构 `rec2`
--

CREATE TABLE IF NOT EXISTS `rec2` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rec2`
--

INSERT INTO `rec2` (`id`, `name`, `time`, `pic`) VALUES
(1, '歌手与演员', '04"52''', '/Public/img/singer-1.png'),
(2, '暧昧', '03"56''', '/Public/img/singer-2.png'),
(3, '断桥残雪', '04"55''', '/Public/img/singer-3.png'),
(4, '动物世界', '04"55"', '/Public/img/singer-4.png'),
(5, '认真的雪', '03"22''', '/Public/img/singer-5.png'),
(6, '我害怕', '03"42''', '/Public/img/singer-6.png'),
(7, '大城小爱', '03"25''', '/Public/img/singer-7.png'),
(8, '大演说家', '04"22''', '/Public/img/singer-8.png'),
(9, '幸福像花儿一样', '04"35''', '/Public/img/singer-9.png');

-- --------------------------------------------------------

--
-- 表的结构 `rec3`
--

CREATE TABLE IF NOT EXISTS `rec3` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rec3`
--

INSERT INTO `rec3` (`id`, `name`, `time`, `pic`) VALUES
(1, '童话镇', '04"52''', '/Public/img/singer-1.png'),
(2, '灰姑娘', '03"56''', '/Public/img/singer-2.png'),
(3, '纤夫的爱', '04"55''', '/Public/img/singer-3.png'),
(4, '传奇', '04"55"', '/Public/img/singer-4.png'),
(5, '传奇', '03"22''', '/Public/img/singer-5.png'),
(6, '我害怕', '03"42''', '/Public/img/singer-6.png'),
(7, '朱丽叶', '03"25''', '/Public/img/singer-7.png'),
(8, '大演说家', '04"22''', '/Public/img/singer-8.png'),
(9, '黑色毛衣', '04"35''', '/Public/img/singer-9.png');

-- --------------------------------------------------------

--
-- 表的结构 `rec4`
--

CREATE TABLE IF NOT EXISTS `rec4` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `rec4`
--

INSERT INTO `rec4` (`id`, `name`, `time`, `pic`) VALUES
(1, '听妈妈的话', '04"52''', '/Public/img/singer-1.png'),
(2, '大爱无疆', '03"56''', '/Public/img/singer-2.png'),
(3, '菠萝菠萝蜜', '04"55''', '/Public/img/singer-3.png'),
(4, '军中绿花', '04"55"', '/Public/img/singer-4.png'),
(5, '传奇', '03"22''', '/Public/img/singer-5.png'),
(6, '我害怕', '03"42''', '/Public/img/singer-6.png'),
(7, '朱丽叶', '03"25''', '/Public/img/singer-7.png'),
(8, '我没有钱  我不要脸', '04"22''', '/Public/img/singer-8.png'),
(9, '犀利哥', '04"35''', '/Public/img/singer-9.png');

-- --------------------------------------------------------

--
-- 表的结构 `risk`
--

CREATE TABLE IF NOT EXISTS `risk` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `risk`
--

INSERT INTO `risk` (`id`, `content`, `type`) VALUES
(1, '你今天穿了什么颜色的胖次', 1),
(2, '你第一次夜不归宿是几岁，和谁', 1),
(3, '第一次说脏话是几岁', 1),
(4, '第一次自己出远门是几岁', 1),
(5, '第一次赚钱是几岁', 1),
(6, '赚到最大的钱是多少', 1),
(7, '你的初吻是几岁', 1),
(8, '你最喜欢的歌手是谁？', 1),
(9, '你第一次去网吧是几岁', 1),
(10, '你第一次喝酒是和谁', 1),
(11, '你的胸围是多少', 1),
(12, '你的初恋是谁', 1);

-- --------------------------------------------------------

--
-- 表的结构 `singerinfo`
--

CREATE TABLE IF NOT EXISTS `singerinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cid` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `count` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singerinfo`
--

INSERT INTO `singerinfo` (`id`, `name`, `cid`, `url`, `pic`, `count`) VALUES
(1, '蔡妍', 1, '/Public/img/s1.png', '/Public/img/s1.png', 382),
(2, '林夕', 1, '/Public/img/s2.png', '/Public/img/s2.png', 385),
(3, '王菲', 1, '/Public/img/s3.png', '/Public/img/s3.png', 599),
(4, '那英', 2, '/Public/img/s4.png', '/Public/img/s4.png', 557),
(5, '孙燕姿', 2, '/Public/img/s5.png', '/Public/img/s5.png', 666),
(6, '莫文蔚', 2, '/Public/img/s6.png', '/Public/img/s6.png', 542),
(7, '张惠妹', 3, '/Public/img/s7.png', '/Public/img/s7.png', 254),
(8, '叮当', 3, '/Public/img/singer-6.png', '/Public/img/singer-6.png', 654),
(9, '蔡卓妍', 3, '/Public/img/singer-1.png', '/Public/img/singer-1.png', 999);

-- --------------------------------------------------------

--
-- 表的结构 `singerinfos`
--

CREATE TABLE IF NOT EXISTS `singerinfos` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cid` int(12) NOT NULL,
  `bac` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `count` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singerinfos`
--

INSERT INTO `singerinfos` (`id`, `name`, `cid`, `bac`, `pic`, `count`) VALUES
(1, '蔡妍', 1, '/Public/img/s1.png', '/Public/img/s1.png', 382),
(2, '林夕', 1, '/Public/img/s2.png', '/Public/img/s2.png', 385),
(3, '王菲', 1, '/Public/img/s3.png', '/Public/img/s3.png', 599),
(4, '那英', 2, '/Public/img/s4.png', '/Public/img/s4.png', 557),
(5, '孙燕姿', 2, '/Public/img/s5.png', '/Public/img/s5.png', 666),
(6, '莫文蔚', 2, '/Public/img/s6.png', '/Public/img/s6.png', 542),
(7, '张惠妹', 3, '/Public/img/s7.png', '/Public/img/s7.png', 254),
(8, '叮当', 3, '/Public/img/singer-6.png', '/Public/img/singer-6.png', 654),
(9, '蔡卓妍', 3, '/Public/img/singer-1.png', '/Public/img/singer-1.png', 999),
(10, '蔡妍', 4, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 368),
(11, '林夕', 4, '/Public/img/singer-5.png', '/Public/img/singer-5.png', 368),
(12, '王菲', 4, '/Public/img/singer-3.png', '/Public/img/singer-3.png', 568),
(13, '那英', 5, '/Public/img/singer-2.png', '/Public/img/singer-2.png', 568),
(14, '孙燕姿', 5, '/Public/img/singer-7.png', '/Public/img/singer-7.png', 668),
(15, '莫文蔚', 5, '/Public/img/singer-8.png', '/Public/img/singer-8.png', 568),
(16, '张惠妹', 6, '/Public/img/singer-9.png', '/Public/img/singer-9.png', 268),
(17, '叮当', 6, '/Public/img/singer-1.png', '/Public/img/singer-1.png', 668),
(18, '蔡卓妍', 6, '/Public/img/singer-2.png', '/Public/img/singer-2.png', 968),
(19, '王菲', 2, '/Public/img/singer-3.png', '/Public/img/singer-3.png', 568),
(20, '那英', 2, '/Public/img/singer-5.png', '/Public/img/singer-5.png', 568),
(21, '孙燕姿', 4, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 668),
(22, '莫文蔚', 6, '/Public/img/singer-9.png', '/Public/img/singer-9.png', 568),
(23, '张惠妹', 6, '/Public/img/singer-2.png', '/Public/img/singer-2.png', 268),
(24, '叮当', 4, '/Public/img/singer-7.png', '/Public/img/singer-7.png', 668),
(25, '蔡卓妍', 2, '/Public/img/singer-8.png', '/Public/img/singer-8.png', 968),
(26, '那英', 3, '/Public/img/singer-1.png', '/Public/img/singer-1.png', 568),
(27, '孙燕姿', 4, '/Public/img/singer-2.png', '/Public/img/singer-2.png', 668),
(28, '莫文蔚', 4, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 568),
(29, '张惠妹', 4, '/Public/img/singer-6.png', '/Public/img/singer-6.png', 268),
(30, '叮当', 4, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 668),
(31, '蔡卓妍', 4, '/Public/img/singer-5.png', '/Public/img/singer-5.png', 968),
(32, '孙燕姿', 5, '/Public/img/singer-9.png', '/Public/img/singer-9.png', 668),
(33, '莫文蔚', 5, '/Public/img/singer-7.png', '/Public/img/singer-7.png', 568),
(34, '张惠妹', 5, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 268),
(35, '叮当', 5, '/Public/img/singer-1.png', '/Public/img/singer-1.png', 668),
(36, '蔡卓妍', 5, '/Public/img/singer-2.png', '/Public/img/singer-2.png', 968),
(37, '孙燕姿', 6, '/Public/img/singer-3.png', '/Public/img/singer-3.png', 668),
(38, '莫文蔚', 6, '/Public/img/singer-4.png', '/Public/img/singer-4.png', 568),
(39, '张惠妹', 6, '/Public/img/singer-5.png', '/Public/img/singer-5.png', 268),
(40, '叮当', 6, '/Public/img/singer-6.png', '/Public/img/singer-6.png', 668),
(41, '蔡卓妍', 6, '/Public/img/singer-7.png', '/Public/img/singer-7.png', 944);

-- --------------------------------------------------------

--
-- 表的结构 `singerlist`
--

CREATE TABLE IF NOT EXISTS `singerlist` (
  `id` int(12) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name2` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `singerlist`
--

INSERT INTO `singerlist` (`id`, `name`, `name2`, `class`, `pic`, `url`) VALUES
(1, '内地偶像组合', '', '1', '/Public/img/songslist_neidi.png', '/index.php/sing/singer'),
(2, '内地男歌手', '', '2', '/Public/img/songslist_neiidnan.png', '/index.php/sing/singer'),
(3, '日韩女歌手', '', '2', '/Public/img/songslist_rihan.png', '/index.php/sing/singer'),
(4, '港台歌手', '', '2', '/Public/img/songslist_gangtai.png', '/index.php/sing/singer'),
(5, '内——地', '女歌手', '3', '/Public/img/songslist_rihan.png', '/index.php/sing/singer'),
(6, '青春偶像', '男 歌 手', '3', '/Public/img/songslist_ouxiangnan.png', '/index.php/sing/singer');

-- --------------------------------------------------------

--
-- 表的结构 `song`
--

CREATE TABLE IF NOT EXISTS `song` (
  `id` int(12) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `aid` int(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `song`
--

INSERT INTO `song` (`id`, `name`, `src`, `duration`, `aid`) VALUES
(1, '背影', '/Public/music/1.mp3', '3:55', 1),
(2, '初爱', '/Public/music/2.mp3', '3:55', 2),
(3, '红玫瑰', '/Public/music/3.mp3', '3:55', 3),
(4, '情书', '/Public/music/4.mp3', '3:55', 4),
(5, '幸福的错觉', '/Public/music/5.mp3', '3:55', 5),
(6, '阴天', '/Public/music/6.mp3', '3:55', 6),
(7, '告白气球', '/Public/music/7.mp3', '3:55', 7),
(8, '父亲写的散文诗', '/Public/music/8.mp3', '3:55', 8),
(9, '我知道你都知道', '/Public/music/9.mp3', '3:55', 9),
(10, '南方姑娘', '/Public/music/10.mp3', '3:55', 10);

-- --------------------------------------------------------

--
-- 表的结构 `song_view`
--

CREATE TABLE IF NOT EXISTS `song_view` (
  `id` int(12) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `aid` int(12) DEFAULT NULL,
  `singer_name` varchar(255) DEFAULT NULL,
  `singer_pic` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `hot` int(12) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `store`
--

INSERT INTO `store` (`id`, `name`, `price`, `hot`, `pic`, `type`) VALUES
(1, 'HELMSAN啤酒', '8.6', 3, '/Public/img/1.png', 1),
(2, 'HELMSAN啤酒', '8.6', 6, '/Public/img/2.png', 1),
(3, 'HELMSAN啤酒', '8.6', 3, '/Public/img/3.png', 1),
(4, 'HELMSAN啤酒', '8.6', 6, '/Public/img/34.png', 1),
(5, 'cocacola', '8.6', 3, '/Public/img/1.png', 1),
(6, 'VIO', '9', 4, '/Public/img/05.png', 1),
(7, 'cocacola', '8.6', 3, '/Public/img/2.png', 1),
(8, 'VIO', '9', 4, '/Public/img/3.png', 1);

-- --------------------------------------------------------

--
-- 表的结构 `toke`
--

CREATE TABLE IF NOT EXISTS `toke` (
  `id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `toke`
--

INSERT INTO `toke` (`id`, `content`, `type`) VALUES
(1, '对你身边最近的人说我爱你。', 2),
(2, '出门左转，对遇到的第三位女性说我爱你', 2),
(3, '含着一口水说绕口令', 2),
(4, '拿起手机自拍并做怪异姿势上传社交网络', 2),
(5, '对房间内单身的人说我爱你', 2),
(6, '一口气喝完一瓶啤酒', 2),
(7, '到Ktv的超市买酒，并对收银员说我是同性恋', 2),
(8, '将一桶爆米花在三分钟内吃完', 2),
(9, '一口气喝三瓶啤酒', 2),
(10, '将桌子上的已开盖啤酒清空', 2),
(11, '亲吻你的脚踝', 2),
(12, '嚼着冰块喝啤酒，并大声说 我是XXX', 2);

-- --------------------------------------------------------

--
-- 表的结构 `userManager`
--

CREATE TABLE IF NOT EXISTS `userManager` (
  `id` int(12) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userManager`
--

INSERT INTO `userManager` (`id`, `user`, `password`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e'),
(2, 'Admin', 'e10adc3949ba59abbe56e057f20f883e'),
(3, 'super', '1b35ba31404c21c6084c0387210b3475');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
