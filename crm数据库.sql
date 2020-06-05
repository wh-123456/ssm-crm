/*
Navicat MySQL Data Transfer

Source Server         : helloworld
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : managementsystem

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2020-06-05 17:14:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c_dictionaries`
-- ----------------------------
DROP TABLE IF EXISTS `c_dictionaries`;
CREATE TABLE `c_dictionaries` (
  `id` varchar(11) character set utf8 default NULL,
  `name` varchar(255) character set utf8 default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of c_dictionaries
-- ----------------------------
INSERT INTO `c_dictionaries` VALUES ('003', '电话营销');
INSERT INTO `c_dictionaries` VALUES ('003', '网络营销');
INSERT INTO `c_dictionaries` VALUES ('003', '线下营销');
INSERT INTO `c_dictionaries` VALUES ('001', '电子商务');
INSERT INTO `c_dictionaries` VALUES ('001', '教育培训');
INSERT INTO `c_dictionaries` VALUES ('001', '建筑施工');
INSERT INTO `c_dictionaries` VALUES ('002', '普通用户');
INSERT INTO `c_dictionaries` VALUES ('002', '高级用户');
INSERT INTO `c_dictionaries` VALUES ('002', 'VIP用户');
INSERT INTO `c_dictionaries` VALUES ('001', '影视');
INSERT INTO `c_dictionaries` VALUES ('001', '土木工程建筑');
INSERT INTO `c_dictionaries` VALUES ('001', '日化产品制造');
INSERT INTO `c_dictionaries` VALUES ('001', '专用设备制造');
INSERT INTO `c_dictionaries` VALUES ('002', '黄金会员');
INSERT INTO `c_dictionaries` VALUES ('002', '钻石会员');
INSERT INTO `c_dictionaries` VALUES ('002', '铂金会员');
INSERT INTO `c_dictionaries` VALUES ('002', '至尊会员');
INSERT INTO `c_dictionaries` VALUES ('001', '所向披靡');
INSERT INTO `c_dictionaries` VALUES ('004', '公路运输');
INSERT INTO `c_dictionaries` VALUES ('004', '铁路运输');
INSERT INTO `c_dictionaries` VALUES ('004', '水路运输');
INSERT INTO `c_dictionaries` VALUES ('004', '空中运输');
INSERT INTO `c_dictionaries` VALUES ('004', '空中运输');
INSERT INTO `c_dictionaries` VALUES ('004', '火箭运输');

-- ----------------------------
-- Table structure for `client`
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `client_id` int(11) NOT NULL auto_increment,
  `client_for_short` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `linkman` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `deposit_bank` varchar(255) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES ('4', '华清远见3', '35165116', '张琳1', '15614516@163.com', '成都银行1');
INSERT INTO `client` VALUES ('5', '华清远见4', '35165116', '张琳1', '15614516@163.com', '成都银行1');
INSERT INTO `client` VALUES ('6', '华清远见5', '35165116', '张琳1', '15614516@163.com', '成都银行1');
INSERT INTO `client` VALUES ('7', '华清远见6', '35165116', '张琳1', '15614516@163.com', '成都银行1');
INSERT INTO `client` VALUES ('9', '达内', '5+56165', '小李', '1s561s65@46.684', '265414648584');
INSERT INTO `client` VALUES ('10', '胜多负少', '发生 ', '阿斯蒂芬是', ' 手动阀', ' 手动阀');
INSERT INTO `client` VALUES ('11', '尔特如果我', '沃尔沃他', '沃尔沃', '儿童剧而', '让他月');
INSERT INTO `client` VALUES ('12', '东方红个人', '个好的御魂', '规划局让他', '今天又', '好感度人');
INSERT INTO `client` VALUES ('13', '绕一圈额', '人头', '发件人田红', '投入也人工', '宽容与');
INSERT INTO `client` VALUES ('29', '华为', '65823584', '小赵', '14329929@qq.com', '工商银行');
INSERT INTO `client` VALUES ('30', '3', '13111111', '1', '14329929@qq.com', '33');
INSERT INTO `client` VALUES ('31', '111', '', '', '', '');
INSERT INTO `client` VALUES ('32', '怡莱', '12345679', '士大夫', '123@qq.com', '重庆交通银行');

-- ----------------------------
-- Table structure for `client_info`
-- ----------------------------
DROP TABLE IF EXISTS `client_info`;
CREATE TABLE `client_info` (
  `client_id` int(11) NOT NULL auto_increment,
  `client_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `postalcode` varchar(255) default NULL,
  `linkman_phone` varchar(255) default NULL,
  `facsimile` varchar(255) default NULL,
  `account` varchar(255) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of client_info
-- ----------------------------
INSERT INTO `client_info` VALUES ('3', '华清远见集团公司21', '四川大学旁11', '40540011', '564516851331', '54161644751647851', '564113513611231');
INSERT INTO `client_info` VALUES ('4', '华清远见集团公司3', '四川大学旁1', '4054001', '56451685133', '5416164475164785', '56411351361123');
INSERT INTO `client_info` VALUES ('5', '华清远见集团公司4', '四川大学旁1', '4054001', '56451685133', '5416164475164785', '56411351361123');
INSERT INTO `client_info` VALUES ('6', '华清远见集团公司5', '四川大学旁1', '4054001', '56451685133', '5416164475164785', '56411351361123');
INSERT INTO `client_info` VALUES ('7', '华清远见集团公司6', '四川大学旁1', '4054001', '56451685133', '5416164475164785', '56411351361123');
INSERT INTO `client_info` VALUES ('9', '达内教育集团', '天府三街', '451653', '163516516', '6165165', '321561621356');
INSERT INTO `client_info` VALUES ('10', '手动阀多舒服', '手动阀', '是的粉色', ' 胜多负少', '手动阀洒', '是否二维 ');
INSERT INTO `client_info` VALUES ('11', '沃尔沃维持', '绕弯儿未入围', '和大河', '认同和', '儿童交话费', '付光辉');
INSERT INTO `client_info` VALUES ('12', '从公司', '烦得很', '法国红酒', '色温', '富贵骄人', '苟富贵');
INSERT INTO `client_info` VALUES ('13', '东方精工吴蓉', '个卡特', '突然', '规范化的日', 'ukr6yu', '鱼人');
INSERT INTO `client_info` VALUES ('29', '华为集团', '成都', '405400', '52418858', '315', '1234567890');
INSERT INTO `client_info` VALUES ('30', '11', '11', '3', '3', '3', '11');
INSERT INTO `client_info` VALUES ('31', 'qq', '', '', '', '', '');
INSERT INTO `client_info` VALUES ('32', '怡莱公司', '到i时的那份', '306606', '65156123', '32156156', '');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `goods_id` int(11) NOT NULL auto_increment,
  `goods_name` varchar(255) default NULL,
  `production_place` varchar(255) default NULL,
  `unit` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `batch_number` varchar(255) default NULL,
  PRIMARY KEY  (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('16', '苹果手机', '苹果手机', '苹果手机', '苹果手机', '苹果手机');
INSERT INTO `goods` VALUES ('18', '华硕电脑', '美国', '台', '14寸大屏', '646984');
INSERT INTO `goods` VALUES ('19', '无线鼠标', '中国重庆开州', '个', '小', '1496854');
INSERT INTO `goods` VALUES ('23', '无线鼠标4', '中国重庆开州4', '个', '小', '14968545');
INSERT INTO `goods` VALUES ('26', '吉米投影仪', '成都吉米', '个', 'h1cc激光', '45245');
INSERT INTO `goods` VALUES ('27', '小米投影仪', '中国四川成都', '台', '正常', '265848');
INSERT INTO `goods` VALUES ('32', 'regae', 'rherh', 'sgaewr', 'rgaerhae', 'dhrear');
INSERT INTO `goods` VALUES ('33', 'dfsdh', 'sdhfg', 'sagc', 'hfdhg', 'dfjf');
INSERT INTO `goods` VALUES ('34', 'dsfhgw', 'erywe5y', 'ertwe', 'yue', 'tirt7');
INSERT INTO `goods` VALUES ('35', 'ert3q', 'ywer', 'trye', 'eryw', '434');
INSERT INTO `goods` VALUES ('36', 'werwe', 'eryer', 'ryertyer', '分公司任', '442758');
INSERT INTO `goods` VALUES ('37', '华为手机2', '中国四川绵阳', '台', '651485', '6518954');
INSERT INTO `goods` VALUES ('38', '222', '', '', '', '');
INSERT INTO `goods` VALUES ('39', '耳机', '开州', '个', '手动阀', '351465');
INSERT INTO `goods` VALUES ('40', '耳机', '开州', '个', '手动阀', '351465');
INSERT INTO `goods` VALUES ('41', '耳机', '开州', '个', '手动阀', '351465');
INSERT INTO `goods` VALUES ('42', '耳机', '开州', '个', '手动阀', '351465');
INSERT INTO `goods` VALUES ('43', '耳机', '开州', '个', '手动阀', '351465');
INSERT INTO `goods` VALUES ('44', '键盘', '湖南', '个', '都是', '21532123');

-- ----------------------------
-- Table structure for `goods_info`
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `goods_id` int(11) NOT NULL auto_increment,
  `goods_nickname` varchar(255) default NULL,
  `pack` varchar(255) default NULL,
  `approval_number` varchar(11) default NULL,
  `provider` varchar(255) default NULL,
  `category` varchar(255) default NULL,
  `price` decimal(10,2) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('16', '苹果手机', '苹果手机', '苹果手机', '苹果手机', '手机', '10000.00', '页面测试数据2');
INSERT INTO `goods_info` VALUES ('18', 'computer', '精装', '6165161', '华硕集团公司', '电脑', '6333.00', '是是是');
INSERT INTO `goods_info` VALUES ('19', '鼠标', '简装', '148465', '中国制造总商', '配件', '18.00', '插入数据');
INSERT INTO `goods_info` VALUES ('23', '鼠标4', '简装', '1484656', '中国制造总商', '配件', '22.00', '插入数据');
INSERT INTO `goods_info` VALUES ('26', '投影仪', '精装', '61651', '小米集团', '投影仪', '12.00', '吉米');
INSERT INTO `goods_info` VALUES ('27', '投影仪', '精装', '15454', '宏福锦精密电子（成都）有限公司', '投影仪', '3000.00', '吉米投影仪');
INSERT INTO `goods_info` VALUES ('32', 'sdfgas', 'dfhbe', 'rherh', '', '配件', '100.00', 'erherw');
INSERT INTO `goods_info` VALUES ('33', 'sfdgasg', 'vgn', 'fghdj', '', '配件', '3000.00', 'jtyy');
INSERT INTO `goods_info` VALUES ('34', 'yey', 'tryey', 'dsrtw', '', '配件', '300.00', 'tru45');
INSERT INTO `goods_info` VALUES ('35', 'ewyer', 'ertyrt', 'rtet', '', '配件', '6000.00', 'rtyety');
INSERT INTO `goods_info` VALUES ('36', 'rtey', 'tye', 'ertye', '', '配件', '200.00', 'rtyrt');
INSERT INTO `goods_info` VALUES ('37', '手机', '164189', '3165165', '', '配件', '3000.00', '是是是');
INSERT INTO `goods_info` VALUES ('38', '222', '', '', '', '配件', null, '');
INSERT INTO `goods_info` VALUES ('39', '耳机', '得到', '1645154', '', '配件', '60.00', '撒旦法');
INSERT INTO `goods_info` VALUES ('40', '耳机', '得到', '1645154', '', '配件', '60.00', '撒旦法');
INSERT INTO `goods_info` VALUES ('41', '耳机', '得到', '1645154', '', '配件', '60.00', '撒旦法');
INSERT INTO `goods_info` VALUES ('42', '耳机', '得到', '1645154', '', '配件', '60.00', '撒旦法');
INSERT INTO `goods_info` VALUES ('43', '耳机', '得到', '1645154', '', '配件', '60.00', '撒旦法');
INSERT INTO `goods_info` VALUES ('44', '键盘', '啊啊发', '165465', '', '配件', '30.00', 'sss');

-- ----------------------------
-- Table structure for `m_customer`
-- ----------------------------
DROP TABLE IF EXISTS `m_customer`;
CREATE TABLE `m_customer` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 default NULL,
  `source` varchar(255) character set utf8 default NULL,
  `industry` varchar(255) character set utf8 default NULL,
  `level` varchar(255) character set utf8 default NULL,
  `phone` varchar(255) character set utf8 default NULL,
  `tell_phone` varchar(255) character set utf8 default NULL,
  `email` varchar(255) character set utf8 default NULL,
  `address` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_customer
-- ----------------------------
INSERT INTO `m_customer` VALUES ('1', '酒吞童子', '电话营销', '教育培训', '高级用户', '52854583', '5558851488', '4858885@qq.com', '中国重庆市开州区开州大道一段东站');
INSERT INTO `m_customer` VALUES ('2', '雪童子', '电话营销', '教育培训', '普通用户', '52854583', '5558851488', '嗯嗯嗯', '嗯嗯嗯');
INSERT INTO `m_customer` VALUES ('3', '饿鬼', '电话营销', '电子商务', '高级用户', '52854583', '5558851488', '148878558@qq.com', '中国重庆');
INSERT INTO `m_customer` VALUES ('4', '妖刀姬', '电话营销', '教育培训', '普通用户', '52854583', '5558851488', '148878558@qq.com', '中国重庆');
INSERT INTO `m_customer` VALUES ('6', '赵大龙', '线下营销', '建筑施工', 'VIP用户', '52854583', '5558851488', '482819@163.com', '四川绵阳');
INSERT INTO `m_customer` VALUES ('15', '小小黑', '电话营销', '电子商务', 'VIP用户', '6498494', '6514984651654', '711989641@169.com', '中国四川省绵阳市梓童县石牛镇');
INSERT INTO `m_customer` VALUES ('16', '鬼使黑', '电话营销', '教育培训', 'VIP用户', '58226555', '5156156', '圣诞节佛阿文', '是大范围');
INSERT INTO `m_customer` VALUES ('17', '鬼使白', '电话营销', '电子商务', '高级用户', '161649845', '153641651584', '32sd26+6', 'sdfa64we');
INSERT INTO `m_customer` VALUES ('18', '阎魔', '网络营销', '电子商务', '高级用户', '168486584', '649854164', 'sdfa3we1', 'sdf6awe1r');
INSERT INTO `m_customer` VALUES ('19', '大天狗', '电话营销', '电子商务', '普通用户', '1684865841', '154165489654', '达维尔瓦尔', '输入法为');
INSERT INTO `m_customer` VALUES ('21', '不知火', '网络营销', '建筑施工', '普通用户', '51584181', '15415454', '14329929@qq.com', '中国领事馆');
INSERT INTO `m_customer` VALUES ('22', '鬼切', '线下营销', '教育培训', 'VIP用户', '88888888', '666666666666', '111111', '22222');
INSERT INTO `m_customer` VALUES ('23', '大岳丸', '网络营销', '建筑施工', 'VIP用户', '8888', '9999', '7777', '77777');
INSERT INTO `m_customer` VALUES ('24', 'ww', '网络营销', '电子商务', '普通用户', 'ww', 'ww', 'ww', 'ww');
INSERT INTO `m_customer` VALUES ('26', '333', '电话营销', '教育培训', '普通用户', '3', '3', '3', '3');
INSERT INTO `m_customer` VALUES ('27', 't', '电话营销', '建筑施工', '高级用户', 't', 't', 't', 't');
INSERT INTO `m_customer` VALUES ('28', '天邪鬼青', '网络营销', '建筑施工', '高级用户', '585888', '35555', '251641651', '51651');
INSERT INTO `m_customer` VALUES ('29', '天邪鬼黄', '网络营销', '电子商务', 'VIP用户', '58558855', '515616', '265416', '321561');
INSERT INTO `m_customer` VALUES ('30', '222', '电话营销', '教育培训', 'VIP用户', '2', '2', '2', '2');
INSERT INTO `m_customer` VALUES ('31', '天邪鬼绿', '线下营销', '建筑施工', '高级用户', '8588855', '32324234', '234', '2342342342');
INSERT INTO `m_customer` VALUES ('32', '玉藻前', '电话营销', '电子商务', '普通用户', '555555', '222', '333', '44');
INSERT INTO `m_customer` VALUES ('33', '白藏主', '电话营销', '电子商务', '普通用户', '4453', '34534', '3453', '3453');
INSERT INTO `m_customer` VALUES ('34', '追月神', '电话营销', '电子商务', '普通用户', '222', '22', '222', '3445');
INSERT INTO `m_customer` VALUES ('35', '彼岸花', '网络营销', '建筑施工', '普通用户', '222', '23', '2其实', '发文夫人');
INSERT INTO `m_customer` VALUES ('36', '茨木童子', '网络营销', '影视', '黄金会员', '525882', '666666', '88258', '66999669');
INSERT INTO `m_customer` VALUES ('37', '炼狱茨木童子', '网络营销', '日化产品制造', '黄金会员', '52865424', '13930652858', '636396558@qq.com', '美国阿拉斯加州');
INSERT INTO `m_customer` VALUES ('38', '鬼王酒吞童子', '网络营销', '专用设备制造', '钻石会员', '5858588', '154164', '35165487@163.com', '中国湖北省');
INSERT INTO `m_customer` VALUES ('39', '涂壁', '网络营销', '建筑施工', '至尊会员', '52865429', '15823499996', '1468245@136.com', '中国香港行政自治区');
INSERT INTO `m_customer` VALUES ('40', '欧阳天下', '网络营销', '土木工程建筑', 'VIP用户', '15934893999', '132434998989', '49893849', '中国上海');

-- ----------------------------
-- Table structure for `m_role`
-- ----------------------------
DROP TABLE IF EXISTS `m_role`;
CREATE TABLE `m_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(255) character set utf8 default NULL,
  `name` varchar(255) character set utf8 default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_role
-- ----------------------------
INSERT INTO `m_role` VALUES ('1', 'root', '超级管理员', '2019-12-28 09:19:13');
INSERT INTO `m_role` VALUES ('3', 'CEO', '公司管理人员', '2019-12-18 09:31:21');
INSERT INTO `m_role` VALUES ('4', 'generalManager', '总经理', '2019-12-15 14:02:14');
INSERT INTO `m_role` VALUES ('24', 'departmentManager', '部门经理', '2019-12-15 17:14:42');
INSERT INTO `m_role` VALUES ('25', 'staff', '职员', '2019-12-17 14:15:57');
INSERT INTO `m_role` VALUES ('27', 'trainee', '实习生', '2019-12-17 14:19:10');
INSERT INTO `m_role` VALUES ('28', 'trialStudent', '试用生', '2019-12-19 09:14:41');
INSERT INTO `m_role` VALUES ('32', 'staff2', '游客4', '2019-12-17 18:08:53');
INSERT INTO `m_role` VALUES ('33', 'visiter555', '游客555', '2019-12-17 20:19:05');
INSERT INTO `m_role` VALUES ('36', 'staf', '员工', '2019-12-18 09:14:44');
INSERT INTO `m_role` VALUES ('40', 'staff3', '职员2号', '2019-12-18 09:17:25');
INSERT INTO `m_role` VALUES ('41', 'staff555', '游客555', '2019-12-18 20:20:06');
INSERT INTO `m_role` VALUES ('42', 'staff666', '游客666', '2019-12-18 09:27:02');
INSERT INTO `m_role` VALUES ('43', '打酱油的1', '刘备', '2019-12-18 09:32:27');
INSERT INTO `m_role` VALUES ('44', '打酱油的2', '张飞', '2019-12-18 10:49:04');
INSERT INTO `m_role` VALUES ('47', '打酱油的3', '测试角色1号', '2019-12-18 10:53:44');
INSERT INTO `m_role` VALUES ('56', '打酱油的4', '貂蝉', '2019-12-18 20:21:32');
INSERT INTO `m_role` VALUES ('58', 'teacher', '老师', '2019-12-19 10:23:15');
INSERT INTO `m_role` VALUES ('62', 'admin', '超级管理员2', '2019-12-20 16:05:05');
INSERT INTO `m_role` VALUES ('63', 'manage', '管理员2', '2019-12-20 16:30:09');

-- ----------------------------
-- Table structure for `m_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `m_role_permission`;
CREATE TABLE `m_role_permission` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_role_permission
-- ----------------------------
INSERT INTO `m_role_permission` VALUES ('7', '24', '1');
INSERT INTO `m_role_permission` VALUES ('8', '24', '2');
INSERT INTO `m_role_permission` VALUES ('9', '24', '3');
INSERT INTO `m_role_permission` VALUES ('10', '25', '4');
INSERT INTO `m_role_permission` VALUES ('11', '25', '1');
INSERT INTO `m_role_permission` VALUES ('12', '25', '2');
INSERT INTO `m_role_permission` VALUES ('13', '25', '3');
INSERT INTO `m_role_permission` VALUES ('18', '27', '4');
INSERT INTO `m_role_permission` VALUES ('19', '27', '1');
INSERT INTO `m_role_permission` VALUES ('20', '27', '2');
INSERT INTO `m_role_permission` VALUES ('21', '27', '3');
INSERT INTO `m_role_permission` VALUES ('22', '24', '4');
INSERT INTO `m_role_permission` VALUES ('35', '32', '17');
INSERT INTO `m_role_permission` VALUES ('36', '32', '16');
INSERT INTO `m_role_permission` VALUES ('37', '32', '18');
INSERT INTO `m_role_permission` VALUES ('47', '33', '4');
INSERT INTO `m_role_permission` VALUES ('48', '33', '1');
INSERT INTO `m_role_permission` VALUES ('49', '33', '2');
INSERT INTO `m_role_permission` VALUES ('50', '33', '3');
INSERT INTO `m_role_permission` VALUES ('51', '42', '9');
INSERT INTO `m_role_permission` VALUES ('52', '42', '5');
INSERT INTO `m_role_permission` VALUES ('61', '3', '4');
INSERT INTO `m_role_permission` VALUES ('62', '3', '1');
INSERT INTO `m_role_permission` VALUES ('63', '3', '2');
INSERT INTO `m_role_permission` VALUES ('64', '3', '3');
INSERT INTO `m_role_permission` VALUES ('65', '43', '4');
INSERT INTO `m_role_permission` VALUES ('66', '43', '1');
INSERT INTO `m_role_permission` VALUES ('67', '43', '2');
INSERT INTO `m_role_permission` VALUES ('68', '43', '3');
INSERT INTO `m_role_permission` VALUES ('69', '43', '9');
INSERT INTO `m_role_permission` VALUES ('70', '43', '5');
INSERT INTO `m_role_permission` VALUES ('71', '43', '6');
INSERT INTO `m_role_permission` VALUES ('72', '43', '7');
INSERT INTO `m_role_permission` VALUES ('73', '43', '8');
INSERT INTO `m_role_permission` VALUES ('74', '44', '4');
INSERT INTO `m_role_permission` VALUES ('75', '44', '1');
INSERT INTO `m_role_permission` VALUES ('76', '44', '2');
INSERT INTO `m_role_permission` VALUES ('77', '44', '3');
INSERT INTO `m_role_permission` VALUES ('78', '45', '16');
INSERT INTO `m_role_permission` VALUES ('87', '41', '4');
INSERT INTO `m_role_permission` VALUES ('88', '41', '1');
INSERT INTO `m_role_permission` VALUES ('89', '41', '2');
INSERT INTO `m_role_permission` VALUES ('90', '41', '3');
INSERT INTO `m_role_permission` VALUES ('91', '41', '16');
INSERT INTO `m_role_permission` VALUES ('97', '58', '9');
INSERT INTO `m_role_permission` VALUES ('98', '58', '5');
INSERT INTO `m_role_permission` VALUES ('99', '58', '6');
INSERT INTO `m_role_permission` VALUES ('100', '58', '7');
INSERT INTO `m_role_permission` VALUES ('101', '58', '8');
INSERT INTO `m_role_permission` VALUES ('102', '58', '16');
INSERT INTO `m_role_permission` VALUES ('103', '58', '18');
INSERT INTO `m_role_permission` VALUES ('112', '62', '1');
INSERT INTO `m_role_permission` VALUES ('113', '62', '2');
INSERT INTO `m_role_permission` VALUES ('114', '62', '3');
INSERT INTO `m_role_permission` VALUES ('115', '62', '4');
INSERT INTO `m_role_permission` VALUES ('116', '62', '5');
INSERT INTO `m_role_permission` VALUES ('117', '62', '6');
INSERT INTO `m_role_permission` VALUES ('118', '62', '7');
INSERT INTO `m_role_permission` VALUES ('119', '62', '8');
INSERT INTO `m_role_permission` VALUES ('120', '62', '9');
INSERT INTO `m_role_permission` VALUES ('121', '62', '10');
INSERT INTO `m_role_permission` VALUES ('122', '62', '11');
INSERT INTO `m_role_permission` VALUES ('123', '62', '12');
INSERT INTO `m_role_permission` VALUES ('124', '62', '13');
INSERT INTO `m_role_permission` VALUES ('125', '63', '1');
INSERT INTO `m_role_permission` VALUES ('126', '63', '2');
INSERT INTO `m_role_permission` VALUES ('127', '63', '4');
INSERT INTO `m_role_permission` VALUES ('128', '63', '5');
INSERT INTO `m_role_permission` VALUES ('129', '63', '6');
INSERT INTO `m_role_permission` VALUES ('130', '1', '1');
INSERT INTO `m_role_permission` VALUES ('131', '1', '2');
INSERT INTO `m_role_permission` VALUES ('132', '1', '4');
INSERT INTO `m_role_permission` VALUES ('133', '1', '5');
INSERT INTO `m_role_permission` VALUES ('134', '1', '6');
INSERT INTO `m_role_permission` VALUES ('135', '1', '3');
INSERT INTO `m_role_permission` VALUES ('136', '1', '7');
INSERT INTO `m_role_permission` VALUES ('137', '1', '8');
INSERT INTO `m_role_permission` VALUES ('138', '1', '9');
INSERT INTO `m_role_permission` VALUES ('139', '1', '10');
INSERT INTO `m_role_permission` VALUES ('140', '1', '11');
INSERT INTO `m_role_permission` VALUES ('141', '1', '12');
INSERT INTO `m_role_permission` VALUES ('142', '1', '13');

-- ----------------------------
-- Table structure for `m_user`
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(255) character set utf8 default NULL,
  `password` varchar(255) character set utf8 default NULL,
  `create_time` datetime default NULL,
  `account` varchar(255) character set utf8 default NULL,
  `locked` tinyint(4) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES ('1', 'admin', '111', '2019-12-15 10:33:42', '超级管理员', null);
INSERT INTO `m_user` VALUES ('2', 'zdl', '111', '2019-12-19 09:41:49', '赵大龙', '1');
INSERT INTO `m_user` VALUES ('3', 'zdx', '2555', '2019-12-19 10:41:59', '张大仙', null);
INSERT INTO `m_user` VALUES ('4', 'my', '111', '2019-12-20 19:34:21', '访客', null);
INSERT INTO `m_user` VALUES ('5', 'yxj', '111', '2019-12-17 09:41:44', '杨小军', null);
INSERT INTO `m_user` VALUES ('6', 'zp', '111', '2019-12-18 09:41:34', '赵鹏', null);
INSERT INTO `m_user` VALUES ('7', '斋藤飞鸟', '111', '2019-12-19 09:41:38', '是我老婆', null);
INSERT INTO `m_user` VALUES ('8', 'jake', 'jake', '2019-12-21 09:36:40', '杰克', null);
INSERT INTO `m_user` VALUES ('9', 'hws', '111', '2019-12-27 21:02:55', '黄文双', null);
INSERT INTO `m_user` VALUES ('10', 'zdz', '111', '2019-12-27 21:02:57', '赵丹钊', null);
INSERT INTO `m_user` VALUES ('11', '1424975892', '111', '2019-12-27 21:03:00', 'purchaser1', null);
INSERT INTO `m_user` VALUES ('12', 'wh', '111', '2019-12-27 21:03:03', '王欢', null);
INSERT INTO `m_user` VALUES ('13', 'mcb', '15', '2019-12-27 21:03:06', '马崇滨', null);
INSERT INTO `m_user` VALUES ('14', 'yangke', '111', '2019-12-27 21:03:08', '杨科', null);
INSERT INTO `m_user` VALUES ('15', 'wch', '111', '2019-12-27 21:05:16', '吴春', '1');
INSERT INTO `m_user` VALUES ('16', 'cy', '111', '2019-12-27 21:05:49', '曹源', '1');
INSERT INTO `m_user` VALUES ('17', 'why', '111', '2019-12-27 21:06:24', '王红艳', null);
INSERT INTO `m_user` VALUES ('18', 'cmq', '111', '2019-12-27 21:06:38', '陈明强', null);
INSERT INTO `m_user` VALUES ('19', 'yw', '111', '2019-12-27 21:07:18', '杨文', null);
INSERT INTO `m_user` VALUES ('21', 'admin', null, null, '超级管理员', null);
INSERT INTO `m_user` VALUES ('22', 'admin', null, null, '超级管理员', null);

-- ----------------------------
-- Table structure for `m_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `m_user_role`;
CREATE TABLE `m_user_role` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of m_user_role
-- ----------------------------
INSERT INTO `m_user_role` VALUES ('1', '1', '1');
INSERT INTO `m_user_role` VALUES ('2', '11', '62');
INSERT INTO `m_user_role` VALUES ('3', '15', '22');
INSERT INTO `m_user_role` VALUES ('4', '40', '24');
INSERT INTO `m_user_role` VALUES ('5', '41', '3');
INSERT INTO `m_user_role` VALUES ('6', '42', '3');
INSERT INTO `m_user_role` VALUES ('7', '43', '3');
INSERT INTO `m_user_role` VALUES ('8', '44', '3');
INSERT INTO `m_user_role` VALUES ('9', '45', '3');
INSERT INTO `m_user_role` VALUES ('10', '46', '3');
INSERT INTO `m_user_role` VALUES ('11', '47', '3');
INSERT INTO `m_user_role` VALUES ('12', '96', '3');
INSERT INTO `m_user_role` VALUES ('13', '97', '1');
INSERT INTO `m_user_role` VALUES ('14', '98', '3');
INSERT INTO `m_user_role` VALUES ('15', '100', '1');
INSERT INTO `m_user_role` VALUES ('16', '101', '3');
INSERT INTO `m_user_role` VALUES ('17', '102', '3');
INSERT INTO `m_user_role` VALUES ('18', '103', '1');
INSERT INTO `m_user_role` VALUES ('19', '104', '1');
INSERT INTO `m_user_role` VALUES ('20', '106', '1');
INSERT INTO `m_user_role` VALUES ('21', '107', '1');
INSERT INTO `m_user_role` VALUES ('22', '108', '1');
INSERT INTO `m_user_role` VALUES ('23', '109', '3');
INSERT INTO `m_user_role` VALUES ('24', '111', '1');
INSERT INTO `m_user_role` VALUES ('25', '112', '1');
INSERT INTO `m_user_role` VALUES ('26', '116', '63');
INSERT INTO `m_user_role` VALUES ('27', '115', '1');
INSERT INTO `m_user_role` VALUES ('28', '117', '3');
INSERT INTO `m_user_role` VALUES ('29', '118', '1');
INSERT INTO `m_user_role` VALUES ('30', '119', '1');
INSERT INTO `m_user_role` VALUES ('31', '120', '1');
INSERT INTO `m_user_role` VALUES ('32', '123', '1');
INSERT INTO `m_user_role` VALUES ('33', '124', '1');
INSERT INTO `m_user_role` VALUES ('34', '125', '25');
INSERT INTO `m_user_role` VALUES ('35', '126', '58');
INSERT INTO `m_user_role` VALUES ('36', '127', '58');
INSERT INTO `m_user_role` VALUES ('37', '128', '33');
INSERT INTO `m_user_role` VALUES ('38', '20', '62');
INSERT INTO `m_user_role` VALUES ('39', '21', '36');
INSERT INTO `m_user_role` VALUES ('40', '22', '1');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` varchar(255) NOT NULL COMMENT '订单编号，时间戳拼接而成',
  `order_customer` varchar(255) default NULL,
  `product_name` varchar(255) default NULL,
  `order_number` int(11) default NULL,
  `status` varchar(255) default '0' COMMENT '0表示未发货',
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('ORD1577331148259', '华清远见集团公司1', '华硕电脑', '12', '0');
INSERT INTO `order` VALUES ('ORD1577331419802', '达内教育集团', '苹果手机', '12', '0');
INSERT INTO `order` VALUES ('ORD1577338249496', '华为集团', '蓝光笔记本', '1212', '0');
INSERT INTO `order` VALUES ('ORD1577338327637', '达内教育集团', '插座', '1212', '0');
INSERT INTO `order` VALUES ('ORD1577338782751', '从公司', '苹果手机', '12', '1');
INSERT INTO `order` VALUES ('ORD1577338853380', '华清远见集团公司4', '华硕电脑', '12', '0');
INSERT INTO `order` VALUES ('ORD1577338974666', '华清远见集团公司21', '华硕电脑', '12', '0');
INSERT INTO `order` VALUES ('ORD1577424114394', '华清远见集团公司4', '无线鼠标', '11', '1');
INSERT INTO `order` VALUES ('ORD1577496072910', '华清远见集团公司3', '苹果手机', '12', '1');
INSERT INTO `order` VALUES ('ORD1577496089204', '华清远见集团公司4', '华硕电脑', '1212', '0');
INSERT INTO `order` VALUES ('ORD1577496901982', '华清远见集团公司3', '苹果手机', '12', '0');

-- ----------------------------
-- Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `order_id` varchar(255) NOT NULL,
  `order_date` datetime default NULL,
  `order_money` decimal(10,0) default NULL,
  `delivery_way` varchar(255) default NULL,
  `delivery_date` datetime default NULL,
  `handler_name` varchar(255) default NULL,
  `operator` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_info
-- ----------------------------
INSERT INTO `order_info` VALUES ('ORD1577331419802', '2019-12-26 11:37:11', '45', '公路运输', '2019-12-26 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577338249496', '2019-12-26 01:30:56', '45', '空中运输', '2019-12-27 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577338327637', '2019-12-26 01:32:15', '45', '空中运输', '2019-12-27 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577338782751', '2019-12-27 01:39:48', '45', '公路运输', '2019-12-28 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577338853380', '2019-12-26 01:41:15', '78', '公路运输', '2019-12-26 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577338974666', '2019-12-26 01:42:58', '4545', '水路运输', '2019-12-28 00:00:00', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577424114394', '2019-12-27 01:21:19', '11', '铁路运输', '2019-12-27 00:00:00', '1122', '11', '11');
INSERT INTO `order_info` VALUES ('ORD1577496072910', '2019-12-28 09:21:19', '45', '铁路运输', '2019-12-28 09:21:23', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577496089204', '2019-12-28 09:22:52', '45', '铁路运输', '2019-12-10 09:21:23', '阿斯蒂芬', '水电费', '');
INSERT INTO `order_info` VALUES ('ORD1577496901982', '2019-12-28 09:35:05', '45', '水路运输', '2019-12-28 09:35:09', '阿斯蒂芬', '水电费', '');

-- ----------------------------
-- Table structure for `p_regist`
-- ----------------------------
DROP TABLE IF EXISTS `p_regist`;
CREATE TABLE `p_regist` (
  `production_id` varchar(255) NOT NULL,
  `product_name` varchar(255) default NULL,
  `produce_number` int(11) default NULL,
  `produce_date` datetime default NULL,
  `status` varchar(255) default '0',
  `storage_date` datetime default NULL,
  `hander_name` varchar(255) default NULL,
  `operator` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`production_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_regist
-- ----------------------------
INSERT INTO `p_regist` VALUES ('13165165', '苹果手机', '100', '2019-12-27 05:24:20', null, '2019-12-27 05:04:21', 'zdl', 'zdl', 'ddd');
INSERT INTO `p_regist` VALUES ('20191211686', '华硕电脑', '10', '2019-12-22 21:31:45', '待入库', '2019-12-22 21:31:50', '酒吞童子', '茨木童子', '插入测试');
INSERT INTO `p_regist` VALUES ('20191211687', '苹果电脑', '10', '2019-12-22 22:57:24', '待入库', '2019-12-22 22:57:19', '酒吞童子', '茨木童子', '插入测试1');
INSERT INTO `p_regist` VALUES ('20191211688', '电脑', '10', '2019-12-22 22:56:45', '待入库', '2019-12-22 22:57:17', '酒吞童子', '茨木童子', '插入测试142');
INSERT INTO `p_regist` VALUES ('20191211689', '电脑1', '100', '2019-12-22 22:56:50', '待入库', '2019-12-22 22:57:07', '酒吞童子', '茨木童子', '插入测试142');
INSERT INTO `p_regist` VALUES ('20191211690', '笔记本1', '100', '2019-12-22 22:57:27', '待入库', '2019-12-22 22:57:10', '酒吞童子', '茨木童子', '修改测试');
INSERT INTO `p_regist` VALUES ('20191211691', '笔记本', '10', '2019-12-22 21:31:45', '待入库', '2019-12-22 22:57:13', '酒吞童子', '茨木童子', '插入测试14');
INSERT INTO `p_regist` VALUES ('341654165', '插座', '20', '2019-12-27 05:29:38', null, '2019-12-27 05:04:21', 'zdl', 'zdl', 'zz');
INSERT INTO `p_regist` VALUES ('R1577496117931', '苹果手机', '10', '2019-12-28 09:22:27', null, '2019-12-28 09:22:29', 'zdl', '赵大龙', 'zz');

-- ----------------------------
-- Table structure for `p_sell`
-- ----------------------------
DROP TABLE IF EXISTS `p_sell`;
CREATE TABLE `p_sell` (
  `sell_id` varchar(255) NOT NULL,
  `product_name` varchar(255) default NULL,
  `customer_name` varchar(255) default NULL,
  `sell_number` int(11) default NULL,
  `sell_date` datetime default NULL,
  `sell_status` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_sell
-- ----------------------------

-- ----------------------------
-- Table structure for `p_sell_info`
-- ----------------------------
DROP TABLE IF EXISTS `p_sell_info`;
CREATE TABLE `p_sell_info` (
  `sell_id` varchar(255) NOT NULL,
  `order_id` varchar(255) default NULL,
  `total_money` decimal(10,0) default NULL,
  `settlement_way` varchar(255) default NULL,
  `handler_name` varchar(255) default NULL,
  `operator` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`sell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_sell_info
-- ----------------------------

-- ----------------------------
-- Table structure for `p_stock`
-- ----------------------------
DROP TABLE IF EXISTS `p_stock`;
CREATE TABLE `p_stock` (
  `inbill_id` varchar(11) NOT NULL,
  `product_name` varchar(255) default NULL,
  `production_place` varchar(255) default NULL,
  `repertory_number` int(11) default NULL,
  `operator` varchar(255) default NULL,
  PRIMARY KEY  (`inbill_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_stock
-- ----------------------------
INSERT INTO `p_stock` VALUES ('10001', '空调', '奥克斯', '500', '刘备');
INSERT INTO `p_stock` VALUES ('10002', '冰箱', '格力', '350', '曹操');
INSERT INTO `p_stock` VALUES ('10003', '电脑', '华硕', '600', '孙权');
INSERT INTO `p_stock` VALUES ('10004', '电视机', '国美', '850', '袁绍');
INSERT INTO `p_stock` VALUES ('10005', '电视机', '长虹', '650', '张角');
INSERT INTO `p_stock` VALUES ('10006', '空调', '美的', '650', '董卓');
INSERT INTO `p_stock` VALUES ('10007', '电脑·', '联想', '420', '孟获');

-- ----------------------------
-- Table structure for `p_stock_info`
-- ----------------------------
DROP TABLE IF EXISTS `p_stock_info`;
CREATE TABLE `p_stock_info` (
  `inbill_id` varchar(255) default NULL,
  `order_id` varchar(255) NOT NULL,
  `production_id` varchar(255) default NULL,
  `inbill_number` int(255) default NULL,
  `inbill_date` datetime default NULL,
  `handler_name` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_stock_info
-- ----------------------------
INSERT INTO `p_stock_info` VALUES ('10001', '155655425', '2018.12.25SH', '250', '2019-12-03 15:18:37', '关羽', '订单二');
INSERT INTO `p_stock_info` VALUES ('10001', '156459554', '2019.12.28LZ', '350', '2019-12-10 10:23:43', '马超', '订单四');
INSERT INTO `p_stock_info` VALUES ('10004', '156466187', '2016.06.25SHZ', '205', '2019-12-10 18:24:55', '文丑', '订单二');
INSERT INTO `p_stock_info` VALUES ('10001', '156468148', '2017.03.28NJ', '320', '2019-12-03 15:24:39', '赵云', '订单五');
INSERT INTO `p_stock_info` VALUES ('10004', '156468464', '2019.05.30BJ', '300', '2019-12-03 10:15:25', '颜良', '订单一');
INSERT INTO `p_stock_info` VALUES ('10002', '160002652', '2019.12.30HEB', '150', '2019-08-21 19:24:25', '典韦', '订单二');
INSERT INTO `p_stock_info` VALUES ('10002', '160255666', '2016.05.12JY', '200', '2013-10-23 19:23:10', '司马懿', '订单一');
INSERT INTO `p_stock_info` VALUES ('10001', '192543125', '2019.02.15CD', '100', '2019-12-02 19:17:39', '张飞', '订单一');
INSERT INTO `p_stock_info` VALUES ('10001', '198568656', '2019.11.20BJ', '150', '2019-11-12 15:19:34', '诸葛亮', '订单三');
INSERT INTO `p_stock_info` VALUES ('10003', '201646413', '2016.12.22NJ', '400', '2019-08-12 19:20:49', '周瑜', '订单一');
INSERT INTO `p_stock_info` VALUES ('10003', '204674144', '2017.12.05SZ', '200', '2020-02-12 15:22:01', '黄盖', '订单二');
INSERT INTO `p_stock_info` VALUES ('10006', '456445645', '2019.06.145SHH', '150', '2019-12-19 10:31:09', '貂蝉', '订单二');
INSERT INTO `p_stock_info` VALUES ('10006', '459446849', '2018.03.15NJ', '300', '2019-12-03 23:15:23', '吕布', '订单一');
INSERT INTO `p_stock_info` VALUES ('10007', '466446564', '2019.15.31CD', '120', '2019-12-03 10:25:01', '祝融', '订单一');
INSERT INTO `p_stock_info` VALUES ('10005', '468947864', '2019.26.28BJ', '300', '2019-12-17 10:29:45', '雷公', '订单一');
INSERT INTO `p_stock_info` VALUES ('10001', '564661645', '2019.09.24SHH', '250', '2019-12-17 18:25:32', '黄忠', '订单六');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL auto_increment,
  `p_id` int(11) NOT NULL default '0',
  `name` varchar(255) character set utf8 NOT NULL default '',
  `url` varchar(255) character set utf8 default '',
  `percode` varchar(255) character set utf8 default '',
  `create_time` datetime default NULL,
  PRIMARY KEY  (`permission_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '-1', '菜单', '', 'menu1', '2019-12-19 16:40:02');
INSERT INTO `permission` VALUES ('2', '1', '系统管理', ' ', 'menu2', '2019-12-20 10:01:28');
INSERT INTO `permission` VALUES ('3', '1', '事务管理', ' ', 'menu2', '2019-12-18 10:57:32');
INSERT INTO `permission` VALUES ('4', '2', '用户管理', '/system/userList', 'userList', '2019-12-20 11:22:37');
INSERT INTO `permission` VALUES ('5', '2', '角色管理', '/system/toRoleList', 'roleList', '2019-12-20 11:26:11');
INSERT INTO `permission` VALUES ('6', '2', '权限管理', '/system/permissionList', 'permissionList', '2019-12-20 16:10:37');
INSERT INTO `permission` VALUES ('7', '3', '客户管理', '/customer/list', 'customerList', '2019-12-20 16:11:17');
INSERT INTO `permission` VALUES ('8', '7', '编辑客户', '/customer/edit', 'customerEdit', '2019-12-20 16:12:07');
INSERT INTO `permission` VALUES ('9', '7', '删除客户', '/customer/delete', 'customerDelete', '2019-12-20 16:12:46');
INSERT INTO `permission` VALUES ('10', '7', '批量删除客户', '/customer/deleteMany', 'customerDeleteMany', '2019-12-20 16:13:33');
INSERT INTO `permission` VALUES ('11', '7', '查询客户', '/customer/search', 'customerSearch', '2019-12-20 16:14:27');
INSERT INTO `permission` VALUES ('12', '7', '新增字典表', '/customer/addSIL', 'dictAdd', '2019-12-20 16:15:13');
INSERT INTO `permission` VALUES ('13', '7', '查询字典表', '/customer/select', 'dictSelect', '2019-12-20 16:17:40');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_name` varchar(255) default NULL,
  `production_place` varchar(255) default NULL,
  `unit` varchar(255) default NULL,
  `size` varchar(255) default NULL,
  `batch_number` varchar(255) default NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('16', '苹果手机', '苹果手机', '苹果手机', '苹果手机', '苹果手机');
INSERT INTO `product` VALUES ('18', '华硕电脑', '美国', '台', '14寸大屏', '646984');
INSERT INTO `product` VALUES ('19', '无线鼠标', '中国重庆开州', '个', '小', '1496854');
INSERT INTO `product` VALUES ('20', '无线鼠标1', '中国重庆开州2', '个', '小', '14968545');
INSERT INTO `product` VALUES ('22', '无线鼠标3', '中国重庆开州3', '个', '小', '14968545');
INSERT INTO `product` VALUES ('23', '插座', '中国重庆开州4', '个', '小', '14968545');
INSERT INTO `product` VALUES ('24', '蓝光笔记本', '北京', '台', '设施', '4154615');

-- ----------------------------
-- Table structure for `product_info`
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` int(11) NOT NULL auto_increment,
  `product_nickname` varchar(255) default NULL,
  `pack` varchar(255) default NULL,
  `approval_number` varchar(11) default NULL,
  `producer` varchar(255) default NULL,
  `category` varchar(255) default NULL,
  `price` decimal(10,2) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('16', '苹果手机', '苹果手机', '苹果手机', '苹果手机', '手机', '10000.00', '页面测试数据2');
INSERT INTO `product_info` VALUES ('18', 'computer', '精装', '6165161', '华硕集团公司', '电脑', '6333.00', '是是是');
INSERT INTO `product_info` VALUES ('19', '鼠标', '简装', '148465', '中国制造总商', '配件', '18.00', '插入数据');
INSERT INTO `product_info` VALUES ('20', '鼠标2', '简装', '1484656', '中国制造总商', '配件', '19.00', '插入数据');
INSERT INTO `product_info` VALUES ('22', '鼠标3', '简装', '1484656', '中国制造总商', '配件', '21.00', '插入数据');
INSERT INTO `product_info` VALUES ('23', '茶轴', '简装', '1484656', '中国制造总商', '配件', '22.00', '插入数据');
INSERT INTO `product_info` VALUES ('24', '笔记本', '是', '351651', '神舟电脑集团', '笔记本', '6000.00', '滴答滴答');

-- ----------------------------
-- Table structure for `provider`
-- ----------------------------
DROP TABLE IF EXISTS `provider`;
CREATE TABLE `provider` (
  `provider_id` int(11) NOT NULL auto_increment,
  `provider_for_short` varchar(255) default NULL,
  `phone` varchar(255) default NULL,
  `linkman` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `deposit_bank` varchar(255) default NULL,
  PRIMARY KEY  (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provider
-- ----------------------------
INSERT INTO `provider` VALUES ('12', '赵氏公司', '12345678', 'd', '123@qq.com', 'dd');
INSERT INTO `provider` VALUES ('13', '小米', '8888888', '小李', '22@163.com', '重庆三峡银行');
INSERT INTO `provider` VALUES ('14', '达内', '', '杨老师', 'yangrong@tedu.cn', '成都银行');
INSERT INTO `provider` VALUES ('15', '博伟峰', '', '钟静', '422472620@qq.com', '');
INSERT INTO `provider` VALUES ('16', '富利来', '', '刘安济', '365447429@qq.com', '');
INSERT INTO `provider` VALUES ('17', '鸿富锦', '98765432', '小李', '1234567@163.com', '');

-- ----------------------------
-- Table structure for `provider_info`
-- ----------------------------
DROP TABLE IF EXISTS `provider_info`;
CREATE TABLE `provider_info` (
  `provider_id` int(11) NOT NULL auto_increment,
  `provider_name` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `postalcode` varchar(255) default NULL,
  `linkman_phone` varchar(255) default NULL,
  `facsimile` varchar(255) default NULL,
  `account` varchar(255) default NULL,
  `credibility` varchar(255) default NULL,
  `remark` varchar(255) default NULL,
  PRIMARY KEY  (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provider_info
-- ----------------------------
INSERT INTO `provider_info` VALUES ('12', '赵氏集团有限公司', 'dd', '652410', '12345678', 'd', '123456789012', '', 'sss');
INSERT INTO `provider_info` VALUES ('13', '小米集团', '重庆万达', '405400', '88888888', '3216521', '121212121212', '测试数据', 'sss');
INSERT INTO `provider_info` VALUES ('14', '成都达内科技有限公司', '成都锦江区东大街', '', '', '', '', '', '达内教育');
INSERT INTO `provider_info` VALUES ('15', '成都博伟峰软件计算有限公司', '成都锦江区牛王庙', '', '13982119772', '', '', '测试数据', '');
INSERT INTO `provider_info` VALUES ('16', '成都富利来网络科技有限公司', '', '', '', '', '', '', '');
INSERT INTO `provider_info` VALUES ('17', '宏福锦精密电子（成都）有限公司', '成都天府新区东大街', '', '12345678', '', '', '测试数据', '');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) character set utf8 NOT NULL,
  `hobby` varchar(255) character set utf8 default NULL,
  `maritalstatus` varchar(255) character set utf8 default NULL,
  `remarks` varchar(255) character set utf8 default NULL,
  `email` varchar(255) character set utf8 default NULL,
  `achievements` varchar(255) character set utf8 default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '2', '2', '2', '2', '2', '2');
INSERT INTO `u_user` VALUES ('2', '3', '3', '3', '3', '3', '3');
