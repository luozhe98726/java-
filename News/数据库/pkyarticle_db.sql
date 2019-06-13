/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : pkyarticle_db

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2019-05-27 18:15:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `mylinks`
-- ----------------------------
DROP TABLE IF EXISTS `mylinks`;
CREATE TABLE `mylinks` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(255) DEFAULT NULL,
  `l_address` varchar(255) DEFAULT NULL,
  `l_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mylinks
-- ----------------------------
INSERT INTO `mylinks` VALUES ('2', '腾讯视频', 'https://v.qq.com/', '2019-05-14 20:01:14');
INSERT INTO `mylinks` VALUES ('4', '百度', 'https://www.baidu.com', '2019-05-15 22:11:45');
INSERT INTO `mylinks` VALUES ('5', '腾讯QQ', 'https://v.qq.com/', '2019-05-14 21:15:10');
INSERT INTO `mylinks` VALUES ('6', '腾讯微信', 'https://v.qq.com/', '2019-05-14 21:18:17');
INSERT INTO `mylinks` VALUES ('7', '智联招聘', 'https://www.zhaopin.com/', '2019-05-15 22:22:07');
INSERT INTO `mylinks` VALUES ('8', '360', 'https://hao.360.com/?a1004', '2019-05-15 22:43:08');
INSERT INTO `mylinks` VALUES ('9', '京东', 'https://www.jd.com/', '2019-05-16 15:00:20');

-- ----------------------------
-- Table structure for `p_admin`
-- ----------------------------
DROP TABLE IF EXISTS `p_admin`;
CREATE TABLE `p_admin` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `a_username` varchar(255) DEFAULT NULL,
  `a_password` varchar(255) DEFAULT NULL,
  `a_photo` varchar(255) DEFAULT NULL,
  `a_sex` varchar(255) DEFAULT NULL,
  `a_age` int(11) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_admin
-- ----------------------------
INSERT INTO `p_admin` VALUES ('1', 'luozhe', '111', null, null, null);

-- ----------------------------
-- Table structure for `p_clnews`
-- ----------------------------
DROP TABLE IF EXISTS `p_clnews`;
CREATE TABLE `p_clnews` (
  `f_id` int(30) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(30) NOT NULL,
  `f_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`f_id`),
  UNIQUE KEY `f_name` (`f_name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_clnews
-- ----------------------------
INSERT INTO `p_clnews` VALUES ('37', '体育新闻', '2019-05-12 13:51:17');
INSERT INTO `p_clnews` VALUES ('38', '校园动态', '2019-05-12 13:51:22');
INSERT INTO `p_clnews` VALUES ('39', '失物招领', '2019-05-18 12:07:48');
INSERT INTO `p_clnews` VALUES ('40', '学院公告', '2019-05-12 13:51:33');
INSERT INTO `p_clnews` VALUES ('41', '社会新闻', '2019-05-12 13:51:38');
INSERT INTO `p_clnews` VALUES ('42', '招聘信息', '2019-05-18 12:08:04');
INSERT INTO `p_clnews` VALUES ('43', '宿舍管理', '2019-05-12 13:51:47');
INSERT INTO `p_clnews` VALUES ('44', '校园趣事', '2019-05-13 20:42:48');

-- ----------------------------
-- Table structure for `p_file`
-- ----------------------------
DROP TABLE IF EXISTS `p_file`;
CREATE TABLE `p_file` (
  `pf_id` int(11) NOT NULL AUTO_INCREMENT,
  `pf_name` varchar(255) DEFAULT NULL,
  `pf_image` varchar(255) DEFAULT NULL,
  `pf_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` int(11) DEFAULT NULL,
  `u_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pf_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `p_file_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `p_userinfo` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_file
-- ----------------------------
INSERT INTO `p_file` VALUES ('5', '附件5-胡百欣简历.doc', '/upload/2019/05/19/155824834435591188783附件5-胡百欣简历.doc', '2019-05-19 15:00:26', '2', 'luozhe');
INSERT INTO `p_file` VALUES ('6', '附件7-分散实习任务书.docx', '/upload/2019/05/19/155824851179669430386附件7-分散实习任务书.docx', '2019-05-19 15:00:28', '2', 'luozhe');
INSERT INTO `p_file` VALUES ('7', '程琪萱个人简历 .doc', '/upload/2019/05/19/155824898121560516232程琪萱个人简历 .doc', '2019-05-19 14:56:21', '2', 'luozhe');
INSERT INTO `p_file` VALUES ('8', '罗哲简历.doc', '/upload/2019/05/19/155825745981858360980罗哲简历.doc', '2019-05-19 17:17:39', '2', 'luozhe');
INSERT INTO `p_file` VALUES ('9', '罗哲开题报告 V4.0.doc', '/upload/2019/05/19/155827127362386474930罗哲开题报告 V4.0.doc', '2019-05-19 21:07:53', '2', 'luozhe');

-- ----------------------------
-- Table structure for `p_news`
-- ----------------------------
DROP TABLE IF EXISTS `p_news`;
CREATE TABLE `p_news` (
  `p_newsId` int(11) NOT NULL AUTO_INCREMENT,
  `p_newsAu` varchar(255) DEFAULT NULL,
  `p_newsTitle` varchar(255) DEFAULT NULL,
  `p_newsContent` text,
  `p_newsK` varchar(255) DEFAULT NULL,
  `p_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `p_click` int(11) DEFAULT '0',
  `p_newsPo` int(11) DEFAULT '1',
  `f_id` int(11) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_newsId`),
  KEY `f_id` (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_news
-- ----------------------------
INSERT INTO `p_news` VALUES ('38', '罗哲', '库里36+6勇士逆转夺赛点​', '<p style=\"white-space: normal;\">虎扑5月19日讯 勇士今日带着2-0的总比分前往波特兰再战开拓者，这场比赛对于两支球队来说都是重要的比赛，双方也在这场比赛对中锋位置做出调整，琼斯成为勇士首发人选，而伦纳德则替下坎特首发登场。首节比赛开拓者依靠着利拉德和麦科勒姆的两记三分迅速抢得开局，勇士则在水花兄弟联手砍下18分的带动下一直追赶比分，首节结束时开拓者29-27领先勇士。次节开局开拓者的替补阵容突然爆发，降入替补的坎特连得7分成为关键先生，加上其他替补球员的连续反击进球，开拓者送出18-5的攻势一举拉开比分，半场结束时，开拓者66-53领先勇士，值得一提的是，进入首发的伦纳德成为奇兵半场贡献13分。</p><p style=\"white-space: normal;\">第三节的剧本和上一场开拓者被逆转的场面如出一辙，勇士在这一节攻防两端全面压制开拓者，单节仅让对手得到13分，与此同时，他们自己则送出18-3的一波流攻势强势反超比分，三节结束时勇士反超3分。末节开拓者后场核心双枪大失水准，利拉德依旧找不到准心各种打铁，麦科勒姆则在罚球线连连罚球，随着库里连得7分的表现之后，勇士确立起两位数领先奠定胜局。最终，勇士110-99再次逆转开拓者拿下比赛，同时在总比分上3-0领先开拓者。</p><p style=\"white-space: normal;\">勇士数据：斯蒂芬-库里36分6篮板3助攻；克莱-汤普森19分5篮板5助攻；德雷蒙德-格林20分13篮板12助攻4抢断；凯文-卢尼8分3篮板；肖恩-利文斯顿6分。</p><p style=\"white-space: normal;\">开拓者数据：CJ-麦科勒姆23分5助攻；达米安-利拉德19分6篮板6助攻；迈耶斯-伦纳德16分3篮板4助攻；莫里斯-哈克利斯6分3篮板2封盖；扎克-科林斯6分8篮板；埃文-特纳12分3篮板。</p><p style=\"white-space: normal;\">两队分差：上边勇士，下边开拓者</p><p><span class=\"titIcon\" style=\"float: left; display: inline-block; height: 20px; padding: 0px 4px; background: rgb(153, 0, 0); color: rgb(255, 255, 255); font-family: &quot;lucida grande&quot;, tahoma, verdana, arial, 宋体, sans-serif; font-size: 12px; font-weight: bold;\">NBA</span><a target=\"_blank\" class=\"\" href=\"https://bbs.hupu.com/27490147.html\" style=\"color: rgb(153, 0, 0); text-decoration: none; cursor: pointer; float: left; margin-left: 7px; font-size: 14px; font-family: &quot;lucida grande&quot;, tahoma, verdana, arial, 宋体, sans-serif; font-weight: bold; white-space: normal;\">库里36+6勇士逆转夺赛点</a></p>', '勇士  斯蒂芬-库里', '2019-05-25 23:42:38', '26', '0', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('39', '贾锐', '杜兰特有可能会错过整个西决', '<p>111</p>', '凯文-杜兰特 勇士', '2019-05-22 03:05:17', '2', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('44', '罗哲', '学院院长阳王东带队', '<p>111</p>', '院长阳王东', '2019-05-24 00:15:28', '2', '1', '38', '校园动态');
INSERT INTO `p_news` VALUES ('45', '程琪萱', '第十届“蓝桥杯”', '<p style=\"margin: 0 24px 15px;line-height: 1.75em;text-indent: 28px\"><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">近日，第十届“蓝桥杯”全国软件和信息技术专业人才大赛</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">软件创业团队</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">赛省赛结果揭晓。我院</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">阳俊、阳王东老师指导的</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">“瓮牖绳枢”队荣获一等奖、“偃仰啸歌”队荣获三等奖</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">，获得一等</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">奖的</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">团队</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">将参加今年5月份在北京举行的全国总决赛。</span></p><p style=\"margin: 0 24px 15px;line-height: 1.75em;text-indent: 28px\"><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">近年来，我院高度重视学生实践动手能力的培养，</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">积极引导学生分类发展，鼓励学生参加各类学科竞赛，</span><span style=\"color: rgb(51, 51, 51);font-family: 宋体;font-size: 19px\">夯实学生专业基础。本次“蓝桥杯”软件创业团队赛成绩的取得，是本院在该类赛事中零的突破，是本院学生实践能力培养的又一次充分体现。</span></p><p><br/></p>', '蓝桥杯', '2019-05-18 12:03:18', '0', '1', '44', '校园趣事');
INSERT INTO `p_news` VALUES ('46', '罗哲', '张学军副教授赴江西参加研讨会', '', '物理学术', '2019-05-24 20:35:56', '2', '1', '38', '校园动态');
INSERT INTO `p_news` VALUES ('47', '罗哲', '信息与电子工程学院开党员大会', '', '信息与电子工程学院', '2019-05-24 00:29:00', '1', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('50', '罗哲', '4月16日校园招聘信息', '', '招聘', '2019-05-18 16:43:27', '0', '1', '42', '招聘信息');
INSERT INTO `p_news` VALUES ('51', '贾锐', '4月17日校园招聘信息', '', '招聘', '2019-05-24 00:21:24', '1', '1', '42', '招聘信息');
INSERT INTO `p_news` VALUES ('53', '罗哲', '欢迎报考湖南城市学院体育学院 ', '<p style=\"line-height: 150%;\"><span style=\"FONT-SIZE: 19px; FONT-FAMILY: 宋体; COLOR: #222222; LINE-HEIGHT: 150%\">亲爱同学们：</span></p><p style=\"line-height: 150%; text-indent: 37px;\"><span style=\"FONT-SIZE: 19px; FONT-FAMILY: 宋体; COLOR: #222222; LINE-HEIGHT: 150%\">大家好！我是湖南城市学院体育学院党总支书记薛铁军、副院长（主持工作）李志宏，欢迎大家加入湖南城市学院体育学院这个大家庭！</span></p><p style=\"LINE-HEIGHT: 150%; TEXT-AUTOSPACE: ideograph-numeric; TEXT-INDENT: 37px\"><span style=\"FONT-SIZE: 19px; LINE-HEIGHT: 150%\">湖南城市学院是一所湖南省人民政府主办的全日制普通本科院校。学校位于长江中下游平原、洞庭湖南岸的环湖生态经济圈核心城市——湖南省益阳市，人文底蕴深厚，自然环境优美。体育学院是湖南城市学院旗下的二级学院。</span></p><p><br/></p>', '体育学院', '2019-05-24 20:36:03', '3', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('54', '罗哲', '欢迎报考湖南城市学院体育学院', '<p>体育学院始建于1973年，至今已有45年的办学历史。其前身为益阳师专体育科，1997年改为益阳师专体育系，2002年学校升本，同年更名为湖南城市学院体育系，2011年升格为湖南城市学院体育学院。2004、2006年分别开设社会体育指导与管理和体育教育本科专业，其中<strong>社会体育指导与管理专业为湖南省首批重点专业和特色专业，</strong>目前在校生近800人。</p><p><br/></p>', '体育学院', '2019-05-24 02:26:00', '3', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('76', '嗡嗡嗡', '吾问无为谓', '<p style=\"text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/PkyArticle/ueditor/jsp/upload/video/20190519/1558274759693096936.mp4\" data-setup=\"{}\"><source src=\"/PkyArticle/ueditor/jsp/upload/video/20190519/1558274759693096936.mp4\" type=\"video/mp4\"/></video></p><p>哈啊啊啊啊哈哈哈哈哈哈哈</p>', '哇哇哇哇', '2019-05-19 22:06:30', '0', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('77', '罗哲', '校长李建奇深入课堂听取思想政治理论课', '<p>（本网讯）2019年5月15日下午，校长李建奇教授深入思想政治理论课课堂，听取了马克思主义学院傅建平老师的《形势与政策》课。副校长雷存喜，教务处、教学质量监控与评估中心、马克思主义学院相关负责人参加听课。</p><p>李建奇详细记录了任课老师的课堂教学情况，对教师教学准备、课堂组织给予了充分肯定，并与傅建平老师就教学方面的相关问题进行了交流，提出了具体意见和建议。他指出，思想政治理论课是全面贯彻党的教育方针、落实立德树人根本任务的主渠道，思想政治理论课教师要不断更新知识，创新教学模式。要结合不同专业学生实际讲授形势政策课，对相关问题的阐述要有严密的逻辑性、科学性、政治性。要关注时事热点，正确引导大学生树立正确的人生观和价值观。讲课既要注重学术性，又要注重艺术性，要充分运用现代信息技术，使用生动的案例、视频、图片等开展教学。</p><p>李建奇强调，2019年是我校本科教学全面振兴年，全校上下要深入贯彻落实习近平总书记在学校思想政治理论课教师座谈会上的讲话精神、全国全省教育大会精神和新时代本科教育工作会议精神，始终坚持以本为本，全面推进“四个回归”，坚持向课堂要质量，积极探索课堂教学改革，实施“金课计划”，推进“课堂革命”，努力建设一流本科，全面提高教育教学水平和本科人才培养质量。（文/何军新 图/博夕）</p><p><br/></p>', '湖南城市学院', '2019-05-24 00:20:42', '1', '1', '38', '校园动态');
INSERT INTO `p_news` VALUES ('78', '罗哲', '衡阳师范学院', '<p>程琪萱</p>', '111', '2019-05-23 11:59:08', '4', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('79', '111', '学院', '<p>111</p>', '11', '2019-05-22 03:59:11', '1', '1', '37', '体育新闻');
INSERT INTO `p_news` VALUES ('80', '罗哲', '视屏', '<p style=\"text-align: center;\"><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/PkyArticle/ueditor/jsp/upload/video/20190524/1558629493168010979.mp4\" data-setup=\"{}\"><source src=\"/PkyArticle/ueditor/jsp/upload/video/20190524/1558629493168010979.mp4\" type=\"video/mp4\"/></video></p><p>哈哈哈哈哈哈哈哈哈</p>', '视屏', '2019-05-24 00:39:12', '1', '1', '40', '学院公告');

-- ----------------------------
-- Table structure for `p_newscoll`
-- ----------------------------
DROP TABLE IF EXISTS `p_newscoll`;
CREATE TABLE `p_newscoll` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_newsId` int(11) DEFAULT NULL,
  `c_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `u_id` int(11) DEFAULT NULL,
  `u_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `p_newsId` (`p_newsId`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `p_newscoll_ibfk_1` FOREIGN KEY (`p_newsId`) REFERENCES `p_news` (`p_newsId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_newscoll
-- ----------------------------
INSERT INTO `p_newscoll` VALUES ('1', '38', '2019-05-22 02:51:55', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('2', '38', '2019-05-22 02:51:55', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('3', '38', '2019-05-22 02:54:39', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('4', '54', '2019-05-22 03:04:39', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('5', '39', '2019-05-22 03:05:21', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('6', '53', '2019-05-22 03:05:34', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('7', '46', '2019-05-22 03:05:55', '2', 'luozhe');
INSERT INTO `p_newscoll` VALUES ('8', '53', '2019-05-22 04:00:02', '1', 'chengqixuan');
INSERT INTO `p_newscoll` VALUES ('9', '38', '2019-05-22 04:00:11', '1', 'chengqixuan');
INSERT INTO `p_newscoll` VALUES ('10', '38', '2019-05-24 00:27:40', '1', 'chengqixuan');
INSERT INTO `p_newscoll` VALUES ('11', '47', '2019-05-24 00:29:02', '1', 'chengqixuan');

-- ----------------------------
-- Table structure for `p_newsdis`
-- ----------------------------
DROP TABLE IF EXISTS `p_newsdis`;
CREATE TABLE `p_newsdis` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_content` varchar(255) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `u_username` varchar(255) DEFAULT NULL,
  `p_newsId` varchar(255) DEFAULT NULL,
  `d_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `up_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `p_newsdis_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `p_userinfo` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_newsdis
-- ----------------------------
INSERT INTO `p_newsdis` VALUES ('5', '湖南城市学院', '2', 'luozhe', '54', '2019-05-20 18:12:16', '/upload/2019/05/20/15583268040652361362020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('6', 'qqqq', '2', 'luozhe', '38', '2019-05-20 18:18:02', '/upload/2019/05/20/15583268040652361362020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('7', 'qq', '2', 'luozhe', '38', '2019-05-20 18:20:05', '/upload/2019/05/20/15583268040652361362020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('8', '总冠军', '1', 'chengqixuan', '38', '2019-05-20 18:36:49', '/upload/2019/05/20/15583485773425701906698.jpg');
INSERT INTO `p_newsdis` VALUES ('9', '湖人总冠军', '1', 'chengqixuan', '39', '2019-05-21 11:09:49', '/upload/2019/05/21/15584081386257945149020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('10', '勇士总冠军', '1', 'chengqixuan', '39', '2019-05-21 11:10:32', '/upload/2019/05/21/15584081386257945149020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('11', 'hahhahah ', '2', 'luozhe', '38', '2019-05-22 01:32:16', '/upload/2019/05/20/15583268040652361362020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('12', 'QQ', '2', 'luozhe', '38', '2019-05-22 02:59:32', '/upload/2019/05/20/15583268040652361362020190520114445.jpg');
INSERT INTO `p_newsdis` VALUES ('13', '真厉害啊', '1', 'chengqixuan', '38', '2019-05-24 00:28:20', '/upload/2019/05/21/15584081386257945149020190520114445.jpg');

-- ----------------------------
-- Table structure for `p_newsno`
-- ----------------------------
DROP TABLE IF EXISTS `p_newsno`;
CREATE TABLE `p_newsno` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT,
  `n_name` varchar(255) DEFAULT NULL,
  `n_content` varchar(255) DEFAULT NULL,
  `n_addTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_newsno
-- ----------------------------
INSERT INTO `p_newsno` VALUES ('1', 'hahhah ', '打篮球', '2019-05-15 21:10:44');
INSERT INTO `p_newsno` VALUES ('2', '湖南城市学院', '毕业', '2019-05-15 21:17:48');
INSERT INTO `p_newsno` VALUES ('3', '湖南城市学院', '毕业了啊', '2019-05-15 21:33:16');
INSERT INTO `p_newsno` VALUES ('4', '程琪萱', '程琪萱', '2019-05-16 14:59:06');

-- ----------------------------
-- Table structure for `p_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `p_userinfo`;
CREATE TABLE `p_userinfo` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_username` varchar(20) NOT NULL,
  `u_password` varchar(20) NOT NULL,
  `u_email` varchar(40) NOT NULL,
  `u_realName` varchar(255) DEFAULT NULL,
  `u_age` varchar(50) DEFAULT NULL,
  `u_sex` varchar(255) DEFAULT NULL,
  `u_freeze` int(4) NOT NULL DEFAULT '1',
  `u_reDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `u_username` (`u_username`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_userinfo
-- ----------------------------
INSERT INTO `p_userinfo` VALUES ('1', 'chengqixuan', 'kobe24', '1585992659@qq.com', '罗哲', '22', '男', '1', '2019-05-25 23:27:45');
INSERT INTO `p_userinfo` VALUES ('2', 'luozhe', 'cqx98726', '1585992659@qq.com', '罗哲', '22', '男', '1', '2019-05-25 23:29:02');
INSERT INTO `p_userinfo` VALUES ('3', 'jiarui', 'kobe24', '1585992659@qq.com', null, null, null, '0', '2019-05-13 21:05:20');
INSERT INTO `p_userinfo` VALUES ('17', '2015051514', '123456', '1585992659@qq.com', null, null, null, '1', '2019-05-13 21:05:27');
INSERT INTO `p_userinfo` VALUES ('18', '99999', 'kobe24', '1585992659@qq.com', null, null, null, '0', '2019-05-13 20:43:51');
INSERT INTO `p_userinfo` VALUES ('27', 'luocheng', 'kobe24', '1585992659@qq.com', null, null, null, '0', '2019-05-14 17:57:28');
INSERT INTO `p_userinfo` VALUES ('29', 'luozhe111', 'kobe24', '1585992659@qq.com', null, null, null, '1', '2019-05-13 23:11:23');
INSERT INTO `p_userinfo` VALUES ('30', 'chengqixuan123', 'kobe24', '1585992659@qq.com', null, null, null, '1', '2019-05-11 19:06:17');
INSERT INTO `p_userinfo` VALUES ('31', '201505', 'kobe24', '1585992659@qq.com', null, null, null, '1', '2019-05-11 19:11:50');
INSERT INTO `p_userinfo` VALUES ('32', '1585992659', 'kobe24', '1585992659@qq.com', null, null, null, '1', '2019-05-11 19:17:10');
INSERT INTO `p_userinfo` VALUES ('33', '2015051', 'kobe24', '1585992659@qq.com', null, null, null, '1', '2019-05-11 19:20:18');
INSERT INTO `p_userinfo` VALUES ('34', 'luozhuzhu', 'luozhuzhu', '123456@qq.com', null, null, null, '1', '2019-05-18 19:02:26');

-- ----------------------------
-- Table structure for `u_photo`
-- ----------------------------
DROP TABLE IF EXISTS `u_photo`;
CREATE TABLE `u_photo` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT,
  `up_name` varchar(255) DEFAULT NULL,
  `up_image` varchar(255) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `u_username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`up_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `u_photo_ibfk_1` FOREIGN KEY (`u_id`) REFERENCES `p_userinfo` (`u_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_photo
-- ----------------------------
INSERT INTO `u_photo` VALUES ('23', '98.jpg', '/upload/2019/05/20/15583267927537565012998.jpg', '2', 'luozhe');
INSERT INTO `u_photo` VALUES ('24', '20190520114445.jpg', '/upload/2019/05/20/15583268040652361362020190520114445.jpg', '2', 'luozhe');
INSERT INTO `u_photo` VALUES ('25', '20190520114445.jpg', '/upload/2019/05/20/15583320336911032925220190520114445.jpg', '1', 'chengqixuan');
INSERT INTO `u_photo` VALUES ('26', 'moren.png', '/upload/2019/05/20/155833212426454443337moren.png', '3', 'jiarui');
INSERT INTO `u_photo` VALUES ('27', '2.jpg', '/upload/2019/05/20/1558347194558599598242.jpg', '3', 'jiarui');
INSERT INTO `u_photo` VALUES ('28', '1.jpg', '/upload/2019/05/20/1558347206311382869171.jpg', '3', 'jiarui');
INSERT INTO `u_photo` VALUES ('29', '98.jpg', '/upload/2019/05/20/15583485773425701906698.jpg', '1', 'chengqixuan');
INSERT INTO `u_photo` VALUES ('30', '20190520114445.jpg', '/upload/2019/05/21/15584081386257945149020190520114445.jpg', '1', 'chengqixuan');
INSERT INTO `u_photo` VALUES ('31', '98.jpg', '/upload/2019/05/25/15587966569397927048298.jpg', '2', 'luozhe');
INSERT INTO `u_photo` VALUES ('32', '20190520114445.jpg', '/upload/2019/05/25/15587966735219580016920190520114445.jpg', '2', 'luozhe');
