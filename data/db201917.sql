-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2023-05-24 15:11:15
-- 服务器版本： 8.0.21
-- PHP 版本： 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `db201917`
--
CREATE DATABASE IF NOT EXISTS `db201917` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `db201917`;

-- --------------------------------------------------------

--
-- 表的结构 `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `timeId` int NOT NULL AUTO_INCREMENT COMMENT '时间编号',
  `timeYear` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '时间',
  `textName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '历史标题',
  `text` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '历史内容',
  PRIMARY KEY (`timeId`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- 插入之前先把表清空（truncate） `history`
--

TRUNCATE TABLE `history`;
--
-- 转存表中的数据 `history`
--

INSERT INTO `history` (`timeId`, `timeYear`, `textName`, `text`) VALUES
(1, '1919.5.——1921.7.', '党的创立时期', '近代中国社会的演变和“救亡图存”斗争的屡遭失败，奠定了中国共产党产生的社会基础；中国工人阶级队伍的壮大和政治上的觉醒，奠定了中国共产党产生的阶级基础；十月革命的胜利和马克思主义的传人，奠定了中国共产党产生的思想基础；五四新文化运动的发生奠定了中国共产党产生的干部基础。在各种条件具备后，1921年中国共产党的诞生就成为了历史的必然'),
(2, '1921.7.——1927.7', '国民革命时期', '1924年的第一次国共合作巩固了广东革命根据地，推动了北伐战争的顺利进军，但由于幼年的中国共产党对国民党右派的妥协退让，放弃了对同一战线和武装斗争的领导权，致使国民党右派势力得逞，1927年蒋介石和汪精卫相继背叛革命国民革命失败。'),
(3, '1927.7.——1937.7.', '土地革命时期', '在这一时期，中国共产党成功地实现了两次生死攸关的大转折：第一次是从国民革命失败到土地革命战争的兴起，中国共产党在失败中总结教训，成功的找到了一条符合中国实际的革命道路——农村包围城市、武装夺取政权的正确道路。\r\n第二次是从第五次反“围剿”失败到遵义会议的召开，停止了“左倾”路线在党内的统治，重新确定了毛泽东同志在党的领导地位，挽救了红军、挽救了革命、挽救了党'),
(4, '1937.7.——1945.8.', '抗日战争时期', '1937年7月7日，日本发动了“芦沟桥事变”，点燃了全面侵华的战火。在全国人民抗日热情地推动和中国共产党的努力下，以第二次国共合作为基础的抗日民族统一战线建立，并历经八年艰苦抗战，打败了强大的日本侵略者，取得了抗日战争的伟大胜利。'),
(5, '1945.8.——1949.10.', '解放战争时期', '抗战胜利后，蒋介石不顾全国人民和中国共产党及各民主党派的反对，在美国的支持下发动了全面内战。中国共产党在全国人民和各民族党派的支持下，最终打败了国民党反动派，建立了新中国，取得了新民主主义革命的伟大胜利。'),
(6, '1949.10.——1956.12.', '向社会主义过度时期', '1949年到1952年，面对满目倡痍、白废待兴、茅盾重重的困难局面，中国共产党遵循“不要四面出击”的方针，成功地用三年时间实现了国民经济的根本好转。从1952年开始，又展开并完成了对农业、手工业和资本主义工商业的社会主义改造，实现了由新民主主义向社会主义过渡。'),
(7, '1957.——1965.', '社会主义建设道路的探索时期', '从1957年开始，中国共产党进行了全面的社会主义建设，虽然取得了伟大的成就，但在主客观因素的影响下，也出现了阶级斗争扩大化和经济建设中的“左倾错误”。'),
(8, '1966.——1976.3', '文化大革命时期', '在“以阶级斗争为纲”的错误路线指导下，加之林彪、江青两个反革命集团的破坏，出现了“文化大革命”这样历时十年的全局性内乱，使我国的社会主义建设遭受了严重挫折和损失。'),
(9, '1976.——1981.', '拨乱反正时期', '1977年粉碎“四人帮”后，由于党的主要领导人坚持“两个凡是”的错误思想，使社会主义建设处于徘徊不前的局面，党的第十一届三中全会重新确立了解放思想，实事求是，团结一致向前看的思想路线，并开始了全面的拨乱反正工作；\r\n到党的十一届六中全会《决议》的制定并通过，标志着拨乱反正工作的胜利完成，中国共产党成功地实现了第三次转折'),
(10, '1982.——今', '改革开放新时期', '从党的十二大到十六大，中国共产党成功实现了两代领导班子的顺利交接，在对毛泽东思想继承的基础上，创立了邓小平理论和“三个代表”重要思想两大理论体系，领导中国人民取得了改革开放的丰硕成果。');

-- --------------------------------------------------------

--
-- 表的结构 `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `passage_id` int NOT NULL COMMENT '文章编号',
  `user_id` int NOT NULL COMMENT '用户编号',
  `message_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '评论内容',
  `message_status` int NOT NULL DEFAULT '1' COMMENT '评论状态',
  `message_thumbs` int NOT NULL DEFAULT '0' COMMENT '评论点赞数',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 插入之前先把表清空（truncate） `messages`
--

TRUNCATE TABLE `messages`;
--
-- 转存表中的数据 `messages`
--

INSERT INTO `messages` (`message_id`, `passage_id`, `user_id`, `message_content`, `message_status`, `message_thumbs`) VALUES
(1, 1, 1, 'ok', 0, 7),
(2, 1, 1, '1234', 0, 1),
(3, 1, 1, '亿', 1, 1),
(4, 1, 1, '123', 1, 0),
(5, 1, 1, '李大钊同志', 1, 0),
(7, 2, 1, '赵世炎同志', 1, 0),
(6, 1, 2, '大钊先生真帅', 1, 0),
(8, 2, 1, '感谢赵世炎', 1, 0),
(9, 2, 1, '赵世炎同志真帅', 1, 0),
(10, 2, 1, '11111', 1, 0),
(11, 3, 1, '蔡公', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `passages`
--

DROP TABLE IF EXISTS `passages`;
CREATE TABLE IF NOT EXISTS `passages` (
  `passage_id` int NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `passage_title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文章标题',
  `passage_source` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文章来源',
  `passage_time` date NOT NULL COMMENT '文章发表时间',
  `passage_content` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '文章内容',
  `passage_status` int NOT NULL COMMENT '文章状态',
  `passage_thumbs` int NOT NULL DEFAULT '0' COMMENT '文章点赞数',
  PRIMARY KEY (`passage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 插入之前先把表清空（truncate） `passages`
--

TRUNCATE TABLE `passages`;
--
-- 转存表中的数据 `passages`
--

INSERT INTO `passages` (`passage_id`, `passage_title`, `passage_source`, `passage_time`, `passage_content`, `passage_status`, `passage_thumbs`) VALUES
(1, '李大钊：中国共产党的创始人之一', '新华社', '2005-02-01', '<p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">北京香山万安公墓内的李大钊烈士陵园，是根据中共中央的决定修建的。在墓碑上有中共中央撰写的碑文。碑文指出：李大钊同志是中国最早的马克思主义者和共产主义者，是中国共产党的主要创始人之一。他对中国人民的解放事业，对马克思主义的信仰和无产阶级的革命前途无限忠诚。他为在我国开创和发展共产主义运动的大无畏的献身精神，永远是一切革命者的光辉典范。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">李大钊，字守常，河北省乐亭县人，生于1889年10月29日。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">1907年考入天津北洋法政专门学校学习政治经济。1913年冬，李大钊怀着忧国忧民的情怀，东渡日本，考入东京早稻田大学政治本科学习。当日本帝国主义向袁世凯提出灭亡中国的“二十一条”后，他积极参加留日学生总会的爱国斗争，他起草的《警告全国父老书》的通电迅速传遍全国，他也因此成为举国闻名的爱国志士。1916年李大钊回国后，积极参与正在兴起的新文化运动。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">俄国十月社会主义革命的胜利极大地鼓舞和启发了李大钊，他先后发表了《法俄革命之比较观》、《庶民的胜利》和《布尔什维主义的胜利》等文章和演说。他宣称：“试看将来的环球，必是赤旗的世界！”1919年，他又发表了《新纪元》、《我的马克思主义观》、《再论问题与主义》等几十篇宣传马克思主义的文章。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">1920年3月，李大钊在北京大学发起组织马克思学说研究会。10月，在李大钊发起下，北京共产主义小组建立。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">1921年中国共产党成立后，李大钊代表党中央指导北方的工作。在党的二大、三大和四大，他都当选为中央委员。</span></span></p>\r\n        <p style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\"><span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span style=\"font-family: 微软雅黑;\">1926年3月，李大钊领导并亲自参加了北京人民反对日、英帝国主义和反对军阀张作霖、吴佩孚的斗争。北洋军阀段祺瑞执政府制造了“三一八”惨案，北京一片白色恐怖。李大钊在极端危险和困难的情况下，继续领导党的北方组织坚持革命斗争。1927年4月6日，奉系军阀张作霖勾结帝国主义，闯进苏联大使馆驻地，逮捕了李大钊等80余人。李大钊备受酷刑，在监狱中，在法庭上，始终大义凛然，坚贞不屈。4月28日，军阀不顾广大人民群众和社会舆论的强烈反对和谴责，悍然将李大钊等20位革命者绞杀在西交民巷京师看守所内。李大钊第一个走上绞架，从容就义，时年38岁。</span></span></p>', 1, 6),
(2, '赵世炎：著名的工人运动领袖', ' 新华社', '2005-02-18', '<p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">赵世炎是中国共产党早期杰出的无产阶级革命家、著名的工人运动领袖。他是上海工人三次武装起义的主要领导人之一。在上海工人三次武装起义斗争中，他紧紧把握斗争方向，注意加强起义队伍的组织建设。在斗争遭到挫折时，及时总结经验教训。为组织好第三次武装起义，他和周恩来同志一起进行了周密的部署，并在斗争中身先士卒，冲锋陷阵，打败了反革命武装，在中国工人运动史上写下了辉煌的一页。</span></span>\r\n        </p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">蒋介石发动“四一二”反革命政变后，他领导广大上海工人群众继续坚持斗争。面对严重的白色恐怖，他临危不惧，坚定表示：</span>“共产党就是战斗的党，……党存在一天就必须战斗一天，不愿意参加斗争，还算什么共产党员！”1927年7月2日，赵世炎不幸被捕。在凶残的敌人面前，他大义凛然，坚贞不屈，表现了共产党人大无畏的英雄主义气概。面对敌人的屠刀，高呼“中国共产党万岁”英勇就义，把26岁闪光的青春和满腔热血献给了中国人民的解放事业。<br></span>\r\n        </p>', 1, 1),
(3, '蔡和森：中国共产党工人运动领袖', '新华社', '2005-02-02', '<p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">蔡和森生于</span>1895年，是我党早期卓越的领导人和工人运动领袖，1931年8月被国民党反动派杀害，年仅36岁。</span></p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span\r\n                style=\"font-family: 微软雅黑; font-size: 13.5pt;\">1925年5月15日，上海日本棉纱厂发生了一起枪杀工人顾正红的事件，激起了群众的强烈愤慨。在革命斗争的关键时刻，蔡和森毫不犹豫地站了出来。他和刘少奇等同志，一方面深入群众之中组织领导罢工活动，另一方面广泛发动各界声援，形成大规模的群众性反帝爱国运动。</span>\r\n        </p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span\r\n                style=\"font-family: 微软雅黑; font-size: 13.5pt;\">5月28日，在党中央召开的紧急会议上，蔡和森建议说：“5月30日工部局要非法审讯被捕学生，企图以此恫吓上海人民，我们应该在这一天组织反帝斗争大示威，同他们进行针锋相对的斗争。”他还提出应不失时机地把上海工人、学生的反帝斗争推向全国，形成全国性的反帝运动。</span>\r\n        </p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">在蔡和森等人的组织下，</span>5月30日，上海人民积蓄已久的反帝斗争怒火终于爆发了，这就是震惊中外的“五卅运动”。</span></p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">面对中国人民的反抗，帝国主义进行了疯狂的镇压。</span>5月30日晚，中央再次召开紧急会议。蔡和森提出，在目前的形势下，必须进一步团结群众，组成浩浩荡荡的反帝大军，实行工人罢工、学生罢课、商人罢市的“三罢”斗争。</span>\r\n        </p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\"><span\r\n                    style=\"font-family: 微软雅黑;\">在蔡和森等人领导下，</span>“三罢”斗争迅速波及全国，掀起了波澜壮阔的反帝斗争高潮。</span></p>\r\n        <p\r\n            style=\"margin: 0pt 0pt 15.65pt; text-align: justify; text-indent: 27pt; -ms-text-autospace: ideograph-numeric; -ms-text-justify: inter-ideograph;\">\r\n            <span style=\"font-family: 微软雅黑; font-size: 13.5pt;\">“五卅运动”在中国革命史上写下了光辉的一页。蔡和森在这场运动中，始终站在革命斗争的最前列。</span></p>', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `questions`
--

DROP TABLE IF EXISTS `questions`;
CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '问题编号',
  `question_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '问题内容',
  `question_answer` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '问题答案',
  `A` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '选项内容',
  `B` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '选项内容',
  `C` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '选项内容',
  `D` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '选项内容',
  PRIMARY KEY (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 插入之前先把表清空（truncate） `questions`
--

TRUNCATE TABLE `questions`;
--
-- 转存表中的数据 `questions`
--

INSERT INTO `questions` (`question_id`, `question_content`, `question_answer`, `A`, `B`, `C`, `D`) VALUES
(1, '<p>党的____把习近平新时代中国特色社会主义思想确立为党必须长期坚持的指导思想并写入党章。</p>', '十九大', '十八大', '十八届四中全会', '十九大', '十九届五中全会'),
(2, '<p>以下哪一项不是深刻理解和全面把握习近平新时代中国特色社会主义思想的金钥匙____。</p>', '为区域谋发展', '为人民谋幸福', '为区域谋发展', '为民族谋复兴', '为世界谋大同'),
(3, '<p>随着马克思主义同中国工人运动的结合日益紧密、建立统一的中国共产党的条件日益成熟。在共产国际代表的促进下，中共一大于______在上海召开。</p>', '1921年7月23日', '1921年6月20日', '1921年7月1日', '1921年7月23日', '1921年7月30日'),
(4, '<p>中国共产党第十九次全国代表大会，是在全面建成小康社会决胜阶段、中国特色社会主义进入______的关键时期召开的一次十分重要的大会。</p>', '新时代', '新时期', '新阶段', '新征程', '新时代'),
(5, '<p>中国共产党人的初心和使命，就是为中国人民，为中华民族。这个初心和使命是激励中国共产党人不断前进的根本动力。</p>', '谋幸福，谋复兴', '谋幸福，谋未来', '谋生活，谋复兴', '谋幸福，谋复兴', '谋生活，谋未来'),
(6, '<p>发展是解决我国一切问题的基础和关键，发展必须是科学发展，必须坚定不移贯彻的发展理念。</p>', '创新、协调、绿色、开放、共享', '创新、协调、绿色、开放、共享', '创造、协调、生态、开放、共享', '创新、统筹、绿色、开放、共享', '创造、统筹、生态、开放、共享'),
(7, '<p>中国共产党是中国工人阶级的先锋队，同时是中国人民和____的先锋队，是中国特色社会主义事业的领导核心。</p>', '中华民族', '新社会阶层', '中华民族', '知识分子', '农民阶级'),
(8, '<p>近代以来，中华民族面对着两大历史任务：一个是____；一个是实现国家繁荣富强和人民共同富裕。</p>', '求得民族独立和人民解放', '反对帝国主义', '反对封建主义', '求得民族独立和人民解放', '实现民族复兴'),
(9, '<p>___是中国革命史上具有重大意义的事件，标志着中国新民主主义革命的开端。</p>', '五四运动', '辛亥革命', '护国运动', '五四运动', '二次革命'),
(10, '<p>1921年7月23日，党的一大在上海开幕。后因代表们的活动受到监视，大会转移到浙江____继续召开。党的一大的召开宣告中国共产党正式成立。</p>', '嘉兴南湖', '杭州西湖', '嘉兴南湖', '绍兴东湖', '宁波东钱湖');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户名',
  `user_sex` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户性别',
  `user_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '用户密码',
  `user_score` int NOT NULL DEFAULT '0' COMMENT '用户积分',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- 插入之前先把表清空（truncate） `users`
--

TRUNCATE TABLE `users`;
--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_sex`, `user_pwd`, `user_score`) VALUES
(1, 'kiyoshi', '女', '123456', 9),
(2, 'sherry', '女', '123456', 0),
(3, 'zjvivi', '女', '123456', 0),
(4, 'zjvivi', '女', '123456', 0),
(5, 'wuya', '女', '123456', 8),
(6, 'wyaaa', '女', '123456', 8),
(7, '1234', '女', '123456', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
