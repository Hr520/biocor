/*
Navicat MySQL Data Transfer

Source Server         : 120.25.86.115
Source Server Version : 50517
Source Host           : 120.25.86.115:3306
Source Database       : baike

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2016-11-07 10:26:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `base_provincecityarea`
-- ----------------------------
DROP TABLE IF EXISTS `base_provincecityarea`;
CREATE TABLE `base_provincecityarea` (
  `id` int(11) NOT NULL,
  `areaID` varchar(50) DEFAULT NULL,
  `area` varchar(60) DEFAULT NULL,
  `father` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_provincecityarea
-- ----------------------------
INSERT INTO `base_provincecityarea` VALUES ('1', '110101', '东城区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('2', '110102', '西城区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('3', '110103', '崇文区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('4', '110104', '宣武区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('5', '110105', '朝阳区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('6', '110106', '丰台区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('7', '110107', '石景山区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('8', '110108', '海淀区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('9', '110109', '门头沟区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('10', '110111', '房山区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('11', '110112', '通州区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('12', '110113', '顺义区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('13', '110114', '昌平区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('14', '110115', '大兴区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('15', '110116', '怀柔区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('16', '110117', '平谷区', '110100');
INSERT INTO `base_provincecityarea` VALUES ('17', '110228', '密云县', '110200');
INSERT INTO `base_provincecityarea` VALUES ('18', '110229', '延庆县', '110200');
INSERT INTO `base_provincecityarea` VALUES ('19', '120101', '和平区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('20', '120102', '河东区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('21', '120103', '河西区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('22', '120104', '南开区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('23', '120105', '河北区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('24', '120106', '红桥区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('25', '120107', '塘沽区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('26', '120108', '汉沽区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('27', '120109', '大港区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('28', '120110', '东丽区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('29', '120111', '西青区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('30', '120112', '津南区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('31', '120113', '北辰区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('32', '120114', '武清区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('33', '120115', '宝坻区', '120100');
INSERT INTO `base_provincecityarea` VALUES ('34', '120221', '宁河县', '120200');
INSERT INTO `base_provincecityarea` VALUES ('35', '120223', '静海县', '120200');
INSERT INTO `base_provincecityarea` VALUES ('36', '120225', '蓟　县', '120200');
INSERT INTO `base_provincecityarea` VALUES ('38', '130102', '长安区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('39', '130103', '桥东区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('40', '130104', '桥西区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('41', '130105', '新华区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('42', '130107', '井陉矿区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('43', '130108', '裕华区', '130100');
INSERT INTO `base_provincecityarea` VALUES ('44', '130121', '井陉县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('45', '130123', '正定县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('46', '130124', '栾城县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('47', '130125', '行唐县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('48', '130126', '灵寿县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('49', '130127', '高邑县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('50', '130128', '深泽县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('51', '130129', '赞皇县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('52', '130130', '无极县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('53', '130131', '平山县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('54', '130132', '元氏县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('55', '130133', '赵　县', '130100');
INSERT INTO `base_provincecityarea` VALUES ('56', '130181', '辛集市', '130100');
INSERT INTO `base_provincecityarea` VALUES ('57', '130182', '藁城市', '130100');
INSERT INTO `base_provincecityarea` VALUES ('58', '130183', '晋州市', '130100');
INSERT INTO `base_provincecityarea` VALUES ('59', '130184', '新乐市', '130100');
INSERT INTO `base_provincecityarea` VALUES ('60', '130185', '鹿泉市', '130100');
INSERT INTO `base_provincecityarea` VALUES ('62', '130202', '路南区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('63', '130203', '路北区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('64', '130204', '古冶区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('65', '130205', '开平区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('66', '130207', '丰南区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('67', '130208', '丰润区', '130200');
INSERT INTO `base_provincecityarea` VALUES ('68', '130223', '滦　县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('69', '130224', '滦南县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('70', '130225', '乐亭县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('71', '130227', '迁西县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('72', '130229', '玉田县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('73', '130230', '唐海县', '130200');
INSERT INTO `base_provincecityarea` VALUES ('74', '130281', '遵化市', '130200');
INSERT INTO `base_provincecityarea` VALUES ('75', '130283', '迁安市', '130200');
INSERT INTO `base_provincecityarea` VALUES ('77', '130302', '海港区', '130300');
INSERT INTO `base_provincecityarea` VALUES ('78', '130303', '山海关区', '130300');
INSERT INTO `base_provincecityarea` VALUES ('79', '130304', '北戴河区', '130300');
INSERT INTO `base_provincecityarea` VALUES ('80', '130321', '青龙满族自治县', '130300');
INSERT INTO `base_provincecityarea` VALUES ('81', '130322', '昌黎县', '130300');
INSERT INTO `base_provincecityarea` VALUES ('82', '130323', '抚宁县', '130300');
INSERT INTO `base_provincecityarea` VALUES ('83', '130324', '卢龙县', '130300');
INSERT INTO `base_provincecityarea` VALUES ('85', '130402', '邯山区', '130400');
INSERT INTO `base_provincecityarea` VALUES ('86', '130403', '丛台区', '130400');
INSERT INTO `base_provincecityarea` VALUES ('87', '130404', '复兴区', '130400');
INSERT INTO `base_provincecityarea` VALUES ('88', '130406', '峰峰矿区', '130400');
INSERT INTO `base_provincecityarea` VALUES ('89', '130421', '邯郸县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('90', '130423', '临漳县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('91', '130424', '成安县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('92', '130425', '大名县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('93', '130426', '涉　县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('94', '130427', '磁　县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('95', '130428', '肥乡县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('96', '130429', '永年县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('97', '130430', '邱　县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('98', '130431', '鸡泽县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('99', '130432', '广平县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('100', '130433', '馆陶县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('101', '130434', '魏　县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('102', '130435', '曲周县', '130400');
INSERT INTO `base_provincecityarea` VALUES ('103', '130481', '武安市', '130400');
INSERT INTO `base_provincecityarea` VALUES ('105', '130502', '桥东区', '130500');
INSERT INTO `base_provincecityarea` VALUES ('106', '130503', '桥西区', '130500');
INSERT INTO `base_provincecityarea` VALUES ('107', '130521', '邢台县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('108', '130522', '临城县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('109', '130523', '内丘县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('110', '130524', '柏乡县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('111', '130525', '隆尧县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('112', '130526', '任　县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('113', '130527', '南和县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('114', '130528', '宁晋县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('115', '130529', '巨鹿县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('116', '130530', '新河县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('117', '130531', '广宗县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('118', '130532', '平乡县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('119', '130533', '威　县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('120', '130534', '清河县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('121', '130535', '临西县', '130500');
INSERT INTO `base_provincecityarea` VALUES ('122', '130581', '南宫市', '130500');
INSERT INTO `base_provincecityarea` VALUES ('123', '130582', '沙河市', '130500');
INSERT INTO `base_provincecityarea` VALUES ('125', '130602', '新市区', '130600');
INSERT INTO `base_provincecityarea` VALUES ('126', '130603', '北市区', '130600');
INSERT INTO `base_provincecityarea` VALUES ('127', '130604', '南市区', '130600');
INSERT INTO `base_provincecityarea` VALUES ('128', '130621', '满城县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('129', '130622', '清苑县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('130', '130623', '涞水县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('131', '130624', '阜平县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('132', '130625', '徐水县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('133', '130626', '定兴县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('134', '130627', '唐　县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('135', '130628', '高阳县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('136', '130629', '容城县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('137', '130630', '涞源县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('138', '130631', '望都县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('139', '130632', '安新县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('140', '130633', '易　县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('141', '130634', '曲阳县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('142', '130635', '蠡　县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('143', '130636', '顺平县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('144', '130637', '博野县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('145', '130638', '雄　县', '130600');
INSERT INTO `base_provincecityarea` VALUES ('146', '130681', '涿州市', '130600');
INSERT INTO `base_provincecityarea` VALUES ('147', '130682', '定州市', '130600');
INSERT INTO `base_provincecityarea` VALUES ('148', '130683', '安国市', '130600');
INSERT INTO `base_provincecityarea` VALUES ('149', '130684', '高碑店市', '130600');
INSERT INTO `base_provincecityarea` VALUES ('151', '130702', '桥东区', '130700');
INSERT INTO `base_provincecityarea` VALUES ('152', '130703', '桥西区', '130700');
INSERT INTO `base_provincecityarea` VALUES ('153', '130705', '宣化区', '130700');
INSERT INTO `base_provincecityarea` VALUES ('154', '130706', '下花园区', '130700');
INSERT INTO `base_provincecityarea` VALUES ('155', '130721', '宣化县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('156', '130722', '张北县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('157', '130723', '康保县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('158', '130724', '沽源县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('159', '130725', '尚义县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('160', '130726', '蔚　县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('161', '130727', '阳原县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('162', '130728', '怀安县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('163', '130729', '万全县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('164', '130730', '怀来县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('165', '130731', '涿鹿县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('166', '130732', '赤城县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('167', '130733', '崇礼县', '130700');
INSERT INTO `base_provincecityarea` VALUES ('169', '130802', '双桥区', '130800');
INSERT INTO `base_provincecityarea` VALUES ('170', '130803', '双滦区', '130800');
INSERT INTO `base_provincecityarea` VALUES ('171', '130804', '鹰手营子矿区', '130800');
INSERT INTO `base_provincecityarea` VALUES ('172', '130821', '承德县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('173', '130822', '兴隆县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('174', '130823', '平泉县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('175', '130824', '滦平县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('176', '130825', '隆化县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('177', '130826', '丰宁满族自治县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('178', '130827', '宽城满族自治县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('179', '130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `base_provincecityarea` VALUES ('181', '130902', '新华区', '130900');
INSERT INTO `base_provincecityarea` VALUES ('182', '130903', '运河区', '130900');
INSERT INTO `base_provincecityarea` VALUES ('183', '130921', '沧　县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('184', '130922', '青　县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('185', '130923', '东光县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('186', '130924', '海兴县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('187', '130925', '盐山县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('188', '130926', '肃宁县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('189', '130927', '南皮县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('190', '130928', '吴桥县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('191', '130929', '献　县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('192', '130930', '孟村回族自治县', '130900');
INSERT INTO `base_provincecityarea` VALUES ('193', '130981', '泊头市', '130900');
INSERT INTO `base_provincecityarea` VALUES ('194', '130982', '任丘市', '130900');
INSERT INTO `base_provincecityarea` VALUES ('195', '130983', '黄骅市', '130900');
INSERT INTO `base_provincecityarea` VALUES ('196', '130984', '河间市', '130900');
INSERT INTO `base_provincecityarea` VALUES ('198', '131002', '安次区', '131000');
INSERT INTO `base_provincecityarea` VALUES ('199', '131003', '广阳区', '131000');
INSERT INTO `base_provincecityarea` VALUES ('200', '131022', '固安县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('201', '131023', '永清县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('202', '131024', '香河县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('203', '131025', '大城县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('204', '131026', '文安县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('205', '131028', '大厂回族自治县', '131000');
INSERT INTO `base_provincecityarea` VALUES ('206', '131081', '霸州市', '131000');
INSERT INTO `base_provincecityarea` VALUES ('207', '131082', '三河市', '131000');
INSERT INTO `base_provincecityarea` VALUES ('209', '131102', '桃城区', '131100');
INSERT INTO `base_provincecityarea` VALUES ('210', '131121', '枣强县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('211', '131122', '武邑县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('212', '131123', '武强县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('213', '131124', '饶阳县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('214', '131125', '安平县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('215', '131126', '故城县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('216', '131127', '景　县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('217', '131128', '阜城县', '131100');
INSERT INTO `base_provincecityarea` VALUES ('218', '131181', '冀州市', '131100');
INSERT INTO `base_provincecityarea` VALUES ('219', '131182', '深州市', '131100');
INSERT INTO `base_provincecityarea` VALUES ('221', '140105', '小店区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('222', '140106', '迎泽区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('223', '140107', '杏花岭区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('224', '140108', '尖草坪区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('225', '140109', '万柏林区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('226', '140110', '晋源区', '140100');
INSERT INTO `base_provincecityarea` VALUES ('227', '140121', '清徐县', '140100');
INSERT INTO `base_provincecityarea` VALUES ('228', '140122', '阳曲县', '140100');
INSERT INTO `base_provincecityarea` VALUES ('229', '140123', '娄烦县', '140100');
INSERT INTO `base_provincecityarea` VALUES ('230', '140181', '古交市', '140100');
INSERT INTO `base_provincecityarea` VALUES ('232', '140202', '城　区', '140200');
INSERT INTO `base_provincecityarea` VALUES ('233', '140203', '矿　区', '140200');
INSERT INTO `base_provincecityarea` VALUES ('234', '140211', '南郊区', '140200');
INSERT INTO `base_provincecityarea` VALUES ('235', '140212', '新荣区', '140200');
INSERT INTO `base_provincecityarea` VALUES ('236', '140221', '阳高县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('237', '140222', '天镇县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('238', '140223', '广灵县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('239', '140224', '灵丘县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('240', '140225', '浑源县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('241', '140226', '左云县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('242', '140227', '大同县', '140200');
INSERT INTO `base_provincecityarea` VALUES ('244', '140302', '城　区', '140300');
INSERT INTO `base_provincecityarea` VALUES ('245', '140303', '矿　区', '140300');
INSERT INTO `base_provincecityarea` VALUES ('246', '140311', '郊　区', '140300');
INSERT INTO `base_provincecityarea` VALUES ('247', '140321', '平定县', '140300');
INSERT INTO `base_provincecityarea` VALUES ('248', '140322', '盂　县', '140300');
INSERT INTO `base_provincecityarea` VALUES ('250', '140402', '城　区', '140400');
INSERT INTO `base_provincecityarea` VALUES ('251', '140411', '郊　区', '140400');
INSERT INTO `base_provincecityarea` VALUES ('252', '140421', '长治县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('253', '140423', '襄垣县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('254', '140424', '屯留县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('255', '140425', '平顺县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('256', '140426', '黎城县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('257', '140427', '壶关县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('258', '140428', '长子县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('259', '140429', '武乡县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('260', '140430', '沁　县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('261', '140431', '沁源县', '140400');
INSERT INTO `base_provincecityarea` VALUES ('262', '140481', '潞城市', '140400');
INSERT INTO `base_provincecityarea` VALUES ('264', '140502', '城　区', '140500');
INSERT INTO `base_provincecityarea` VALUES ('265', '140521', '沁水县', '140500');
INSERT INTO `base_provincecityarea` VALUES ('266', '140522', '阳城县', '140500');
INSERT INTO `base_provincecityarea` VALUES ('267', '140524', '陵川县', '140500');
INSERT INTO `base_provincecityarea` VALUES ('268', '140525', '泽州县', '140500');
INSERT INTO `base_provincecityarea` VALUES ('269', '140581', '高平市', '140500');
INSERT INTO `base_provincecityarea` VALUES ('271', '140602', '朔城区', '140600');
INSERT INTO `base_provincecityarea` VALUES ('272', '140603', '平鲁区', '140600');
INSERT INTO `base_provincecityarea` VALUES ('273', '140621', '山阴县', '140600');
INSERT INTO `base_provincecityarea` VALUES ('274', '140622', '应　县', '140600');
INSERT INTO `base_provincecityarea` VALUES ('275', '140623', '右玉县', '140600');
INSERT INTO `base_provincecityarea` VALUES ('276', '140624', '怀仁县', '140600');
INSERT INTO `base_provincecityarea` VALUES ('278', '140702', '榆次区', '140700');
INSERT INTO `base_provincecityarea` VALUES ('279', '140721', '榆社县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('280', '140722', '左权县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('281', '140723', '和顺县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('282', '140724', '昔阳县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('283', '140725', '寿阳县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('284', '140726', '太谷县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('285', '140727', '祁　县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('286', '140728', '平遥县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('287', '140729', '灵石县', '140700');
INSERT INTO `base_provincecityarea` VALUES ('288', '140781', '介休市', '140700');
INSERT INTO `base_provincecityarea` VALUES ('290', '140802', '盐湖区', '140800');
INSERT INTO `base_provincecityarea` VALUES ('291', '140821', '临猗县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('292', '140822', '万荣县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('293', '140823', '闻喜县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('294', '140824', '稷山县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('295', '140825', '新绛县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('296', '140826', '绛　县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('297', '140827', '垣曲县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('298', '140828', '夏　县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('299', '140829', '平陆县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('300', '140830', '芮城县', '140800');
INSERT INTO `base_provincecityarea` VALUES ('301', '140881', '永济市', '140800');
INSERT INTO `base_provincecityarea` VALUES ('302', '140882', '河津市', '140800');
INSERT INTO `base_provincecityarea` VALUES ('304', '140902', '忻府区', '140900');
INSERT INTO `base_provincecityarea` VALUES ('305', '140921', '定襄县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('306', '140922', '五台县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('307', '140923', '代　县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('308', '140924', '繁峙县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('309', '140925', '宁武县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('310', '140926', '静乐县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('311', '140927', '神池县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('312', '140928', '五寨县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('313', '140929', '岢岚县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('314', '140930', '河曲县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('315', '140931', '保德县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('316', '140932', '偏关县', '140900');
INSERT INTO `base_provincecityarea` VALUES ('317', '140981', '原平市', '140900');
INSERT INTO `base_provincecityarea` VALUES ('319', '14115002', '尧都区', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('320', '141021', '曲沃县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('321', '141022', '翼城县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('322', '141023', '襄汾县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('323', '141024', '洪洞县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('324', '141025', '古　县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('325', '141026', '安泽县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('326', '141027', '浮山县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('327', '141028', '吉　县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('328', '141029', '乡宁县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('329', '141030', '大宁县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('330', '141031', '隰　县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('331', '141032', '永和县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('332', '141033', '蒲　县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('333', '141034', '汾西县', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('334', '141081', '侯马市', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('335', '141082', '霍州市', '14115000');
INSERT INTO `base_provincecityarea` VALUES ('337', '141102', '离石区', '141100');
INSERT INTO `base_provincecityarea` VALUES ('338', '141121', '文水县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('339', '141122', '交城县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('340', '141123', '兴　县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('341', '141124', '临　县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('342', '141125', '柳林县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('343', '141126', '石楼县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('344', '141127', '岚　县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('345', '141128', '方山县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('346', '141129', '中阳县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('347', '141130', '交口县', '141100');
INSERT INTO `base_provincecityarea` VALUES ('348', '141181', '孝义市', '141100');
INSERT INTO `base_provincecityarea` VALUES ('349', '141182', '汾阳市', '141100');
INSERT INTO `base_provincecityarea` VALUES ('351', '0102', '新城区', '0100');
INSERT INTO `base_provincecityarea` VALUES ('352', '0103', '回民区', '0100');
INSERT INTO `base_provincecityarea` VALUES ('353', '0104', '玉泉区', '0100');
INSERT INTO `base_provincecityarea` VALUES ('354', '0105', '赛罕区', '0100');
INSERT INTO `base_provincecityarea` VALUES ('355', '0121', '土默特左旗', '0100');
INSERT INTO `base_provincecityarea` VALUES ('356', '0122', '托克托县', '0100');
INSERT INTO `base_provincecityarea` VALUES ('357', '0123', '和林格尔县', '0100');
INSERT INTO `base_provincecityarea` VALUES ('358', '0124', '清水河县', '0100');
INSERT INTO `base_provincecityarea` VALUES ('359', '0125', '武川县', '0100');
INSERT INTO `base_provincecityarea` VALUES ('361', '0202', '东河区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('362', '0203', '昆都仑区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('363', '0204', '青山区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('364', '0205', '石拐区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('365', '0206', '白云矿区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('366', '0207', '九原区', '0200');
INSERT INTO `base_provincecityarea` VALUES ('367', '0221', '土默特右旗', '0200');
INSERT INTO `base_provincecityarea` VALUES ('368', '0222', '固阳县', '0200');
INSERT INTO `base_provincecityarea` VALUES ('369', '0223', '达尔罕茂明安联合旗', '0200');
INSERT INTO `base_provincecityarea` VALUES ('371', '0302', '海勃湾区', '0300');
INSERT INTO `base_provincecityarea` VALUES ('372', '0303', '海南区', '0300');
INSERT INTO `base_provincecityarea` VALUES ('373', '0304', '乌达区', '0300');
INSERT INTO `base_provincecityarea` VALUES ('375', '0402', '红山区', '0400');
INSERT INTO `base_provincecityarea` VALUES ('376', '0403', '元宝山区', '0400');
INSERT INTO `base_provincecityarea` VALUES ('377', '0404', '松山区', '0400');
INSERT INTO `base_provincecityarea` VALUES ('378', '0421', '阿鲁科尔沁旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('379', '0422', '巴林左旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('380', '0423', '巴林右旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('381', '0424', '林西县', '0400');
INSERT INTO `base_provincecityarea` VALUES ('382', '0425', '克什克腾旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('383', '0426', '翁牛特旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('384', '0428', '喀喇沁旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('385', '0429', '宁城县', '0400');
INSERT INTO `base_provincecityarea` VALUES ('386', '0430', '敖汉旗', '0400');
INSERT INTO `base_provincecityarea` VALUES ('388', '0502', '科尔沁区', '0500');
INSERT INTO `base_provincecityarea` VALUES ('389', '0521', '科尔沁左翼中旗', '0500');
INSERT INTO `base_provincecityarea` VALUES ('390', '0522', '科尔沁左翼后旗', '0500');
INSERT INTO `base_provincecityarea` VALUES ('391', '0523', '开鲁县', '0500');
INSERT INTO `base_provincecityarea` VALUES ('392', '0524', '库伦旗', '0500');
INSERT INTO `base_provincecityarea` VALUES ('393', '0525', '奈曼旗', '0500');
INSERT INTO `base_provincecityarea` VALUES ('394', '0526', '扎鲁特旗', '0500');
INSERT INTO `base_provincecityarea` VALUES ('395', '0581', '霍林郭勒市', '0500');
INSERT INTO `base_provincecityarea` VALUES ('396', '0602', '东胜区', '0600');
INSERT INTO `base_provincecityarea` VALUES ('397', '0621', '达拉特旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('398', '0622', '准格尔旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('399', '0623', '鄂托克前旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('400', '0624', '鄂托克旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('401', '0625', '杭锦旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('402', '0626', '乌审旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('403', '0627', '伊金霍洛旗', '0600');
INSERT INTO `base_provincecityarea` VALUES ('405', '0702', '海拉尔区', '0700');
INSERT INTO `base_provincecityarea` VALUES ('406', '0721', '阿荣旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('407', '0722', '莫力达瓦达斡尔族自治旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('408', '0723', '鄂伦春自治旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('409', '0724', '鄂温克族自治旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('410', '0725', '陈巴尔虎旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('411', '0726', '新巴尔虎左旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('412', '0727', '新巴尔虎右旗', '0700');
INSERT INTO `base_provincecityarea` VALUES ('413', '0781', '满洲里市', '0700');
INSERT INTO `base_provincecityarea` VALUES ('414', '0782', '牙克石市', '0700');
INSERT INTO `base_provincecityarea` VALUES ('415', '0783', '扎兰屯市', '0700');
INSERT INTO `base_provincecityarea` VALUES ('416', '0784', '额尔古纳市', '0700');
INSERT INTO `base_provincecityarea` VALUES ('417', '0785', '根河市', '0700');
INSERT INTO `base_provincecityarea` VALUES ('419', '0802', '临河区', '0800');
INSERT INTO `base_provincecityarea` VALUES ('420', '0821', '五原县', '0800');
INSERT INTO `base_provincecityarea` VALUES ('421', '0822', '磴口县', '0800');
INSERT INTO `base_provincecityarea` VALUES ('422', '0823', '乌拉特前旗', '0800');
INSERT INTO `base_provincecityarea` VALUES ('423', '0824', '乌拉特中旗', '0800');
INSERT INTO `base_provincecityarea` VALUES ('424', '0825', '乌拉特后旗', '0800');
INSERT INTO `base_provincecityarea` VALUES ('425', '0826', '杭锦后旗', '0800');
INSERT INTO `base_provincecityarea` VALUES ('427', '0902', '集宁区', '0900');
INSERT INTO `base_provincecityarea` VALUES ('428', '0921', '卓资县', '0900');
INSERT INTO `base_provincecityarea` VALUES ('429', '0922', '化德县', '0900');
INSERT INTO `base_provincecityarea` VALUES ('430', '0923', '商都县', '0900');
INSERT INTO `base_provincecityarea` VALUES ('431', '0924', '兴和县', '0900');
INSERT INTO `base_provincecityarea` VALUES ('432', '0925', '凉城县', '0900');
INSERT INTO `base_provincecityarea` VALUES ('433', '0926', '察哈尔右翼前旗', '0900');
INSERT INTO `base_provincecityarea` VALUES ('434', '0927', '察哈尔右翼中旗', '0900');
INSERT INTO `base_provincecityarea` VALUES ('435', '0928', '察哈尔右翼后旗', '0900');
INSERT INTO `base_provincecityarea` VALUES ('436', '0929', '四子王旗', '0900');
INSERT INTO `base_provincecityarea` VALUES ('437', '0981', '丰镇市', '0900');
INSERT INTO `base_provincecityarea` VALUES ('438', '2201', '乌兰浩特市', '2200');
INSERT INTO `base_provincecityarea` VALUES ('439', '2202', '阿尔山市', '2200');
INSERT INTO `base_provincecityarea` VALUES ('440', '2221', '科尔沁右翼前旗', '2200');
INSERT INTO `base_provincecityarea` VALUES ('441', '2222', '科尔沁右翼中旗', '2200');
INSERT INTO `base_provincecityarea` VALUES ('442', '2223', '扎赉特旗', '2200');
INSERT INTO `base_provincecityarea` VALUES ('443', '2224', '突泉县', '2200');
INSERT INTO `base_provincecityarea` VALUES ('444', '2501', '二连浩特市', '2500');
INSERT INTO `base_provincecityarea` VALUES ('445', '2502', '锡林浩特市', '2500');
INSERT INTO `base_provincecityarea` VALUES ('446', '2522', '阿巴嘎旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('447', '2523', '苏尼特左旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('448', '2524', '苏尼特右旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('449', '2525', '东乌珠穆沁旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('450', '2526', '西乌珠穆沁旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('451', '2527', '太仆寺旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('452', '2528', '镶黄旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('453', '2529', '正镶白旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('454', '2530', '正蓝旗', '2500');
INSERT INTO `base_provincecityarea` VALUES ('455', '2531', '多伦县', '2500');
INSERT INTO `base_provincecityarea` VALUES ('456', '2921', '阿拉善左旗', '2900');
INSERT INTO `base_provincecityarea` VALUES ('457', '2922', '阿拉善右旗', '2900');
INSERT INTO `base_provincecityarea` VALUES ('458', '2923', '额济纳旗', '2900');
INSERT INTO `base_provincecityarea` VALUES ('460', '210102', '和平区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('461', '210103', '沈河区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('462', '210104', '大东区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('463', '210105', '皇姑区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('464', '210106', '铁西区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('465', '210111', '苏家屯区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('466', '210112', '东陵区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('467', '210113', '新城子区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('468', '210114', '于洪区', '210100');
INSERT INTO `base_provincecityarea` VALUES ('469', '210122', '辽中县', '210100');
INSERT INTO `base_provincecityarea` VALUES ('470', '210123', '康平县', '210100');
INSERT INTO `base_provincecityarea` VALUES ('471', '210124', '法库县', '210100');
INSERT INTO `base_provincecityarea` VALUES ('472', '210181', '新民市', '210100');
INSERT INTO `base_provincecityarea` VALUES ('474', '210202', '中山区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('475', '210203', '西岗区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('476', '210204', '沙河口区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('477', '210211', '甘井子区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('478', '210212', '旅顺口区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('479', '210213', '金州区', '210200');
INSERT INTO `base_provincecityarea` VALUES ('480', '210224', '长海县', '210200');
INSERT INTO `base_provincecityarea` VALUES ('481', '210281', '瓦房店市', '210200');
INSERT INTO `base_provincecityarea` VALUES ('482', '210282', '普兰店市', '210200');
INSERT INTO `base_provincecityarea` VALUES ('483', '210283', '庄河市', '210200');
INSERT INTO `base_provincecityarea` VALUES ('485', '210302', '铁东区', '210300');
INSERT INTO `base_provincecityarea` VALUES ('486', '210303', '铁西区', '210300');
INSERT INTO `base_provincecityarea` VALUES ('487', '210304', '立山区', '210300');
INSERT INTO `base_provincecityarea` VALUES ('488', '210311', '千山区', '210300');
INSERT INTO `base_provincecityarea` VALUES ('489', '210321', '台安县', '210300');
INSERT INTO `base_provincecityarea` VALUES ('490', '210323', '岫岩满族自治县', '210300');
INSERT INTO `base_provincecityarea` VALUES ('491', '210381', '海城市', '210300');
INSERT INTO `base_provincecityarea` VALUES ('493', '210402', '新抚区', '210400');
INSERT INTO `base_provincecityarea` VALUES ('494', '210403', '东洲区', '210400');
INSERT INTO `base_provincecityarea` VALUES ('495', '210404', '望花区', '210400');
INSERT INTO `base_provincecityarea` VALUES ('496', '210411', '顺城区', '210400');
INSERT INTO `base_provincecityarea` VALUES ('497', '210421', '抚顺县', '210400');
INSERT INTO `base_provincecityarea` VALUES ('498', '210422', '新宾满族自治县', '210400');
INSERT INTO `base_provincecityarea` VALUES ('499', '210423', '清原满族自治县', '210400');
INSERT INTO `base_provincecityarea` VALUES ('501', '210502', '平山区', '210500');
INSERT INTO `base_provincecityarea` VALUES ('502', '210503', '溪湖区', '210500');
INSERT INTO `base_provincecityarea` VALUES ('503', '210504', '明山区', '210500');
INSERT INTO `base_provincecityarea` VALUES ('504', '210505', '南芬区', '210500');
INSERT INTO `base_provincecityarea` VALUES ('505', '210521', '本溪满族自治县', '210500');
INSERT INTO `base_provincecityarea` VALUES ('506', '210522', '桓仁满族自治县', '210500');
INSERT INTO `base_provincecityarea` VALUES ('508', '210602', '元宝区', '210600');
INSERT INTO `base_provincecityarea` VALUES ('509', '210603', '振兴区', '210600');
INSERT INTO `base_provincecityarea` VALUES ('510', '210604', '振安区', '210600');
INSERT INTO `base_provincecityarea` VALUES ('511', '210624', '宽甸满族自治县', '210600');
INSERT INTO `base_provincecityarea` VALUES ('512', '210681', '东港市', '210600');
INSERT INTO `base_provincecityarea` VALUES ('513', '210682', '凤城市', '210600');
INSERT INTO `base_provincecityarea` VALUES ('515', '210702', '古塔区', '210700');
INSERT INTO `base_provincecityarea` VALUES ('516', '210703', '凌河区', '210700');
INSERT INTO `base_provincecityarea` VALUES ('517', '210711', '太和区', '210700');
INSERT INTO `base_provincecityarea` VALUES ('518', '210726', '黑山县', '210700');
INSERT INTO `base_provincecityarea` VALUES ('519', '210727', '义　县', '210700');
INSERT INTO `base_provincecityarea` VALUES ('520', '210781', '凌海市', '210700');
INSERT INTO `base_provincecityarea` VALUES ('521', '210782', '北宁市', '210700');
INSERT INTO `base_provincecityarea` VALUES ('523', '210802', '站前区', '210800');
INSERT INTO `base_provincecityarea` VALUES ('524', '210803', '西市区', '210800');
INSERT INTO `base_provincecityarea` VALUES ('525', '210804', '鲅鱼圈区', '210800');
INSERT INTO `base_provincecityarea` VALUES ('526', '210811', '老边区', '210800');
INSERT INTO `base_provincecityarea` VALUES ('527', '210881', '盖州市', '210800');
INSERT INTO `base_provincecityarea` VALUES ('528', '210882', '大石桥市', '210800');
INSERT INTO `base_provincecityarea` VALUES ('530', '210902', '海州区', '210900');
INSERT INTO `base_provincecityarea` VALUES ('531', '210903', '新邱区', '210900');
INSERT INTO `base_provincecityarea` VALUES ('532', '210904', '太平区', '210900');
INSERT INTO `base_provincecityarea` VALUES ('533', '210905', '清河门区', '210900');
INSERT INTO `base_provincecityarea` VALUES ('534', '210911', '细河区', '210900');
INSERT INTO `base_provincecityarea` VALUES ('535', '210921', '阜新蒙古族自治县', '210900');
INSERT INTO `base_provincecityarea` VALUES ('536', '210922', '彰武县', '210900');
INSERT INTO `base_provincecityarea` VALUES ('538', '211002', '白塔区', '211000');
INSERT INTO `base_provincecityarea` VALUES ('539', '211003', '文圣区', '211000');
INSERT INTO `base_provincecityarea` VALUES ('540', '211004', '宏伟区', '211000');
INSERT INTO `base_provincecityarea` VALUES ('541', '211005', '弓长岭区', '211000');
INSERT INTO `base_provincecityarea` VALUES ('542', '211011', '太子河区', '211000');
INSERT INTO `base_provincecityarea` VALUES ('543', '211021', '辽阳县', '211000');
INSERT INTO `base_provincecityarea` VALUES ('544', '211081', '灯塔市', '211000');
INSERT INTO `base_provincecityarea` VALUES ('546', '211102', '双台子区', '211100');
INSERT INTO `base_provincecityarea` VALUES ('547', '211103', '兴隆台区', '211100');
INSERT INTO `base_provincecityarea` VALUES ('548', '211121', '大洼县', '211100');
INSERT INTO `base_provincecityarea` VALUES ('549', '211122', '盘山县', '211100');
INSERT INTO `base_provincecityarea` VALUES ('551', '211202', '银州区', '211200');
INSERT INTO `base_provincecityarea` VALUES ('552', '211204', '清河区', '211200');
INSERT INTO `base_provincecityarea` VALUES ('553', '211221', '铁岭县', '211200');
INSERT INTO `base_provincecityarea` VALUES ('554', '211223', '西丰县', '211200');
INSERT INTO `base_provincecityarea` VALUES ('555', '211224', '昌图县', '211200');
INSERT INTO `base_provincecityarea` VALUES ('556', '211281', '调兵山市', '211200');
INSERT INTO `base_provincecityarea` VALUES ('557', '211282', '开原市', '211200');
INSERT INTO `base_provincecityarea` VALUES ('559', '211302', '双塔区', '211300');
INSERT INTO `base_provincecityarea` VALUES ('560', '211303', '龙城区', '211300');
INSERT INTO `base_provincecityarea` VALUES ('561', '211321', '朝阳县', '211300');
INSERT INTO `base_provincecityarea` VALUES ('562', '211322', '建平县', '211300');
INSERT INTO `base_provincecityarea` VALUES ('563', '211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `base_provincecityarea` VALUES ('564', '211381', '北票市', '211300');
INSERT INTO `base_provincecityarea` VALUES ('565', '211382', '凌源市', '211300');
INSERT INTO `base_provincecityarea` VALUES ('567', '211402', '连山区', '211400');
INSERT INTO `base_provincecityarea` VALUES ('568', '211403', '龙港区', '211400');
INSERT INTO `base_provincecityarea` VALUES ('569', '211404', '南票区', '211400');
INSERT INTO `base_provincecityarea` VALUES ('570', '211421', '绥中县', '211400');
INSERT INTO `base_provincecityarea` VALUES ('571', '211422', '建昌县', '211400');
INSERT INTO `base_provincecityarea` VALUES ('572', '211481', '兴城市', '211400');
INSERT INTO `base_provincecityarea` VALUES ('574', '220102', '南关区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('575', '220103', '宽城区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('576', '220104', '朝阳区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('577', '220105', '二道区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('578', '220106', '绿园区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('579', '220112', '双阳区', '220100');
INSERT INTO `base_provincecityarea` VALUES ('580', '220122', '农安县', '220100');
INSERT INTO `base_provincecityarea` VALUES ('581', '220181', '九台市', '220100');
INSERT INTO `base_provincecityarea` VALUES ('582', '220182', '榆树市', '220100');
INSERT INTO `base_provincecityarea` VALUES ('583', '220183', '德惠市', '220100');
INSERT INTO `base_provincecityarea` VALUES ('585', '220202', '昌邑区', '220200');
INSERT INTO `base_provincecityarea` VALUES ('586', '220203', '龙潭区', '220200');
INSERT INTO `base_provincecityarea` VALUES ('587', '220204', '船营区', '220200');
INSERT INTO `base_provincecityarea` VALUES ('588', '220211', '丰满区', '220200');
INSERT INTO `base_provincecityarea` VALUES ('589', '220221', '永吉县', '220200');
INSERT INTO `base_provincecityarea` VALUES ('590', '220281', '蛟河市', '220200');
INSERT INTO `base_provincecityarea` VALUES ('591', '220282', '桦甸市', '220200');
INSERT INTO `base_provincecityarea` VALUES ('592', '220283', '舒兰市', '220200');
INSERT INTO `base_provincecityarea` VALUES ('593', '220284', '磐石市', '220200');
INSERT INTO `base_provincecityarea` VALUES ('595', '220302', '铁西区', '220300');
INSERT INTO `base_provincecityarea` VALUES ('596', '220303', '铁东区', '220300');
INSERT INTO `base_provincecityarea` VALUES ('597', '220322', '梨树县', '220300');
INSERT INTO `base_provincecityarea` VALUES ('598', '220323', '伊通满族自治县', '220300');
INSERT INTO `base_provincecityarea` VALUES ('599', '220381', '公主岭市', '220300');
INSERT INTO `base_provincecityarea` VALUES ('600', '220382', '双辽市', '220300');
INSERT INTO `base_provincecityarea` VALUES ('602', '220402', '龙山区', '220400');
INSERT INTO `base_provincecityarea` VALUES ('603', '220403', '西安区', '220400');
INSERT INTO `base_provincecityarea` VALUES ('604', '220421', '东丰县', '220400');
INSERT INTO `base_provincecityarea` VALUES ('605', '220422', '东辽县', '220400');
INSERT INTO `base_provincecityarea` VALUES ('607', '220502', '东昌区', '220500');
INSERT INTO `base_provincecityarea` VALUES ('608', '220503', '二道江区', '220500');
INSERT INTO `base_provincecityarea` VALUES ('609', '220521', '通化县', '220500');
INSERT INTO `base_provincecityarea` VALUES ('610', '220523', '辉南县', '220500');
INSERT INTO `base_provincecityarea` VALUES ('611', '220524', '柳河县', '220500');
INSERT INTO `base_provincecityarea` VALUES ('612', '220581', '梅河口市', '220500');
INSERT INTO `base_provincecityarea` VALUES ('613', '220582', '集安市', '220500');
INSERT INTO `base_provincecityarea` VALUES ('615', '220602', '八道江区', '220600');
INSERT INTO `base_provincecityarea` VALUES ('616', '220621', '抚松县', '220600');
INSERT INTO `base_provincecityarea` VALUES ('617', '220622', '靖宇县', '220600');
INSERT INTO `base_provincecityarea` VALUES ('618', '220623', '长白朝鲜族自治县', '220600');
INSERT INTO `base_provincecityarea` VALUES ('619', '220625', '江源县', '220600');
INSERT INTO `base_provincecityarea` VALUES ('620', '220681', '临江市', '220600');
INSERT INTO `base_provincecityarea` VALUES ('622', '220702', '宁江区', '220700');
INSERT INTO `base_provincecityarea` VALUES ('623', '220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `base_provincecityarea` VALUES ('624', '220722', '长岭县', '220700');
INSERT INTO `base_provincecityarea` VALUES ('625', '220723', '乾安县', '220700');
INSERT INTO `base_provincecityarea` VALUES ('626', '220724', '扶余县', '220700');
INSERT INTO `base_provincecityarea` VALUES ('628', '220802', '洮北区', '220800');
INSERT INTO `base_provincecityarea` VALUES ('629', '220821', '镇赉县', '220800');
INSERT INTO `base_provincecityarea` VALUES ('630', '220822', '通榆县', '220800');
INSERT INTO `base_provincecityarea` VALUES ('631', '220881', '洮南市', '220800');
INSERT INTO `base_provincecityarea` VALUES ('632', '220882', '大安市', '220800');
INSERT INTO `base_provincecityarea` VALUES ('633', '222401', '延吉市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('634', '222402', '图们市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('635', '222403', '敦化市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('636', '222404', '珲春市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('637', '222405', '龙井市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('638', '222406', '和龙市', '222400');
INSERT INTO `base_provincecityarea` VALUES ('639', '222424', '汪清县', '222400');
INSERT INTO `base_provincecityarea` VALUES ('640', '222426', '安图县', '222400');
INSERT INTO `base_provincecityarea` VALUES ('642', '230102', '道里区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('643', '230103', '南岗区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('644', '230104', '道外区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('645', '230106', '香坊区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('646', '230107', '动力区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('647', '230108', '平房区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('648', '230109', '松北区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('649', '230111', '呼兰区', '230100');
INSERT INTO `base_provincecityarea` VALUES ('650', '230123', '依兰县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('651', '230124', '方正县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('652', '230125', '宾　县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('653', '230126', '巴彦县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('654', '230127', '木兰县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('655', '230128', '通河县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('656', '230129', '延寿县', '230100');
INSERT INTO `base_provincecityarea` VALUES ('657', '230181', '阿城市', '230100');
INSERT INTO `base_provincecityarea` VALUES ('658', '230182', '双城市', '230100');
INSERT INTO `base_provincecityarea` VALUES ('659', '230183', '尚志市', '230100');
INSERT INTO `base_provincecityarea` VALUES ('660', '230184', '五常市', '230100');
INSERT INTO `base_provincecityarea` VALUES ('662', '230202', '龙沙区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('663', '230203', '建华区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('664', '230204', '铁锋区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('665', '230205', '昂昂溪区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('666', '230206', '富拉尔基区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('667', '230207', '碾子山区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('668', '230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `base_provincecityarea` VALUES ('669', '230221', '龙江县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('670', '230223', '依安县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('671', '230224', '泰来县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('672', '230225', '甘南县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('673', '230227', '富裕县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('674', '230229', '克山县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('675', '230230', '克东县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('676', '230231', '拜泉县', '230200');
INSERT INTO `base_provincecityarea` VALUES ('677', '230281', '讷河市', '230200');
INSERT INTO `base_provincecityarea` VALUES ('679', '230302', '鸡冠区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('680', '230303', '恒山区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('681', '230304', '滴道区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('682', '230305', '梨树区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('683', '230306', '城子河区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('684', '230307', '麻山区', '230300');
INSERT INTO `base_provincecityarea` VALUES ('685', '230321', '鸡东县', '230300');
INSERT INTO `base_provincecityarea` VALUES ('686', '230381', '虎林市', '230300');
INSERT INTO `base_provincecityarea` VALUES ('687', '230382', '密山市', '230300');
INSERT INTO `base_provincecityarea` VALUES ('689', '230402', '向阳区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('690', '230403', '工农区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('691', '230404', '南山区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('692', '230405', '兴安区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('693', '230406', '东山区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('694', '230407', '兴山区', '230400');
INSERT INTO `base_provincecityarea` VALUES ('695', '230421', '萝北县', '230400');
INSERT INTO `base_provincecityarea` VALUES ('696', '230422', '绥滨县', '230400');
INSERT INTO `base_provincecityarea` VALUES ('698', '230502', '尖山区', '230500');
INSERT INTO `base_provincecityarea` VALUES ('699', '230503', '岭东区', '230500');
INSERT INTO `base_provincecityarea` VALUES ('700', '230505', '四方台区', '230500');
INSERT INTO `base_provincecityarea` VALUES ('701', '230506', '宝山区', '230500');
INSERT INTO `base_provincecityarea` VALUES ('702', '230521', '集贤县', '230500');
INSERT INTO `base_provincecityarea` VALUES ('703', '230522', '友谊县', '230500');
INSERT INTO `base_provincecityarea` VALUES ('704', '230523', '宝清县', '230500');
INSERT INTO `base_provincecityarea` VALUES ('705', '230524', '饶河县', '230500');
INSERT INTO `base_provincecityarea` VALUES ('707', '230602', '萨尔图区', '230600');
INSERT INTO `base_provincecityarea` VALUES ('708', '230603', '龙凤区', '230600');
INSERT INTO `base_provincecityarea` VALUES ('709', '230604', '让胡路区', '230600');
INSERT INTO `base_provincecityarea` VALUES ('710', '230605', '红岗区', '230600');
INSERT INTO `base_provincecityarea` VALUES ('711', '230606', '大同区', '230600');
INSERT INTO `base_provincecityarea` VALUES ('712', '230621', '肇州县', '230600');
INSERT INTO `base_provincecityarea` VALUES ('713', '230622', '肇源县', '230600');
INSERT INTO `base_provincecityarea` VALUES ('714', '230623', '林甸县', '230600');
INSERT INTO `base_provincecityarea` VALUES ('715', '230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `base_provincecityarea` VALUES ('717', '230702', '伊春区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('718', '230703', '南岔区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('719', '230704', '友好区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('720', '230705', '西林区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('721', '230706', '翠峦区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('722', '230707', '新青区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('723', '230708', '美溪区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('724', '230709', '金山屯区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('725', '230710', '五营区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('726', '230711', '乌马河区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('727', '230712', '汤旺河区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('728', '230713', '带岭区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('729', '230714', '乌伊岭区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('730', '2307', '红星区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('731', '230716', '上甘岭区', '230700');
INSERT INTO `base_provincecityarea` VALUES ('732', '230722', '嘉荫县', '230700');
INSERT INTO `base_provincecityarea` VALUES ('733', '230781', '铁力市', '230700');
INSERT INTO `base_provincecityarea` VALUES ('735', '230802', '永红区', '230800');
INSERT INTO `base_provincecityarea` VALUES ('736', '230803', '向阳区', '230800');
INSERT INTO `base_provincecityarea` VALUES ('737', '230804', '前进区', '230800');
INSERT INTO `base_provincecityarea` VALUES ('738', '230805', '东风区', '230800');
INSERT INTO `base_provincecityarea` VALUES ('739', '230811', '郊　区', '230800');
INSERT INTO `base_provincecityarea` VALUES ('740', '230822', '桦南县', '230800');
INSERT INTO `base_provincecityarea` VALUES ('741', '230826', '桦川县', '230800');
INSERT INTO `base_provincecityarea` VALUES ('742', '230828', '汤原县', '230800');
INSERT INTO `base_provincecityarea` VALUES ('743', '230833', '抚远县', '230800');
INSERT INTO `base_provincecityarea` VALUES ('744', '230881', '同江市', '230800');
INSERT INTO `base_provincecityarea` VALUES ('745', '230882', '富锦市', '230800');
INSERT INTO `base_provincecityarea` VALUES ('747', '230902', '新兴区', '230900');
INSERT INTO `base_provincecityarea` VALUES ('748', '230903', '桃山区', '230900');
INSERT INTO `base_provincecityarea` VALUES ('749', '230904', '茄子河区', '230900');
INSERT INTO `base_provincecityarea` VALUES ('750', '230921', '勃利县', '230900');
INSERT INTO `base_provincecityarea` VALUES ('752', '231002', '东安区', '231000');
INSERT INTO `base_provincecityarea` VALUES ('753', '231003', '阳明区', '231000');
INSERT INTO `base_provincecityarea` VALUES ('754', '231004', '爱民区', '231000');
INSERT INTO `base_provincecityarea` VALUES ('755', '231005', '西安区', '231000');
INSERT INTO `base_provincecityarea` VALUES ('756', '231024', '东宁县', '231000');
INSERT INTO `base_provincecityarea` VALUES ('757', '231025', '林口县', '231000');
INSERT INTO `base_provincecityarea` VALUES ('758', '231081', '绥芬河市', '231000');
INSERT INTO `base_provincecityarea` VALUES ('759', '231083', '海林市', '231000');
INSERT INTO `base_provincecityarea` VALUES ('760', '231084', '宁安市', '231000');
INSERT INTO `base_provincecityarea` VALUES ('761', '231085', '穆棱市', '231000');
INSERT INTO `base_provincecityarea` VALUES ('763', '231102', '爱辉区', '231100');
INSERT INTO `base_provincecityarea` VALUES ('764', '231121', '嫩江县', '231100');
INSERT INTO `base_provincecityarea` VALUES ('765', '231123', '逊克县', '231100');
INSERT INTO `base_provincecityarea` VALUES ('766', '231124', '孙吴县', '231100');
INSERT INTO `base_provincecityarea` VALUES ('767', '231181', '北安市', '231100');
INSERT INTO `base_provincecityarea` VALUES ('768', '231182', '五大连池市', '231100');
INSERT INTO `base_provincecityarea` VALUES ('770', '231202', '北林区', '231200');
INSERT INTO `base_provincecityarea` VALUES ('771', '231221', '望奎县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('772', '231222', '兰西县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('773', '231223', '青冈县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('774', '231224', '庆安县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('775', '231225', '明水县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('776', '231226', '绥棱县', '231200');
INSERT INTO `base_provincecityarea` VALUES ('777', '231281', '安达市', '231200');
INSERT INTO `base_provincecityarea` VALUES ('778', '231282', '肇东市', '231200');
INSERT INTO `base_provincecityarea` VALUES ('779', '231283', '海伦市', '231200');
INSERT INTO `base_provincecityarea` VALUES ('780', '232721', '呼玛县', '232700');
INSERT INTO `base_provincecityarea` VALUES ('781', '232722', '塔河县', '232700');
INSERT INTO `base_provincecityarea` VALUES ('782', '232723', '漠河县', '232700');
INSERT INTO `base_provincecityarea` VALUES ('783', '310101', '黄浦区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('784', '310103', '卢湾区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('785', '310104', '徐汇区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('786', '310105', '长宁区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('787', '310106', '静安区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('788', '310107', '普陀区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('789', '310108', '闸北区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('790', '310109', '虹口区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('791', '310110', '杨浦区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('792', '310112', '闵行区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('793', '310113', '宝山区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('794', '310114', '嘉定区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('795', '3101', '浦东新区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('796', '310116', '金山区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('797', '310117', '松江区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('798', '310118', '青浦区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('799', '310119', '南汇区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('800', '310120', '奉贤区', '310100');
INSERT INTO `base_provincecityarea` VALUES ('801', '310230', '崇明县', '310200');
INSERT INTO `base_provincecityarea` VALUES ('803', '320102', '玄武区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('804', '320103', '白下区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('805', '320104', '秦淮区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('806', '320105', '建邺区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('807', '320106', '鼓楼区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('808', '320107', '下关区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('809', '320111', '浦口区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('810', '320113', '栖霞区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('811', '320114', '雨花台区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('812', '3201', '江宁区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('813', '320116', '六合区', '320100');
INSERT INTO `base_provincecityarea` VALUES ('814', '320124', '溧水县', '320100');
INSERT INTO `base_provincecityarea` VALUES ('815', '320125', '高淳县', '320100');
INSERT INTO `base_provincecityarea` VALUES ('817', '320202', '崇安区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('818', '320203', '南长区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('819', '320204', '北塘区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('820', '320205', '锡山区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('821', '320206', '惠山区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('822', '320211', '滨湖区', '320200');
INSERT INTO `base_provincecityarea` VALUES ('823', '320281', '江阴市', '320200');
INSERT INTO `base_provincecityarea` VALUES ('824', '320282', '宜兴市', '320200');
INSERT INTO `base_provincecityarea` VALUES ('826', '320302', '鼓楼区', '320300');
INSERT INTO `base_provincecityarea` VALUES ('827', '320303', '云龙区', '320300');
INSERT INTO `base_provincecityarea` VALUES ('828', '320304', '九里区', '320300');
INSERT INTO `base_provincecityarea` VALUES ('829', '320305', '贾汪区', '320300');
INSERT INTO `base_provincecityarea` VALUES ('830', '320311', '泉山区', '320300');
INSERT INTO `base_provincecityarea` VALUES ('831', '320321', '丰　县', '320300');
INSERT INTO `base_provincecityarea` VALUES ('832', '320322', '沛　县', '320300');
INSERT INTO `base_provincecityarea` VALUES ('833', '320323', '铜山县', '320300');
INSERT INTO `base_provincecityarea` VALUES ('834', '320324', '睢宁县', '320300');
INSERT INTO `base_provincecityarea` VALUES ('835', '320381', '新沂市', '320300');
INSERT INTO `base_provincecityarea` VALUES ('836', '320382', '邳州市', '320300');
INSERT INTO `base_provincecityarea` VALUES ('838', '320402', '天宁区', '320400');
INSERT INTO `base_provincecityarea` VALUES ('839', '320404', '钟楼区', '320400');
INSERT INTO `base_provincecityarea` VALUES ('840', '320405', '戚墅堰区', '320400');
INSERT INTO `base_provincecityarea` VALUES ('841', '320411', '新北区', '320400');
INSERT INTO `base_provincecityarea` VALUES ('842', '320412', '武进区', '320400');
INSERT INTO `base_provincecityarea` VALUES ('843', '320481', '溧阳市', '320400');
INSERT INTO `base_provincecityarea` VALUES ('844', '320482', '金坛市', '320400');
INSERT INTO `base_provincecityarea` VALUES ('846', '320502', '沧浪区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('847', '320503', '平江区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('848', '320504', '金阊区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('849', '320505', '虎丘区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('850', '320506', '吴中区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('851', '320507', '相城区', '320500');
INSERT INTO `base_provincecityarea` VALUES ('852', '320581', '常熟市', '320500');
INSERT INTO `base_provincecityarea` VALUES ('853', '320582', '张家港市', '320500');
INSERT INTO `base_provincecityarea` VALUES ('854', '320583', '昆山市', '320500');
INSERT INTO `base_provincecityarea` VALUES ('855', '320584', '吴江市', '320500');
INSERT INTO `base_provincecityarea` VALUES ('856', '320585', '太仓市', '320500');
INSERT INTO `base_provincecityarea` VALUES ('858', '320602', '崇川区', '320600');
INSERT INTO `base_provincecityarea` VALUES ('859', '320611', '港闸区', '320600');
INSERT INTO `base_provincecityarea` VALUES ('860', '320621', '海安县', '320600');
INSERT INTO `base_provincecityarea` VALUES ('861', '320623', '如东县', '320600');
INSERT INTO `base_provincecityarea` VALUES ('862', '320681', '启东市', '320600');
INSERT INTO `base_provincecityarea` VALUES ('863', '320682', '如皋市', '320600');
INSERT INTO `base_provincecityarea` VALUES ('864', '320683', '通州市', '320600');
INSERT INTO `base_provincecityarea` VALUES ('865', '320684', '海门市', '320600');
INSERT INTO `base_provincecityarea` VALUES ('867', '320703', '连云区', '320700');
INSERT INTO `base_provincecityarea` VALUES ('868', '320705', '新浦区', '320700');
INSERT INTO `base_provincecityarea` VALUES ('869', '320706', '海州区', '320700');
INSERT INTO `base_provincecityarea` VALUES ('870', '320721', '赣榆县', '320700');
INSERT INTO `base_provincecityarea` VALUES ('871', '320722', '东海县', '320700');
INSERT INTO `base_provincecityarea` VALUES ('872', '320723', '灌云县', '320700');
INSERT INTO `base_provincecityarea` VALUES ('873', '320724', '灌南县', '320700');
INSERT INTO `base_provincecityarea` VALUES ('875', '320802', '清河区', '320800');
INSERT INTO `base_provincecityarea` VALUES ('876', '320803', '楚州区', '320800');
INSERT INTO `base_provincecityarea` VALUES ('877', '320804', '淮阴区', '320800');
INSERT INTO `base_provincecityarea` VALUES ('878', '320811', '清浦区', '320800');
INSERT INTO `base_provincecityarea` VALUES ('879', '320826', '涟水县', '320800');
INSERT INTO `base_provincecityarea` VALUES ('880', '320829', '洪泽县', '320800');
INSERT INTO `base_provincecityarea` VALUES ('881', '320830', '盱眙县', '320800');
INSERT INTO `base_provincecityarea` VALUES ('882', '320831', '金湖县', '320800');
INSERT INTO `base_provincecityarea` VALUES ('884', '320902', '亭湖区', '320900');
INSERT INTO `base_provincecityarea` VALUES ('885', '320903', '盐都区', '320900');
INSERT INTO `base_provincecityarea` VALUES ('886', '320921', '响水县', '320900');
INSERT INTO `base_provincecityarea` VALUES ('887', '320922', '滨海县', '320900');
INSERT INTO `base_provincecityarea` VALUES ('888', '320923', '阜宁县', '320900');
INSERT INTO `base_provincecityarea` VALUES ('889', '320924', '射阳县', '320900');
INSERT INTO `base_provincecityarea` VALUES ('890', '320925', '建湖县', '320900');
INSERT INTO `base_provincecityarea` VALUES ('891', '320981', '东台市', '320900');
INSERT INTO `base_provincecityarea` VALUES ('892', '320982', '大丰市', '320900');
INSERT INTO `base_provincecityarea` VALUES ('894', '321002', '广陵区', '321000');
INSERT INTO `base_provincecityarea` VALUES ('895', '321003', '邗江区', '321000');
INSERT INTO `base_provincecityarea` VALUES ('896', '321011', '郊　区', '321000');
INSERT INTO `base_provincecityarea` VALUES ('897', '321023', '宝应县', '321000');
INSERT INTO `base_provincecityarea` VALUES ('898', '321081', '仪征市', '321000');
INSERT INTO `base_provincecityarea` VALUES ('899', '321084', '高邮市', '321000');
INSERT INTO `base_provincecityarea` VALUES ('900', '321088', '江都市', '321000');
INSERT INTO `base_provincecityarea` VALUES ('902', '321102', '京口区', '321100');
INSERT INTO `base_provincecityarea` VALUES ('903', '321111', '润州区', '321100');
INSERT INTO `base_provincecityarea` VALUES ('904', '321112', '丹徒区', '321100');
INSERT INTO `base_provincecityarea` VALUES ('905', '321181', '丹阳市', '321100');
INSERT INTO `base_provincecityarea` VALUES ('906', '321182', '扬中市', '321100');
INSERT INTO `base_provincecityarea` VALUES ('907', '321183', '句容市', '321100');
INSERT INTO `base_provincecityarea` VALUES ('909', '321202', '海陵区', '321200');
INSERT INTO `base_provincecityarea` VALUES ('910', '321203', '高港区', '321200');
INSERT INTO `base_provincecityarea` VALUES ('911', '321281', '兴化市', '321200');
INSERT INTO `base_provincecityarea` VALUES ('912', '321282', '靖江市', '321200');
INSERT INTO `base_provincecityarea` VALUES ('913', '321283', '泰兴市', '321200');
INSERT INTO `base_provincecityarea` VALUES ('914', '321284', '姜堰市', '321200');
INSERT INTO `base_provincecityarea` VALUES ('916', '321302', '宿城区', '321300');
INSERT INTO `base_provincecityarea` VALUES ('917', '321311', '宿豫区', '321300');
INSERT INTO `base_provincecityarea` VALUES ('918', '321322', '沭阳县', '321300');
INSERT INTO `base_provincecityarea` VALUES ('919', '321323', '泗阳县', '321300');
INSERT INTO `base_provincecityarea` VALUES ('920', '321324', '泗洪县', '321300');
INSERT INTO `base_provincecityarea` VALUES ('922', '330102', '上城区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('923', '330103', '下城区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('924', '330104', '江干区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('925', '330105', '拱墅区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('926', '330106', '西湖区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('927', '330108', '滨江区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('928', '330109', '萧山区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('929', '330110', '余杭区', '330100');
INSERT INTO `base_provincecityarea` VALUES ('930', '330122', '桐庐县', '330100');
INSERT INTO `base_provincecityarea` VALUES ('931', '330127', '淳安县', '330100');
INSERT INTO `base_provincecityarea` VALUES ('932', '330182', '建德市', '330100');
INSERT INTO `base_provincecityarea` VALUES ('933', '330183', '富阳市', '330100');
INSERT INTO `base_provincecityarea` VALUES ('934', '330185', '临安市', '330100');
INSERT INTO `base_provincecityarea` VALUES ('936', '330203', '海曙区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('937', '330204', '江东区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('938', '330205', '江北区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('939', '330206', '北仑区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('940', '330211', '镇海区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('941', '330212', '鄞州区', '330200');
INSERT INTO `base_provincecityarea` VALUES ('942', '330225', '象山县', '330200');
INSERT INTO `base_provincecityarea` VALUES ('943', '330226', '宁海县', '330200');
INSERT INTO `base_provincecityarea` VALUES ('944', '330281', '余姚市', '330200');
INSERT INTO `base_provincecityarea` VALUES ('945', '330282', '慈溪市', '330200');
INSERT INTO `base_provincecityarea` VALUES ('946', '330283', '奉化市', '330200');
INSERT INTO `base_provincecityarea` VALUES ('948', '330302', '鹿城区', '330300');
INSERT INTO `base_provincecityarea` VALUES ('949', '330303', '龙湾区', '330300');
INSERT INTO `base_provincecityarea` VALUES ('950', '330304', '瓯海区', '330300');
INSERT INTO `base_provincecityarea` VALUES ('951', '330322', '洞头县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('952', '330324', '永嘉县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('953', '330326', '平阳县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('954', '330327', '苍南县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('955', '330328', '文成县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('956', '330329', '泰顺县', '330300');
INSERT INTO `base_provincecityarea` VALUES ('957', '330381', '瑞安市', '330300');
INSERT INTO `base_provincecityarea` VALUES ('958', '330382', '乐清市', '330300');
INSERT INTO `base_provincecityarea` VALUES ('960', '330402', '秀城区', '330400');
INSERT INTO `base_provincecityarea` VALUES ('961', '330411', '秀洲区', '330400');
INSERT INTO `base_provincecityarea` VALUES ('962', '330421', '嘉善县', '330400');
INSERT INTO `base_provincecityarea` VALUES ('963', '330424', '海盐县', '330400');
INSERT INTO `base_provincecityarea` VALUES ('964', '330481', '海宁市', '330400');
INSERT INTO `base_provincecityarea` VALUES ('965', '330482', '平湖市', '330400');
INSERT INTO `base_provincecityarea` VALUES ('966', '330483', '桐乡市', '330400');
INSERT INTO `base_provincecityarea` VALUES ('968', '330502', '吴兴区', '330500');
INSERT INTO `base_provincecityarea` VALUES ('969', '330503', '南浔区', '330500');
INSERT INTO `base_provincecityarea` VALUES ('970', '330521', '德清县', '330500');
INSERT INTO `base_provincecityarea` VALUES ('971', '330522', '长兴县', '330500');
INSERT INTO `base_provincecityarea` VALUES ('972', '330523', '安吉县', '330500');
INSERT INTO `base_provincecityarea` VALUES ('974', '330602', '越城区', '330600');
INSERT INTO `base_provincecityarea` VALUES ('975', '330621', '绍兴县', '330600');
INSERT INTO `base_provincecityarea` VALUES ('976', '330624', '新昌县', '330600');
INSERT INTO `base_provincecityarea` VALUES ('977', '330681', '诸暨市', '330600');
INSERT INTO `base_provincecityarea` VALUES ('978', '330682', '上虞市', '330600');
INSERT INTO `base_provincecityarea` VALUES ('979', '330683', '嵊州市', '330600');
INSERT INTO `base_provincecityarea` VALUES ('981', '330702', '婺城区', '330700');
INSERT INTO `base_provincecityarea` VALUES ('982', '330703', '金东区', '330700');
INSERT INTO `base_provincecityarea` VALUES ('983', '330723', '武义县', '330700');
INSERT INTO `base_provincecityarea` VALUES ('984', '330726', '浦江县', '330700');
INSERT INTO `base_provincecityarea` VALUES ('985', '330727', '磐安县', '330700');
INSERT INTO `base_provincecityarea` VALUES ('986', '330781', '兰溪市', '330700');
INSERT INTO `base_provincecityarea` VALUES ('987', '330782', '义乌市', '330700');
INSERT INTO `base_provincecityarea` VALUES ('988', '330783', '东阳市', '330700');
INSERT INTO `base_provincecityarea` VALUES ('989', '330784', '永康市', '330700');
INSERT INTO `base_provincecityarea` VALUES ('991', '330802', '柯城区', '330800');
INSERT INTO `base_provincecityarea` VALUES ('992', '330803', '衢江区', '330800');
INSERT INTO `base_provincecityarea` VALUES ('993', '330822', '常山县', '330800');
INSERT INTO `base_provincecityarea` VALUES ('994', '330824', '开化县', '330800');
INSERT INTO `base_provincecityarea` VALUES ('995', '330825', '龙游县', '330800');
INSERT INTO `base_provincecityarea` VALUES ('996', '330881', '江山市', '330800');
INSERT INTO `base_provincecityarea` VALUES ('998', '330902', '定海区', '330900');
INSERT INTO `base_provincecityarea` VALUES ('999', '330903', '普陀区', '330900');
INSERT INTO `base_provincecityarea` VALUES ('1000', '330921', '岱山县', '330900');
INSERT INTO `base_provincecityarea` VALUES ('1001', '330922', '嵊泗县', '330900');
INSERT INTO `base_provincecityarea` VALUES ('1003', '331002', '椒江区', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1004', '331003', '黄岩区', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1005', '331004', '路桥区', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1006', '331021', '玉环县', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1007', '331022', '三门县', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1008', '331023', '天台县', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1009', '331024', '仙居县', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1010', '331081', '温岭市', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1011', '331082', '临海市', '331000');
INSERT INTO `base_provincecityarea` VALUES ('1013', '331102', '莲都区', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1014', '331121', '青田县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1015', '331122', '缙云县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1016', '331123', '遂昌县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1017', '331124', '松阳县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1018', '331125', '云和县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1019', '331126', '庆元县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1020', '331127', '景宁畲族自治县', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1021', '331181', '龙泉市', '331100');
INSERT INTO `base_provincecityarea` VALUES ('1023', '340102', '瑶海区', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1024', '340103', '庐阳区', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1025', '340104', '蜀山区', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1026', '340111', '包河区', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1027', '340121', '长丰县', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1028', '340122', '肥东县', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1029', '340123', '肥西县', '340100');
INSERT INTO `base_provincecityarea` VALUES ('1031', '340202', '镜湖区', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1032', '340203', '马塘区', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1033', '340204', '新芜区', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1034', '340207', '鸠江区', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1035', '340221', '芜湖县', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1036', '340222', '繁昌县', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1037', '340223', '南陵县', '340200');
INSERT INTO `base_provincecityarea` VALUES ('1039', '340302', '龙子湖区', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1040', '340303', '蚌山区', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1041', '340304', '禹会区', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1042', '340311', '淮上区', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1043', '340321', '怀远县', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1044', '340322', '五河县', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1045', '340323', '固镇县', '340300');
INSERT INTO `base_provincecityarea` VALUES ('1047', '340402', '大通区', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1048', '340403', '田家庵区', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1049', '340404', '谢家集区', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1050', '340405', '八公山区', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1051', '340406', '潘集区', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1052', '340421', '凤台县', '340400');
INSERT INTO `base_provincecityarea` VALUES ('1054', '340502', '金家庄区', '340500');
INSERT INTO `base_provincecityarea` VALUES ('1055', '340503', '花山区', '340500');
INSERT INTO `base_provincecityarea` VALUES ('1056', '340504', '雨山区', '340500');
INSERT INTO `base_provincecityarea` VALUES ('1057', '340521', '当涂县', '340500');
INSERT INTO `base_provincecityarea` VALUES ('1059', '340602', '杜集区', '340600');
INSERT INTO `base_provincecityarea` VALUES ('1060', '340603', '相山区', '340600');
INSERT INTO `base_provincecityarea` VALUES ('1061', '340604', '烈山区', '340600');
INSERT INTO `base_provincecityarea` VALUES ('1062', '340621', '濉溪县', '340600');
INSERT INTO `base_provincecityarea` VALUES ('1064', '340702', '铜官山区', '340700');
INSERT INTO `base_provincecityarea` VALUES ('1065', '340703', '狮子山区', '340700');
INSERT INTO `base_provincecityarea` VALUES ('1066', '340711', '郊　区', '340700');
INSERT INTO `base_provincecityarea` VALUES ('1067', '340721', '铜陵县', '340700');
INSERT INTO `base_provincecityarea` VALUES ('1069', '340802', '迎江区', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1070', '340803', '大观区', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1071', '340811', '郊　区', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1072', '340822', '怀宁县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1073', '340823', '枞阳县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1074', '340824', '潜山县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1075', '340825', '太湖县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1076', '340826', '宿松县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1077', '340827', '望江县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1078', '340828', '岳西县', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1079', '340881', '桐城市', '340800');
INSERT INTO `base_provincecityarea` VALUES ('1081', '34115002', '屯溪区', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1082', '34115003', '黄山区', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1083', '34115004', '徽州区', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1084', '341021', '歙　县', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1085', '341022', '休宁县', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1086', '341023', '黟　县', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1087', '341024', '祁门县', '34115000');
INSERT INTO `base_provincecityarea` VALUES ('1089', '341102', '琅琊区', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1090', '341103', '南谯区', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1091', '341122', '来安县', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1092', '341124', '全椒县', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1093', '341125', '定远县', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1094', '341126', '凤阳县', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1095', '341181', '天长市', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1096', '341182', '明光市', '341100');
INSERT INTO `base_provincecityarea` VALUES ('1098', '341202', '颍州区', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1099', '341203', '颍东区', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1100', '341204', '颍泉区', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1101', '341221', '临泉县', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1102', '341222', '太和县', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1103', '341225', '阜南县', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1104', '341226', '颍上县', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1105', '341282', '界首市', '341200');
INSERT INTO `base_provincecityarea` VALUES ('1107', '341302', '墉桥区', '341300');
INSERT INTO `base_provincecityarea` VALUES ('1108', '341321', '砀山县', '341300');
INSERT INTO `base_provincecityarea` VALUES ('1109', '341322', '萧　县', '341300');
INSERT INTO `base_provincecityarea` VALUES ('1110', '341323', '灵璧县', '341300');
INSERT INTO `base_provincecityarea` VALUES ('1111', '341324', '泗　县', '341300');
INSERT INTO `base_provincecityarea` VALUES ('1113', '341402', '居巢区', '341400');
INSERT INTO `base_provincecityarea` VALUES ('1114', '341421', '庐江县', '341400');
INSERT INTO `base_provincecityarea` VALUES ('1115', '341422', '无为县', '341400');
INSERT INTO `base_provincecityarea` VALUES ('1116', '341423', '含山县', '341400');
INSERT INTO `base_provincecityarea` VALUES ('1117', '341424', '和　县', '341400');
INSERT INTO `base_provincecityarea` VALUES ('1119', '3402', '金安区', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1120', '3403', '裕安区', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1121', '3421', '寿　县', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1122', '3422', '霍邱县', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1123', '3423', '舒城县', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1124', '3424', '金寨县', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1125', '3425', '霍山县', '3400');
INSERT INTO `base_provincecityarea` VALUES ('1127', '341602', '谯城区', '341600');
INSERT INTO `base_provincecityarea` VALUES ('1128', '341621', '涡阳县', '341600');
INSERT INTO `base_provincecityarea` VALUES ('1129', '341622', '蒙城县', '341600');
INSERT INTO `base_provincecityarea` VALUES ('1130', '341623', '利辛县', '341600');
INSERT INTO `base_provincecityarea` VALUES ('1132', '341702', '贵池区', '341700');
INSERT INTO `base_provincecityarea` VALUES ('1133', '341721', '东至县', '341700');
INSERT INTO `base_provincecityarea` VALUES ('1134', '341722', '石台县', '341700');
INSERT INTO `base_provincecityarea` VALUES ('1135', '341723', '青阳县', '341700');
INSERT INTO `base_provincecityarea` VALUES ('1137', '341802', '宣州区', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1138', '341821', '郎溪县', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1139', '341822', '广德县', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1140', '341823', '泾　县', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1141', '341824', '绩溪县', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1142', '341825', '旌德县', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1143', '341881', '宁国市', '341800');
INSERT INTO `base_provincecityarea` VALUES ('1145', '350102', '鼓楼区', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1146', '350103', '台江区', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1147', '350104', '仓山区', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1148', '350105', '马尾区', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1149', '350111', '晋安区', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1150', '410108', '邙山区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1151', '410106', '上街区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1152', '410122', '中牟县', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1153', '410181', '巩义市', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1154', '410182', '荥阳市', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1155', '410183', '新密市', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1156', '410184', '新郑市', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1157', '410185', '登封市', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1159', '410202', '龙亭区', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1160', '350205', '海沧区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1161', '350206', '湖里区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1162', '350211', '集美区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1163', '350212', '同安区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1164', '350213', '翔安区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1166', '350302', '城厢区', '350300');
INSERT INTO `base_provincecityarea` VALUES ('1167', '350303', '涵江区', '350300');
INSERT INTO `base_provincecityarea` VALUES ('1168', '350304', '荔城区', '350300');
INSERT INTO `base_provincecityarea` VALUES ('1169', '350305', '秀屿区', '350300');
INSERT INTO `base_provincecityarea` VALUES ('1170', '350322', '仙游县', '350300');
INSERT INTO `base_provincecityarea` VALUES ('1172', '350402', '梅列区', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1173', '350403', '三元区', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1174', '350421', '明溪县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1175', '350423', '清流县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1176', '350424', '宁化县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1177', '350425', '大田县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1178', '350426', '尤溪县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1179', '350427', '沙　县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1180', '350428', '将乐县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1181', '350429', '泰宁县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1182', '350430', '建宁县', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1183', '350481', '永安市', '350400');
INSERT INTO `base_provincecityarea` VALUES ('1185', '350502', '鲤城区', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1186', '350503', '丰泽区', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1187', '350504', '洛江区', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1188', '350505', '泉港区', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1189', '350521', '惠安县', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1190', '350524', '安溪县', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1191', '350525', '永春县', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1192', '350526', '德化县', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1193', '350527', '金门县', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1194', '350581', '石狮市', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1195', '350582', '晋江市', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1196', '350583', '南安市', '350500');
INSERT INTO `base_provincecityarea` VALUES ('1198', '350602', '芗城区', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1199', '350603', '龙文区', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1200', '350622', '云霄县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1201', '350623', '漳浦县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1202', '350624', '诏安县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1203', '350625', '长泰县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1204', '350626', '东山县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1205', '350627', '南靖县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1206', '350628', '平和县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1207', '350629', '华安县', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1208', '350681', '龙海市', '350600');
INSERT INTO `base_provincecityarea` VALUES ('1210', '350702', '延平区', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1211', '350721', '顺昌县', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1212', '350722', '浦城县', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1213', '350723', '光泽县', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1214', '350724', '松溪县', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1215', '350725', '政和县', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1216', '350781', '邵武市', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1217', '350782', '武夷山市', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1218', '350783', '建瓯市', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1219', '350784', '建阳市', '350700');
INSERT INTO `base_provincecityarea` VALUES ('1221', '350802', '新罗区', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1222', '350821', '长汀县', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1223', '350822', '永定县', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1224', '350823', '上杭县', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1225', '350824', '武平县', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1226', '350825', '连城县', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1227', '350881', '漳平市', '350800');
INSERT INTO `base_provincecityarea` VALUES ('1229', '350902', '蕉城区', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1230', '350921', '霞浦县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1231', '350922', '古田县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1232', '350923', '屏南县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1233', '350924', '寿宁县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1234', '350925', '周宁县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1235', '350926', '柘荣县', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1236', '350981', '福安市', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1237', '350982', '福鼎市', '350900');
INSERT INTO `base_provincecityarea` VALUES ('1239', '360102', '东湖区', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1240', '360103', '西湖区', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1241', '360104', '青云谱区', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1242', '360105', '湾里区', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1243', '360111', '青山湖区', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1244', '360121', '南昌县', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1245', '360122', '新建县', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1246', '360123', '安义县', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1247', '360124', '进贤县', '360100');
INSERT INTO `base_provincecityarea` VALUES ('1249', '360202', '昌江区', '360200');
INSERT INTO `base_provincecityarea` VALUES ('1250', '360203', '珠山区', '360200');
INSERT INTO `base_provincecityarea` VALUES ('1251', '360222', '浮梁县', '360200');
INSERT INTO `base_provincecityarea` VALUES ('1252', '360281', '乐平市', '360200');
INSERT INTO `base_provincecityarea` VALUES ('1254', '360302', '安源区', '360300');
INSERT INTO `base_provincecityarea` VALUES ('1255', '360313', '湘东区', '360300');
INSERT INTO `base_provincecityarea` VALUES ('1256', '360321', '莲花县', '360300');
INSERT INTO `base_provincecityarea` VALUES ('1257', '360322', '上栗县', '360300');
INSERT INTO `base_provincecityarea` VALUES ('1258', '360323', '芦溪县', '360300');
INSERT INTO `base_provincecityarea` VALUES ('1260', '360402', '庐山区', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1261', '360403', '浔阳区', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1262', '360421', '九江县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1263', '360423', '武宁县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1264', '360424', '修水县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1265', '360425', '永修县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1266', '360426', '德安县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1267', '360427', '星子县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1268', '360428', '都昌县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1269', '360429', '湖口县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1270', '360430', '彭泽县', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1271', '360481', '瑞昌市', '360400');
INSERT INTO `base_provincecityarea` VALUES ('1273', '360502', '渝水区', '360500');
INSERT INTO `base_provincecityarea` VALUES ('1274', '360521', '分宜县', '360500');
INSERT INTO `base_provincecityarea` VALUES ('1276', '360602', '月湖区', '360600');
INSERT INTO `base_provincecityarea` VALUES ('1277', '360622', '余江县', '360600');
INSERT INTO `base_provincecityarea` VALUES ('1278', '360681', '贵溪市', '360600');
INSERT INTO `base_provincecityarea` VALUES ('1280', '360702', '章贡区', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1281', '360721', '赣　县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1282', '360722', '信丰县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1283', '360723', '大余县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1284', '360724', '上犹县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1285', '360725', '崇义县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1286', '360726', '安远县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1287', '360727', '龙南县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1288', '360728', '定南县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1289', '360729', '全南县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1290', '360730', '宁都县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1291', '360731', '于都县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1292', '360732', '兴国县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1293', '360733', '会昌县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1294', '360734', '寻乌县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1295', '360735', '石城县', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1296', '360781', '瑞金市', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1297', '360782', '南康市', '360700');
INSERT INTO `base_provincecityarea` VALUES ('1299', '360802', '吉州区', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1300', '360803', '青原区', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1301', '360821', '吉安县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1302', '360822', '吉水县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1303', '360823', '峡江县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1304', '360824', '新干县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1305', '360825', '永丰县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1306', '360826', '泰和县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1307', '360827', '遂川县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1308', '360828', '万安县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1309', '360829', '安福县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1310', '360830', '永新县', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1311', '360881', '井冈山市', '360800');
INSERT INTO `base_provincecityarea` VALUES ('1313', '360902', '袁州区', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1314', '360921', '奉新县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1315', '360922', '万载县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1316', '360923', '上高县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1317', '360924', '宜丰县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1318', '360925', '靖安县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1319', '360926', '铜鼓县', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1320', '360981', '丰城市', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1321', '360982', '樟树市', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1322', '360983', '高安市', '360900');
INSERT INTO `base_provincecityarea` VALUES ('1324', '361002', '临川区', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1325', '361021', '南城县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1326', '361022', '黎川县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1327', '361023', '南丰县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1328', '361024', '崇仁县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1329', '361025', '乐安县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1330', '361026', '宜黄县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1331', '361027', '金溪县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1332', '361028', '资溪县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1333', '361029', '东乡县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1334', '361030', '广昌县', '361000');
INSERT INTO `base_provincecityarea` VALUES ('1336', '361102', '信州区', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1337', '361121', '上饶县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1338', '361122', '广丰县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1339', '361123', '玉山县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1340', '361124', '铅山县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1341', '361125', '横峰县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1342', '361126', '弋阳县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1343', '361127', '余干县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1344', '361128', '鄱阳县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1345', '361129', '万年县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1346', '361130', '婺源县', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1347', '361181', '德兴市', '361100');
INSERT INTO `base_provincecityarea` VALUES ('1349', '370102', '历下区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1350', '370103', '市中区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1351', '370104', '槐荫区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1352', '370105', '天桥区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1353', '370112', '历城区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1354', '370113', '长清区', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1355', '370124', '平阴县', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1356', '370125', '济阳县', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1357', '370126', '商河县', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1358', '370181', '章丘市', '370100');
INSERT INTO `base_provincecityarea` VALUES ('1360', '370202', '市南区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1361', '370203', '市北区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1362', '370205', '四方区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1363', '370211', '黄岛区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1364', '370212', '崂山区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1365', '370213', '李沧区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1366', '370214', '城阳区', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1367', '370281', '胶州市', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1368', '370282', '即墨市', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1369', '370283', '平度市', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1370', '370284', '胶南市', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1371', '370285', '莱西市', '370200');
INSERT INTO `base_provincecityarea` VALUES ('1373', '370302', '淄川区', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1374', '370303', '张店区', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1375', '370304', '博山区', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1376', '370305', '临淄区', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1377', '370306', '周村区', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1378', '370321', '桓台县', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1379', '370322', '高青县', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1380', '370323', '沂源县', '370300');
INSERT INTO `base_provincecityarea` VALUES ('1382', '370402', '市中区', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1383', '370403', '薛城区', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1384', '370404', '峄城区', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1385', '370405', '台儿庄区', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1386', '370406', '山亭区', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1387', '370481', '滕州市', '370400');
INSERT INTO `base_provincecityarea` VALUES ('1389', '370502', '东营区', '370500');
INSERT INTO `base_provincecityarea` VALUES ('1390', '370503', '河口区', '370500');
INSERT INTO `base_provincecityarea` VALUES ('1391', '370521', '垦利县', '370500');
INSERT INTO `base_provincecityarea` VALUES ('1392', '370522', '利津县', '370500');
INSERT INTO `base_provincecityarea` VALUES ('1393', '370523', '广饶县', '370500');
INSERT INTO `base_provincecityarea` VALUES ('1395', '370602', '芝罘区', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1396', '370611', '福山区', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1397', '370612', '牟平区', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1398', '370613', '莱山区', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1399', '370634', '长岛县', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1400', '370681', '龙口市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1401', '370682', '莱阳市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1402', '370683', '莱州市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1403', '370684', '蓬莱市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1404', '370685', '招远市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1405', '370686', '栖霞市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1406', '370687', '海阳市', '370600');
INSERT INTO `base_provincecityarea` VALUES ('1408', '370702', '潍城区', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1409', '370703', '寒亭区', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1410', '370704', '坊子区', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1411', '370705', '奎文区', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1412', '370724', '临朐县', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1413', '370725', '昌乐县', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1414', '370781', '青州市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1415', '370782', '诸城市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1416', '370783', '寿光市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1417', '370784', '安丘市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1418', '370785', '高密市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1419', '370786', '昌邑市', '370700');
INSERT INTO `base_provincecityarea` VALUES ('1421', '370802', '市中区', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1422', '370811', '任城区', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1423', '370826', '微山县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1424', '370827', '鱼台县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1425', '370828', '金乡县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1426', '370829', '嘉祥县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1427', '370830', '汶上县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1428', '370831', '泗水县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1429', '370832', '梁山县', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1430', '370881', '曲阜市', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1431', '370882', '兖州市', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1432', '370883', '邹城市', '370800');
INSERT INTO `base_provincecityarea` VALUES ('1434', '370902', '泰山区', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1435', '370903', '岱岳区', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1436', '370921', '宁阳县', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1437', '370923', '东平县', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1438', '370982', '新泰市', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1439', '370983', '肥城市', '370900');
INSERT INTO `base_provincecityarea` VALUES ('1441', '371002', '环翠区', '371000');
INSERT INTO `base_provincecityarea` VALUES ('1442', '371081', '文登市', '371000');
INSERT INTO `base_provincecityarea` VALUES ('1443', '371082', '荣成市', '371000');
INSERT INTO `base_provincecityarea` VALUES ('1444', '371083', '乳山市', '371000');
INSERT INTO `base_provincecityarea` VALUES ('1446', '371102', '东港区', '371100');
INSERT INTO `base_provincecityarea` VALUES ('1447', '371103', '岚山区', '371100');
INSERT INTO `base_provincecityarea` VALUES ('1448', '371121', '五莲县', '371100');
INSERT INTO `base_provincecityarea` VALUES ('1449', '371122', '莒　县', '371100');
INSERT INTO `base_provincecityarea` VALUES ('1450', '371201', '市辖1区', '371200');
INSERT INTO `base_provincecityarea` VALUES ('1451', '371202', '莱城区', '371200');
INSERT INTO `base_provincecityarea` VALUES ('1452', '371203', '钢城区', '371200');
INSERT INTO `base_provincecityarea` VALUES ('1454', '371302', '兰山区', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1455', '371311', '罗庄区', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1456', '371312', '河东区', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1457', '371321', '沂南县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1458', '371322', '郯城县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1459', '371323', '沂水县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1460', '371324', '苍山县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1461', '371325', '费　县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1462', '371326', '平邑县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1463', '371327', '莒南县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1464', '371328', '蒙阴县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1465', '371329', '临沭县', '371300');
INSERT INTO `base_provincecityarea` VALUES ('1467', '371402', '德城区', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1468', '371421', '陵　县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1469', '371422', '宁津县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1470', '371423', '庆云县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1471', '371424', '临邑县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1472', '371425', '齐河县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1473', '371426', '平原县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1474', '371427', '夏津县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1475', '371428', '武城县', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1476', '371481', '乐陵市', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1477', '371482', '禹城市', '371400');
INSERT INTO `base_provincecityarea` VALUES ('1479', '3702', '东昌府区', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1480', '3721', '阳谷县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1481', '3722', '莘　县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1482', '3723', '茌平县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1483', '3724', '东阿县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1484', '3725', '冠　县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1485', '3726', '高唐县', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1486', '3781', '临清市', '3700');
INSERT INTO `base_provincecityarea` VALUES ('1488', '371602', '滨城区', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1489', '371621', '惠民县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1490', '371622', '阳信县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1491', '371623', '无棣县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1492', '371624', '沾化县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1493', '371625', '博兴县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1494', '371626', '邹平县', '371600');
INSERT INTO `base_provincecityarea` VALUES ('1496', '371702', '牡丹区', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1497', '371721', '曹　县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1498', '371722', '单　县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1499', '371723', '成武县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1500', '371724', '巨野县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1501', '371725', '郓城县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1502', '371726', '鄄城县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1503', '371727', '定陶县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1504', '371728', '东明县', '371700');
INSERT INTO `base_provincecityarea` VALUES ('1506', '410102', '中原区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1507', '410103', '二七区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1508', '410104', '管城回族区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1509', '410105', '金水区', '410100');
INSERT INTO `base_provincecityarea` VALUES ('1510', '350121', '闽侯县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1511', '350122', '连江县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1512', '350123', '罗源县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1513', '350124', '闽清县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1514', '350125', '永泰县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1515', '350128', '平潭县', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1516', '350181', '福清市', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1517', '350182', '长乐市', '350100');
INSERT INTO `base_provincecityarea` VALUES ('1519', '350203', '思明区', '350200');
INSERT INTO `base_provincecityarea` VALUES ('1520', '410203', '顺河回族区', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1521', '410204', '鼓楼区', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1522', '410205', '南关区', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1523', '410211', '郊　区', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1524', '410221', '杞　县', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1525', '410222', '通许县', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1526', '410223', '尉氏县', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1527', '410224', '开封县', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1528', '410225', '兰考县', '410200');
INSERT INTO `base_provincecityarea` VALUES ('1530', '410302', '老城区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1531', '410303', '西工区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1532', '410304', '廛河回族区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1533', '410305', '涧西区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1534', '410306', '吉利区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1535', '410307', '洛龙区', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1536', '410322', '孟津县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1537', '410323', '新安县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1538', '410324', '栾川县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1539', '410325', '嵩　县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1540', '410326', '汝阳县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1541', '410327', '宜阳县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1542', '410328', '洛宁县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1543', '410329', '伊川县', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1544', '410381', '偃师市', '410300');
INSERT INTO `base_provincecityarea` VALUES ('1546', '410402', '新华区', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1547', '410403', '卫东区', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1548', '410404', '石龙区', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1549', '410411', '湛河区', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1550', '410421', '宝丰县', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1551', '410422', '叶　县', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1552', '410423', '鲁山县', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1553', '410425', '郏　县', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1554', '410481', '舞钢市', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1555', '410482', '汝州市', '410400');
INSERT INTO `base_provincecityarea` VALUES ('1557', '410502', '文峰区', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1558', '410503', '北关区', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1559', '410505', '殷都区', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1560', '410506', '龙安区', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1561', '410522', '安阳县', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1562', '410523', '汤阴县', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1563', '410526', '滑　县', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1564', '410527', '内黄县', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1565', '410581', '林州市', '410500');
INSERT INTO `base_provincecityarea` VALUES ('1567', '410602', '鹤山区', '410600');
INSERT INTO `base_provincecityarea` VALUES ('1568', '410603', '山城区', '410600');
INSERT INTO `base_provincecityarea` VALUES ('1569', '410611', '淇滨区', '410600');
INSERT INTO `base_provincecityarea` VALUES ('1570', '410621', '浚　县', '410600');
INSERT INTO `base_provincecityarea` VALUES ('1571', '410622', '淇　县', '410600');
INSERT INTO `base_provincecityarea` VALUES ('1573', '410702', '红旗区', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1574', '410703', '卫滨区', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1575', '410704', '凤泉区', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1576', '410711', '牧野区', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1577', '410721', '新乡县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1578', '410724', '获嘉县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1579', '410725', '原阳县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1580', '410726', '延津县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1581', '410727', '封丘县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1582', '410728', '长垣县', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1583', '410781', '卫辉市', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1584', '410782', '辉县市', '410700');
INSERT INTO `base_provincecityarea` VALUES ('1586', '410802', '解放区', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1587', '410803', '中站区', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1588', '410804', '马村区', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1589', '410811', '山阳区', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1590', '410821', '修武县', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1591', '410822', '博爱县', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1592', '410823', '武陟县', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1593', '410825', '温县', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1594', '410881', '济源市', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1595', '410882', '沁阳市', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1596', '410883', '孟州市', '410800');
INSERT INTO `base_provincecityarea` VALUES ('1598', '410902', '华龙区', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1599', '410922', '清丰县', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1600', '410923', '南乐县', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1601', '410926', '范　县', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1602', '410927', '台前县', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1603', '410928', '濮阳县', '410900');
INSERT INTO `base_provincecityarea` VALUES ('1605', '411002', '魏都区', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1606', '411023', '许昌县', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1607', '411024', '鄢陵县', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1608', '411025', '襄城县', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1609', '411081', '禹州市', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1610', '411082', '长葛市', '411000');
INSERT INTO `base_provincecityarea` VALUES ('1612', '411102', '源汇区', '411100');
INSERT INTO `base_provincecityarea` VALUES ('1613', '411103', '郾城区', '411100');
INSERT INTO `base_provincecityarea` VALUES ('1614', '411104', '召陵区', '411100');
INSERT INTO `base_provincecityarea` VALUES ('1615', '411121', '舞阳县', '411100');
INSERT INTO `base_provincecityarea` VALUES ('1616', '411122', '临颍县', '411100');
INSERT INTO `base_provincecityarea` VALUES ('1618', '411202', '湖滨区', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1619', '411221', '渑池县', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1620', '411222', '陕　县', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1621', '411224', '卢氏县', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1622', '411281', '义马市', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1623', '411282', '灵宝市', '411200');
INSERT INTO `base_provincecityarea` VALUES ('1625', '411302', '宛城区', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1626', '411303', '卧龙区', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1627', '411321', '南召县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1628', '411322', '方城县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1629', '411323', '西峡县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1630', '411324', '镇平县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1631', '411325', '内乡县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1632', '411326', '淅川县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1633', '411327', '社旗县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1634', '411328', '唐河县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1635', '411329', '新野县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1636', '411330', '桐柏县', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1637', '411381', '邓州市', '411300');
INSERT INTO `base_provincecityarea` VALUES ('1639', '411402', '梁园区', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1640', '411403', '睢阳区', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1641', '411421', '民权县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1642', '411422', '睢　县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1643', '411423', '宁陵县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1644', '411424', '柘城县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1645', '411425', '虞城县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1646', '411426', '夏邑县', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1647', '411481', '永城市', '411400');
INSERT INTO `base_provincecityarea` VALUES ('1649', '411501', '狮河区', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1650', '411502', '平桥区', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1651', '411503', '罗山县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1652', '411504', '光山县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1653', '411505', '新　县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1654', '411506', '商城县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1655', '411507', '固始县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1656', '411508', '潢川县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1657', '411509', '淮滨县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1658', '411510', '息　县', '411500');
INSERT INTO `base_provincecityarea` VALUES ('1660', '411602', '川汇区', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1661', '411621', '扶沟县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1662', '411622', '西华县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1663', '411623', '商水县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1664', '411624', '沈丘县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1665', '411625', '郸城县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1666', '411626', '淮阳县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1667', '411627', '太康县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1668', '411628', '鹿邑县', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1669', '411681', '项城市', '411600');
INSERT INTO `base_provincecityarea` VALUES ('1671', '411702', '驿城区', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1672', '411721', '西平县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1673', '411722', '上蔡县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1674', '411723', '平舆县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1675', '411724', '正阳县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1676', '411725', '确山县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1677', '411726', '泌阳县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1678', '411727', '汝南县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1679', '411728', '遂平县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1680', '411729', '新蔡县', '411700');
INSERT INTO `base_provincecityarea` VALUES ('1682', '420102', '江岸区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1683', '420103', '江汉区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1684', '420104', '乔口区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1685', '420105', '汉阳区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1686', '420106', '武昌区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1687', '420107', '青山区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1688', '420111', '洪山区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1689', '420112', '东西湖区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1690', '420113', '汉南区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1691', '420114', '蔡甸区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1692', '420115', '江夏区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1693', '420116', '黄陂区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1694', '420117', '新洲区', '420100');
INSERT INTO `base_provincecityarea` VALUES ('1696', '420202', '黄石港区', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1697', '420203', '西塞山区', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1698', '420204', '下陆区', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1699', '420205', '铁山区', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1700', '420222', '阳新县', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1701', '420281', '大冶市', '420200');
INSERT INTO `base_provincecityarea` VALUES ('1703', '420302', '茅箭区', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1704', '420303', '张湾区', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1705', '420321', '郧　县', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1706', '420322', '郧西县', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1707', '420323', '竹山县', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1708', '420324', '竹溪县', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1709', '420325', '房　县', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1710', '420381', '丹江口市', '420300');
INSERT INTO `base_provincecityarea` VALUES ('1712', '420502', '西陵区', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1713', '420503', '伍家岗区', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1714', '420504', '点军区', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1715', '420505', '猇亭区', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1716', '420506', '夷陵区', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1717', '420525', '远安县', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1718', '420526', '兴山县', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1719', '420527', '秭归县', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1720', '420528', '长阳土家族自治县', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1721', '420529', '五峰土家族自治县', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1722', '420581', '宜都市', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1723', '420582', '当阳市', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1724', '420583', '枝江市', '420500');
INSERT INTO `base_provincecityarea` VALUES ('1726', '420602', '襄城区', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1727', '420606', '樊城区', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1728', '420607', '襄阳区', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1729', '420624', '南漳县', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1730', '420625', '谷城县', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1731', '420626', '保康县', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1732', '420682', '老河口市', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1733', '420683', '枣阳市', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1734', '420684', '宜城市', '420600');
INSERT INTO `base_provincecityarea` VALUES ('1736', '420702', '梁子湖区', '420700');
INSERT INTO `base_provincecityarea` VALUES ('1737', '420703', '华容区', '420700');
INSERT INTO `base_provincecityarea` VALUES ('1738', '420704', '鄂城区', '420700');
INSERT INTO `base_provincecityarea` VALUES ('1740', '420802', '东宝区', '420800');
INSERT INTO `base_provincecityarea` VALUES ('1741', '420804', '掇刀区', '420800');
INSERT INTO `base_provincecityarea` VALUES ('1742', '420821', '京山县', '420800');
INSERT INTO `base_provincecityarea` VALUES ('1743', '420822', '沙洋县', '420800');
INSERT INTO `base_provincecityarea` VALUES ('1744', '420881', '钟祥市', '420800');
INSERT INTO `base_provincecityarea` VALUES ('1746', '420902', '孝南区', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1747', '420921', '孝昌县', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1748', '420922', '大悟县', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1749', '420923', '云梦县', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1750', '420981', '应城市', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1751', '420982', '安陆市', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1752', '420984', '汉川市', '420900');
INSERT INTO `base_provincecityarea` VALUES ('1754', '421002', '沙市区', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1755', '421003', '荆州区', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1756', '421022', '公安县', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1757', '421023', '监利县', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1758', '421024', '江陵县', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1759', '421081', '石首市', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1760', '421083', '洪湖市', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1761', '421087', '松滋市', '421000');
INSERT INTO `base_provincecityarea` VALUES ('1763', '421102', '黄州区', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1764', '421121', '团风县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1765', '421122', '红安县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1766', '421123', '罗田县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1767', '421124', '英山县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1768', '421125', '浠水县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1769', '421126', '蕲春县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1770', '421127', '黄梅县', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1771', '421181', '麻城市', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1772', '421182', '武穴市', '421100');
INSERT INTO `base_provincecityarea` VALUES ('1774', '421202', '咸安区', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1775', '421221', '嘉鱼县', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1776', '421222', '通城县', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1777', '421223', '崇阳县', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1778', '421224', '通山县', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1779', '421281', '赤壁市', '421200');
INSERT INTO `base_provincecityarea` VALUES ('1781', '421302', '曾都区', '421300');
INSERT INTO `base_provincecityarea` VALUES ('1782', '421381', '广水市', '421300');
INSERT INTO `base_provincecityarea` VALUES ('1783', '422801', '恩施市', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1784', '422802', '利川市', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1785', '422822', '建始县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1786', '422823', '巴东县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1787', '422825', '宣恩县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1788', '422826', '咸丰县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1789', '422827', '来凤县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1790', '422828', '鹤峰县', '422800');
INSERT INTO `base_provincecityarea` VALUES ('1791', '429004', '仙桃市', '429000');
INSERT INTO `base_provincecityarea` VALUES ('1792', '429005', '潜江市', '429000');
INSERT INTO `base_provincecityarea` VALUES ('1793', '429006', '天门市', '429000');
INSERT INTO `base_provincecityarea` VALUES ('1794', '429021', '神农架林区', '429000');
INSERT INTO `base_provincecityarea` VALUES ('1796', '430102', '芙蓉区', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1797', '430103', '天心区', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1798', '430104', '岳麓区', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1799', '430105', '开福区', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1800', '430111', '雨花区', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1801', '430121', '长沙县', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1802', '430122', '望城县', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1803', '430124', '宁乡县', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1804', '430181', '浏阳市', '430100');
INSERT INTO `base_provincecityarea` VALUES ('1806', '430202', '荷塘区', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1807', '430203', '芦淞区', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1808', '430204', '石峰区', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1809', '430211', '天元区', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1810', '430221', '株洲县', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1811', '430223', '攸　县', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1812', '430224', '茶陵县', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1813', '430225', '炎陵县', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1814', '430281', '醴陵市', '430200');
INSERT INTO `base_provincecityarea` VALUES ('1816', '430302', '雨湖区', '430300');
INSERT INTO `base_provincecityarea` VALUES ('1817', '430304', '岳塘区', '430300');
INSERT INTO `base_provincecityarea` VALUES ('1818', '430321', '湘潭县', '430300');
INSERT INTO `base_provincecityarea` VALUES ('1819', '430381', '湘乡市', '430300');
INSERT INTO `base_provincecityarea` VALUES ('1820', '430382', '韶山市', '430300');
INSERT INTO `base_provincecityarea` VALUES ('1822', '430405', '珠晖区', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1823', '430406', '雁峰区', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1824', '430407', '石鼓区', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1825', '430408', '蒸湘区', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1826', '430412', '南岳区', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1827', '430421', '衡阳县', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1828', '430422', '衡南县', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1829', '430423', '衡山县', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1830', '430424', '衡东县', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1831', '430426', '祁东县', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1832', '430481', '耒阳市', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1833', '430482', '常宁市', '430400');
INSERT INTO `base_provincecityarea` VALUES ('1835', '430502', '双清区', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1836', '430503', '大祥区', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1837', '430511', '北塔区', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1838', '430521', '邵东县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1839', '430522', '新邵县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1840', '430523', '邵阳县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1841', '430524', '隆回县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1842', '430525', '洞口县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1843', '430527', '绥宁县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1844', '430528', '新宁县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1845', '430529', '城步苗族自治县', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1846', '430581', '武冈市', '430500');
INSERT INTO `base_provincecityarea` VALUES ('1848', '430602', '岳阳楼区', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1849', '430603', '云溪区', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1850', '430611', '君山区', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1851', '430621', '岳阳县', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1852', '430623', '华容县', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1853', '430624', '湘阴县', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1854', '430626', '平江县', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1855', '430681', '汨罗市', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1856', '430682', '临湘市', '430600');
INSERT INTO `base_provincecityarea` VALUES ('1858', '430702', '武陵区', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1859', '430703', '鼎城区', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1860', '430721', '安乡县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1861', '430722', '汉寿县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1862', '430723', '澧　县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1863', '430724', '临澧县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1864', '430725', '桃源县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1865', '430726', '石门县', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1866', '430781', '津市市', '430700');
INSERT INTO `base_provincecityarea` VALUES ('1868', '430802', '永定区', '430800');
INSERT INTO `base_provincecityarea` VALUES ('1869', '430811', '武陵源区', '430800');
INSERT INTO `base_provincecityarea` VALUES ('1870', '430821', '慈利县', '430800');
INSERT INTO `base_provincecityarea` VALUES ('1871', '430822', '桑植县', '430800');
INSERT INTO `base_provincecityarea` VALUES ('1873', '430902', '资阳区', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1874', '430903', '赫山区', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1875', '430921', '南　县', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1876', '430922', '桃江县', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1877', '430923', '安化县', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1878', '430981', '沅江市', '430900');
INSERT INTO `base_provincecityarea` VALUES ('1880', '431002', '北湖区', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1881', '431003', '苏仙区', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1882', '431021', '桂阳县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1883', '431022', '宜章县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1884', '431023', '永兴县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1885', '431024', '嘉禾县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1886', '431025', '临武县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1887', '431026', '汝城县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1888', '431027', '桂东县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1889', '431028', '安仁县', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1890', '431081', '资兴市', '431000');
INSERT INTO `base_provincecityarea` VALUES ('1892', '431102', '芝山区', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1893', '431103', '冷水滩区', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1894', '431121', '祁阳县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1895', '431122', '东安县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1896', '431123', '双牌县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1897', '431124', '道　县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1898', '431125', '江永县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1899', '431126', '宁远县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1900', '431127', '蓝山县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1901', '431128', '新田县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1902', '431129', '江华瑶族自治县', '431100');
INSERT INTO `base_provincecityarea` VALUES ('1904', '431202', '鹤城区', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1905', '431221', '中方县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1906', '431222', '沅陵县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1907', '431223', '辰溪县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1908', '431224', '溆浦县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1909', '431225', '会同县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1910', '431226', '麻阳苗族自治县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1911', '431227', '新晃侗族自治县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1912', '431228', '芷江侗族自治县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1913', '431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1914', '431230', '通道侗族自治县', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1915', '431281', '洪江市', '431200');
INSERT INTO `base_provincecityarea` VALUES ('1917', '431302', '娄星区', '431300');
INSERT INTO `base_provincecityarea` VALUES ('1918', '431321', '双峰县', '431300');
INSERT INTO `base_provincecityarea` VALUES ('1919', '431322', '新化县', '431300');
INSERT INTO `base_provincecityarea` VALUES ('1920', '431381', '冷水江市', '431300');
INSERT INTO `base_provincecityarea` VALUES ('1921', '431382', '涟源市', '431300');
INSERT INTO `base_provincecityarea` VALUES ('1922', '433101', '吉首市', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1923', '433122', '泸溪县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1924', '433123', '凤凰县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1925', '433124', '花垣县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1926', '433125', '保靖县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1927', '433126', '古丈县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1928', '433127', '永顺县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1929', '433130', '龙山县', '433100');
INSERT INTO `base_provincecityarea` VALUES ('1931', '440102', '东山区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1932', '440103', '荔湾区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1933', '440104', '越秀区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1934', '440105', '海珠区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1935', '440106', '天河区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1936', '440107', '芳村区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1937', '440111', '白云区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1938', '440112', '黄埔区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1939', '440113', '番禺区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1940', '440114', '花都区', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1941', '440183', '增城市', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1942', '440184', '从化市', '440100');
INSERT INTO `base_provincecityarea` VALUES ('1944', '440203', '武江区', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1945', '440204', '浈江区', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1946', '440205', '曲江区', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1947', '440222', '始兴县', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1948', '440224', '仁化县', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1949', '440229', '翁源县', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1950', '440232', '乳源瑶族自治县', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1951', '440233', '新丰县', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1952', '440281', '乐昌市', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1953', '440282', '南雄市', '440200');
INSERT INTO `base_provincecityarea` VALUES ('1955', '440303', '罗湖区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1956', '440304', '福田区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1957', '440305', '南山区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1958', '440306', '宝安区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1959', '440307', '龙岗区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1960', '440308', '盐田区', '440300');
INSERT INTO `base_provincecityarea` VALUES ('1962', '440402', '香洲区', '440400');
INSERT INTO `base_provincecityarea` VALUES ('1963', '440403', '斗门区', '440400');
INSERT INTO `base_provincecityarea` VALUES ('1964', '440404', '金湾区', '440400');
INSERT INTO `base_provincecityarea` VALUES ('1966', '440507', '龙湖区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1967', '440511', '金平区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1968', '440512', '濠江区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1969', '440513', '潮阳区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1970', '440514', '潮南区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1971', '4405', '澄海区', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1972', '440523', '南澳县', '440500');
INSERT INTO `base_provincecityarea` VALUES ('1974', '440604', '禅城区', '440600');
INSERT INTO `base_provincecityarea` VALUES ('1975', '440605', '南海区', '440600');
INSERT INTO `base_provincecityarea` VALUES ('1976', '440606', '顺德区', '440600');
INSERT INTO `base_provincecityarea` VALUES ('1977', '440607', '三水区', '440600');
INSERT INTO `base_provincecityarea` VALUES ('1978', '440608', '高明区', '440600');
INSERT INTO `base_provincecityarea` VALUES ('1980', '440703', '蓬江区', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1981', '440704', '江海区', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1982', '440705', '新会区', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1983', '440781', '台山市', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1984', '440783', '开平市', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1985', '440784', '鹤山市', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1986', '440785', '恩平市', '440700');
INSERT INTO `base_provincecityarea` VALUES ('1988', '440802', '赤坎区', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1989', '440803', '霞山区', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1990', '440804', '坡头区', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1991', '440811', '麻章区', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1992', '440823', '遂溪县', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1993', '440825', '徐闻县', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1994', '440881', '廉江市', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1995', '440882', '雷州市', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1996', '440883', '吴川市', '440800');
INSERT INTO `base_provincecityarea` VALUES ('1998', '440902', '茂南区', '440900');
INSERT INTO `base_provincecityarea` VALUES ('1999', '440903', '茂港区', '440900');
INSERT INTO `base_provincecityarea` VALUES ('2000', '440923', '电白县', '440900');
INSERT INTO `base_provincecityarea` VALUES ('2001', '440981', '高州市', '440900');
INSERT INTO `base_provincecityarea` VALUES ('2002', '440982', '化州市', '440900');
INSERT INTO `base_provincecityarea` VALUES ('2003', '440983', '信宜市', '440900');
INSERT INTO `base_provincecityarea` VALUES ('2005', '441202', '端州区', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2006', '441203', '鼎湖区', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2007', '441223', '广宁县', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2008', '441224', '怀集县', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2009', '441225', '封开县', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2010', '441226', '德庆县', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2011', '441283', '高要市', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2012', '441284', '四会市', '441200');
INSERT INTO `base_provincecityarea` VALUES ('2014', '441302', '惠城区', '441300');
INSERT INTO `base_provincecityarea` VALUES ('2015', '441303', '惠阳区', '441300');
INSERT INTO `base_provincecityarea` VALUES ('2016', '441322', '博罗县', '441300');
INSERT INTO `base_provincecityarea` VALUES ('2017', '441323', '惠东县', '441300');
INSERT INTO `base_provincecityarea` VALUES ('2018', '441324', '龙门县', '441300');
INSERT INTO `base_provincecityarea` VALUES ('2020', '441402', '梅江区', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2021', '441421', '梅　县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2022', '441422', '大埔县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2023', '441423', '丰顺县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2024', '441424', '五华县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2025', '441426', '平远县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2026', '441427', '蕉岭县', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2027', '441481', '兴宁市', '441400');
INSERT INTO `base_provincecityarea` VALUES ('2029', '4402', '城　区', '4400');
INSERT INTO `base_provincecityarea` VALUES ('2030', '4421', '海丰县', '4400');
INSERT INTO `base_provincecityarea` VALUES ('2031', '4423', '陆河县', '4400');
INSERT INTO `base_provincecityarea` VALUES ('2032', '4481', '陆丰市', '4400');
INSERT INTO `base_provincecityarea` VALUES ('2034', '441602', '源城区', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2035', '441621', '紫金县', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2036', '441622', '龙川县', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2037', '441623', '连平县', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2038', '441624', '和平县', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2039', '441625', '东源县', '441600');
INSERT INTO `base_provincecityarea` VALUES ('2041', '441702', '江城区', '441700');
INSERT INTO `base_provincecityarea` VALUES ('2042', '441721', '阳西县', '441700');
INSERT INTO `base_provincecityarea` VALUES ('2043', '441723', '阳东县', '441700');
INSERT INTO `base_provincecityarea` VALUES ('2044', '441781', '阳春市', '441700');
INSERT INTO `base_provincecityarea` VALUES ('2046', '441802', '清城区', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2047', '441821', '佛冈县', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2048', '441823', '阳山县', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2049', '441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2050', '441826', '连南瑶族自治县', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2051', '441827', '清新县', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2052', '441881', '英德市', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2053', '441882', '连州市', '441800');
INSERT INTO `base_provincecityarea` VALUES ('2055', '445102', '湘桥区', '445100');
INSERT INTO `base_provincecityarea` VALUES ('2056', '445121', '潮安县', '445100');
INSERT INTO `base_provincecityarea` VALUES ('2057', '445122', '饶平县', '445100');
INSERT INTO `base_provincecityarea` VALUES ('2059', '445202', '榕城区', '445200');
INSERT INTO `base_provincecityarea` VALUES ('2060', '445221', '揭东县', '445200');
INSERT INTO `base_provincecityarea` VALUES ('2061', '445222', '揭西县', '445200');
INSERT INTO `base_provincecityarea` VALUES ('2062', '445224', '惠来县', '445200');
INSERT INTO `base_provincecityarea` VALUES ('2063', '445281', '普宁市', '445200');
INSERT INTO `base_provincecityarea` VALUES ('2065', '445302', '云城区', '445300');
INSERT INTO `base_provincecityarea` VALUES ('2066', '445321', '新兴县', '445300');
INSERT INTO `base_provincecityarea` VALUES ('2067', '445322', '郁南县', '445300');
INSERT INTO `base_provincecityarea` VALUES ('2068', '445323', '云安县', '445300');
INSERT INTO `base_provincecityarea` VALUES ('2069', '445381', '罗定市', '445300');
INSERT INTO `base_provincecityarea` VALUES ('2071', '450102', '兴宁区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2072', '450103', '青秀区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2073', '450105', '江南区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2074', '450107', '西乡塘区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2075', '450108', '良庆区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2076', '450109', '邕宁区', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2077', '450122', '武鸣县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2078', '450123', '隆安县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2079', '450124', '马山县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2080', '450125', '上林县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2081', '450126', '宾阳县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2082', '450127', '横　县', '450100');
INSERT INTO `base_provincecityarea` VALUES ('2084', '450202', '城中区', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2085', '450203', '鱼峰区', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2086', '450204', '柳南区', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2087', '450205', '柳北区', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2088', '450221', '柳江县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2089', '450222', '柳城县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2090', '450223', '鹿寨县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2091', '450224', '融安县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2092', '450225', '融水苗族自治县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2093', '450226', '三江侗族自治县', '450200');
INSERT INTO `base_provincecityarea` VALUES ('2095', '450302', '秀峰区', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2096', '450303', '叠彩区', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2097', '450304', '象山区', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2098', '450305', '七星区', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2099', '450311', '雁山区', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2100', '450321', '阳朔县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2101', '450322', '临桂县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2102', '450323', '灵川县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2103', '450324', '全州县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2104', '450325', '兴安县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2105', '450326', '永福县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2106', '450327', '灌阳县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2107', '450328', '龙胜各族自治县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2108', '450329', '资源县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2109', '450330', '平乐县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2110', '450331', '荔蒲县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2111', '450332', '恭城瑶族自治县', '450300');
INSERT INTO `base_provincecityarea` VALUES ('2113', '450403', '万秀区', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2114', '450404', '蝶山区', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2115', '450405', '长洲区', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2116', '450421', '苍梧县', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2117', '450422', '藤　县', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2118', '450423', '蒙山县', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2119', '450481', '岑溪市', '450400');
INSERT INTO `base_provincecityarea` VALUES ('2121', '450502', '海城区', '450500');
INSERT INTO `base_provincecityarea` VALUES ('2122', '450503', '银海区', '450500');
INSERT INTO `base_provincecityarea` VALUES ('2123', '450512', '铁山港区', '450500');
INSERT INTO `base_provincecityarea` VALUES ('2124', '450521', '合浦县', '450500');
INSERT INTO `base_provincecityarea` VALUES ('2126', '450602', '港口区', '450600');
INSERT INTO `base_provincecityarea` VALUES ('2127', '450603', '防城区', '450600');
INSERT INTO `base_provincecityarea` VALUES ('2128', '450621', '上思县', '450600');
INSERT INTO `base_provincecityarea` VALUES ('2129', '450681', '东兴市', '450600');
INSERT INTO `base_provincecityarea` VALUES ('2131', '450702', '钦南区', '450700');
INSERT INTO `base_provincecityarea` VALUES ('2132', '450703', '钦北区', '450700');
INSERT INTO `base_provincecityarea` VALUES ('2133', '450721', '灵山县', '450700');
INSERT INTO `base_provincecityarea` VALUES ('2134', '450722', '浦北县', '450700');
INSERT INTO `base_provincecityarea` VALUES ('2136', '450802', '港北区', '450800');
INSERT INTO `base_provincecityarea` VALUES ('2137', '450803', '港南区', '450800');
INSERT INTO `base_provincecityarea` VALUES ('2138', '450804', '覃塘区', '450800');
INSERT INTO `base_provincecityarea` VALUES ('2139', '450821', '平南县', '450800');
INSERT INTO `base_provincecityarea` VALUES ('2140', '450881', '桂平市', '450800');
INSERT INTO `base_provincecityarea` VALUES ('2142', '450902', '玉州区', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2143', '450921', '容　县', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2144', '450922', '陆川县', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2145', '450923', '博白县', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2146', '450924', '兴业县', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2147', '450981', '北流市', '450900');
INSERT INTO `base_provincecityarea` VALUES ('2149', '451002', '右江区', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2150', '451021', '田阳县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2151', '451022', '田东县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2152', '451023', '平果县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2153', '451024', '德保县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2154', '451025', '靖西县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2155', '451026', '那坡县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2156', '451027', '凌云县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2157', '451028', '乐业县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2158', '451029', '田林县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2159', '451030', '西林县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2160', '451031', '隆林各族自治县', '451000');
INSERT INTO `base_provincecityarea` VALUES ('2162', '451102', '八步区', '451100');
INSERT INTO `base_provincecityarea` VALUES ('2163', '451121', '昭平县', '451100');
INSERT INTO `base_provincecityarea` VALUES ('2164', '451122', '钟山县', '451100');
INSERT INTO `base_provincecityarea` VALUES ('2165', '451123', '富川瑶族自治县', '451100');
INSERT INTO `base_provincecityarea` VALUES ('2167', '451202', '金城江区', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2168', '451221', '南丹县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2169', '451222', '天峨县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2170', '451223', '凤山县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2171', '451224', '东兰县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2172', '451225', '罗城仫佬族自治县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2173', '451226', '环江毛南族自治县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2174', '451227', '巴马瑶族自治县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2175', '451228', '都安瑶族自治县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2176', '451229', '大化瑶族自治县', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2177', '451281', '宜州市', '451200');
INSERT INTO `base_provincecityarea` VALUES ('2179', '451302', '兴宾区', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2180', '451321', '忻城县', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2181', '451322', '象州县', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2182', '451323', '武宣县', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2183', '451324', '金秀瑶族自治县', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2184', '451381', '合山市', '451300');
INSERT INTO `base_provincecityarea` VALUES ('2186', '451402', '江洲区', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2187', '451421', '扶绥县', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2188', '451422', '宁明县', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2189', '451423', '龙州县', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2190', '451424', '大新县', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2191', '451425', '天等县', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2192', '451481', '凭祥市', '451400');
INSERT INTO `base_provincecityarea` VALUES ('2194', '460105', '秀英区', '460100');
INSERT INTO `base_provincecityarea` VALUES ('2195', '460106', '龙华区', '460100');
INSERT INTO `base_provincecityarea` VALUES ('2196', '460107', '琼山区', '460100');
INSERT INTO `base_provincecityarea` VALUES ('2197', '460108', '美兰区', '460100');
INSERT INTO `base_provincecityarea` VALUES ('2199', '469001', '五指山市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2200', '469002', '琼海市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2201', '469003', '儋州市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2202', '469005', '文昌市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2203', '469006', '万宁市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2204', '469007', '东方市', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2205', '469025', '定安县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2206', '469026', '屯昌县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2207', '469027', '澄迈县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2208', '469028', '临高县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2209', '469030', '白沙黎族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2210', '469031', '昌江黎族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2211', '469033', '乐东黎族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2212', '469034', '陵水黎族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2213', '469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2214', '469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2215', '469037', '西沙群岛', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2216', '469038', '南沙群岛', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2217', '469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `base_provincecityarea` VALUES ('2218', '500101', '万州区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2219', '500102', '涪陵区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2220', '500103', '渝中区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2221', '500104', '大渡口区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2222', '500105', '江北区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2223', '500106', '沙坪坝区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2224', '500107', '九龙坡区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2225', '500108', '南岸区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2226', '500109', '北碚区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2227', '500110', '万盛区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2228', '500111', '双桥区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2229', '500112', '渝北区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2230', '500113', '巴南区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2231', '500114', '黔江区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2232', '5001', '长寿区', '500100');
INSERT INTO `base_provincecityarea` VALUES ('2233', '500222', '綦江县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2234', '500223', '潼南县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2235', '500224', '铜梁县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2236', '500225', '大足县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2237', '500226', '荣昌县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2238', '500227', '璧山县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2239', '500228', '梁平县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2240', '500229', '城口县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2241', '500230', '丰都县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2242', '500231', '垫江县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2243', '500232', '武隆县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2244', '500233', '忠　县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2245', '500234', '开　县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2246', '500235', '云阳县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2247', '500236', '奉节县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2248', '500237', '巫山县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2249', '500238', '巫溪县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2250', '500240', '石柱土家族自治县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2251', '500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2252', '500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2253', '500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `base_provincecityarea` VALUES ('2254', '500381', '江津市', '500300');
INSERT INTO `base_provincecityarea` VALUES ('2255', '500382', '合川市', '500300');
INSERT INTO `base_provincecityarea` VALUES ('2256', '500383', '永川市', '500300');
INSERT INTO `base_provincecityarea` VALUES ('2257', '500384', '南川市', '500300');
INSERT INTO `base_provincecityarea` VALUES ('2259', '510104', '锦江区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2260', '510105', '青羊区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2261', '510106', '金牛区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2262', '510107', '武侯区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2263', '510108', '成华区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2264', '510112', '龙泉驿区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2265', '510113', '青白江区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2266', '510114', '新都区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2267', '5101', '温江区', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2268', '510121', '金堂县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2269', '510122', '双流县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2270', '510124', '郫　县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2271', '510129', '大邑县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2272', '510131', '蒲江县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2273', '510132', '新津县', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2274', '510181', '都江堰市', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2275', '510182', '彭州市', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2276', '510183', '邛崃市', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2277', '510184', '崇州市', '510100');
INSERT INTO `base_provincecityarea` VALUES ('2279', '510302', '自流井区', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2280', '510303', '贡井区', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2281', '510304', '大安区', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2282', '510311', '沿滩区', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2283', '510321', '荣　县', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2284', '510322', '富顺县', '510300');
INSERT INTO `base_provincecityarea` VALUES ('2286', '510402', '东　区', '510400');
INSERT INTO `base_provincecityarea` VALUES ('2287', '510403', '西　区', '510400');
INSERT INTO `base_provincecityarea` VALUES ('2288', '510411', '仁和区', '510400');
INSERT INTO `base_provincecityarea` VALUES ('2289', '510421', '米易县', '510400');
INSERT INTO `base_provincecityarea` VALUES ('2290', '510422', '盐边县', '510400');
INSERT INTO `base_provincecityarea` VALUES ('2292', '510502', '江阳区', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2293', '510503', '纳溪区', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2294', '510504', '龙马潭区', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2295', '510521', '泸　县', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2296', '510522', '合江县', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2297', '510524', '叙永县', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2298', '510525', '古蔺县', '510500');
INSERT INTO `base_provincecityarea` VALUES ('2300', '510603', '旌阳区', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2301', '510623', '中江县', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2302', '510626', '罗江县', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2303', '510681', '广汉市', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2304', '510682', '什邡市', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2305', '510683', '绵竹市', '510600');
INSERT INTO `base_provincecityarea` VALUES ('2307', '510703', '涪城区', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2308', '510704', '游仙区', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2309', '510722', '三台县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2310', '510723', '盐亭县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2311', '510724', '安　县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2312', '510725', '梓潼县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2313', '510726', '北川羌族自治县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2314', '510727', '平武县', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2315', '510781', '江油市', '510700');
INSERT INTO `base_provincecityarea` VALUES ('2317', '510802', '市中区', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2318', '510811', '元坝区', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2319', '510812', '朝天区', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2320', '510821', '旺苍县', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2321', '510822', '青川县', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2322', '510823', '剑阁县', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2323', '510824', '苍溪县', '510800');
INSERT INTO `base_provincecityarea` VALUES ('2325', '510903', '船山区', '510900');
INSERT INTO `base_provincecityarea` VALUES ('2326', '510904', '安居区', '510900');
INSERT INTO `base_provincecityarea` VALUES ('2327', '510921', '蓬溪县', '510900');
INSERT INTO `base_provincecityarea` VALUES ('2328', '510922', '射洪县', '510900');
INSERT INTO `base_provincecityarea` VALUES ('2329', '510923', '大英县', '510900');
INSERT INTO `base_provincecityarea` VALUES ('2331', '511002', '市中区', '511000');
INSERT INTO `base_provincecityarea` VALUES ('2332', '511011', '东兴区', '511000');
INSERT INTO `base_provincecityarea` VALUES ('2333', '511024', '威远县', '511000');
INSERT INTO `base_provincecityarea` VALUES ('2334', '511025', '资中县', '511000');
INSERT INTO `base_provincecityarea` VALUES ('2335', '511028', '隆昌县', '511000');
INSERT INTO `base_provincecityarea` VALUES ('2337', '511102', '市中区', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2338', '511111', '沙湾区', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2339', '511112', '五通桥区', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2340', '511113', '金口河区', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2341', '511123', '犍为县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2342', '511124', '井研县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2343', '511126', '夹江县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2344', '511129', '沐川县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2345', '511132', '峨边彝族自治县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2346', '511133', '马边彝族自治县', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2347', '511181', '峨眉山市', '511100');
INSERT INTO `base_provincecityarea` VALUES ('2349', '511302', '顺庆区', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2350', '511303', '高坪区', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2351', '511304', '嘉陵区', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2352', '511321', '南部县', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2353', '511322', '营山县', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2354', '511323', '蓬安县', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2355', '511324', '仪陇县', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2356', '511325', '西充县', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2357', '511381', '阆中市', '511300');
INSERT INTO `base_provincecityarea` VALUES ('2359', '511402', '东坡区', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2360', '511421', '仁寿县', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2361', '511422', '彭山县', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2362', '511423', '洪雅县', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2363', '511424', '丹棱县', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2364', '511425', '青神县', '511400');
INSERT INTO `base_provincecityarea` VALUES ('2366', '5102', '翠屏区', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2367', '5121', '宜宾县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2368', '5122', '南溪县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2369', '5123', '江安县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2370', '5124', '长宁县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2371', '5125', '高　县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2372', '5126', '珙　县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2373', '5127', '筠连县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2374', '5128', '兴文县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2375', '5129', '屏山县', '5100');
INSERT INTO `base_provincecityarea` VALUES ('2377', '511602', '广安区', '511600');
INSERT INTO `base_provincecityarea` VALUES ('2378', '511621', '岳池县', '511600');
INSERT INTO `base_provincecityarea` VALUES ('2379', '511622', '武胜县', '511600');
INSERT INTO `base_provincecityarea` VALUES ('2380', '511623', '邻水县', '511600');
INSERT INTO `base_provincecityarea` VALUES ('2381', '511681', '华莹市', '511600');
INSERT INTO `base_provincecityarea` VALUES ('2383', '511702', '通川区', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2384', '511721', '达　县', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2385', '511722', '宣汉县', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2386', '511723', '开江县', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2387', '511724', '大竹县', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2388', '511725', '渠　县', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2389', '511781', '万源市', '511700');
INSERT INTO `base_provincecityarea` VALUES ('2391', '511802', '雨城区', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2392', '511821', '名山县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2393', '511822', '荥经县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2394', '511823', '汉源县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2395', '511824', '石棉县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2396', '511825', '天全县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2397', '511826', '芦山县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2398', '511827', '宝兴县', '511800');
INSERT INTO `base_provincecityarea` VALUES ('2400', '511902', '巴州区', '511900');
INSERT INTO `base_provincecityarea` VALUES ('2401', '511921', '通江县', '511900');
INSERT INTO `base_provincecityarea` VALUES ('2402', '511922', '南江县', '511900');
INSERT INTO `base_provincecityarea` VALUES ('2403', '511923', '平昌县', '511900');
INSERT INTO `base_provincecityarea` VALUES ('2405', '512002', '雁江区', '512000');
INSERT INTO `base_provincecityarea` VALUES ('2406', '512021', '安岳县', '512000');
INSERT INTO `base_provincecityarea` VALUES ('2407', '512022', '乐至县', '512000');
INSERT INTO `base_provincecityarea` VALUES ('2408', '512081', '简阳市', '512000');
INSERT INTO `base_provincecityarea` VALUES ('2409', '513221', '汶川县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2410', '513222', '理　县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2411', '513223', '茂　县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2412', '513224', '松潘县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2413', '513225', '九寨沟县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2414', '513226', '金川县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2415', '513227', '小金县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2416', '513228', '黑水县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2417', '513229', '马尔康县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2418', '513230', '壤塘县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2419', '513231', '阿坝县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2420', '513232', '若尔盖县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2421', '513233', '红原县', '513200');
INSERT INTO `base_provincecityarea` VALUES ('2422', '513321', '康定县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2423', '513322', '泸定县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2424', '513323', '丹巴县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2425', '513324', '九龙县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2426', '513325', '雅江县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2427', '513326', '道孚县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2428', '513327', '炉霍县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2429', '513328', '甘孜县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2430', '513329', '新龙县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2431', '513330', '德格县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2432', '513331', '白玉县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2433', '513332', '石渠县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2434', '513333', '色达县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2435', '513334', '理塘县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2436', '513335', '巴塘县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2437', '513336', '乡城县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2438', '513337', '稻城县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2439', '513338', '得荣县', '513300');
INSERT INTO `base_provincecityarea` VALUES ('2440', '513401', '西昌市', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2441', '513422', '木里藏族自治县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2442', '513423', '盐源县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2443', '513424', '德昌县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2444', '513425', '会理县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2445', '513426', '会东县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2446', '513427', '宁南县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2447', '513428', '普格县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2448', '513429', '布拖县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2449', '513430', '金阳县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2450', '513431', '昭觉县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2451', '513432', '喜德县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2452', '513433', '冕宁县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2453', '513434', '越西县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2454', '513435', '甘洛县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2455', '513436', '美姑县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2456', '513437', '雷波县', '513400');
INSERT INTO `base_provincecityarea` VALUES ('2458', '520102', '南明区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2459', '520103', '云岩区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2460', '520111', '花溪区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2461', '520112', '乌当区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2462', '520113', '白云区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2463', '520114', '小河区', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2464', '520121', '开阳县', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2465', '520122', '息烽县', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2466', '520123', '修文县', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2467', '520181', '清镇市', '520100');
INSERT INTO `base_provincecityarea` VALUES ('2468', '520201', '钟山区', '520200');
INSERT INTO `base_provincecityarea` VALUES ('2469', '520203', '六枝特区', '520200');
INSERT INTO `base_provincecityarea` VALUES ('2470', '520221', '水城县', '520200');
INSERT INTO `base_provincecityarea` VALUES ('2471', '520222', '盘　县', '520200');
INSERT INTO `base_provincecityarea` VALUES ('2473', '520302', '红花岗区', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2474', '520303', '汇川区', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2475', '520321', '遵义县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2476', '520322', '桐梓县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2477', '520323', '绥阳县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2478', '520324', '正安县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2479', '520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2480', '520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2481', '520327', '凤冈县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2482', '520328', '湄潭县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2483', '520329', '余庆县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2484', '520330', '习水县', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2485', '520381', '赤水市', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2486', '520382', '仁怀市', '520300');
INSERT INTO `base_provincecityarea` VALUES ('2488', '520402', '西秀区', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2489', '520421', '平坝县', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2490', '520422', '普定县', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2491', '520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2492', '520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2493', '520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `base_provincecityarea` VALUES ('2494', '522201', '铜仁市', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2495', '522222', '江口县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2496', '522223', '玉屏侗族自治县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2497', '522224', '石阡县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2498', '522225', '思南县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2499', '522226', '印江土家族苗族自治县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2500', '522227', '德江县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2501', '522228', '沿河土家族自治县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2502', '522229', '松桃苗族自治县', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2503', '522230', '万山特区', '522200');
INSERT INTO `base_provincecityarea` VALUES ('2504', '522301', '兴义市', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2505', '522322', '兴仁县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2506', '522323', '普安县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2507', '522324', '晴隆县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2508', '522325', '贞丰县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2509', '522326', '望谟县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2510', '522327', '册亨县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2511', '522328', '安龙县', '522300');
INSERT INTO `base_provincecityarea` VALUES ('2512', '522401', '毕节市', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2513', '522422', '大方县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2514', '522423', '黔西县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2515', '522424', '金沙县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2516', '522425', '织金县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2517', '522426', '纳雍县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2518', '522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2519', '522428', '赫章县', '522400');
INSERT INTO `base_provincecityarea` VALUES ('2520', '522601', '凯里市', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2521', '522622', '黄平县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2522', '522623', '施秉县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2523', '522624', '三穗县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2524', '522625', '镇远县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2525', '522626', '岑巩县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2526', '522627', '天柱县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2527', '522628', '锦屏县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2528', '522629', '剑河县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2529', '522630', '台江县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2530', '522631', '黎平县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2531', '522632', '榕江县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2532', '522633', '从江县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2533', '522634', '雷山县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2534', '522635', '麻江县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2535', '522636', '丹寨县', '522600');
INSERT INTO `base_provincecityarea` VALUES ('2536', '522701', '都匀市', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2537', '522702', '福泉市', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2538', '522722', '荔波县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2539', '522723', '贵定县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2540', '522725', '瓮安县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2541', '522726', '独山县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2542', '522727', '平塘县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2543', '522728', '罗甸县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2544', '522729', '长顺县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2545', '522730', '龙里县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2546', '522731', '惠水县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2547', '522732', '三都水族自治县', '522700');
INSERT INTO `base_provincecityarea` VALUES ('2549', '530102', '五华区', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2550', '530103', '盘龙区', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2551', '530111', '官渡区', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2552', '530112', '西山区', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2553', '530113', '东川区', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2554', '530121', '呈贡县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2555', '530122', '晋宁县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2556', '530124', '富民县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2557', '530125', '宜良县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2558', '530126', '石林彝族自治县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2559', '530127', '嵩明县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2560', '530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2561', '530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2562', '530181', '安宁市', '530100');
INSERT INTO `base_provincecityarea` VALUES ('2564', '530302', '麒麟区', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2565', '530321', '马龙县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2566', '530322', '陆良县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2567', '530323', '师宗县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2568', '530324', '罗平县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2569', '530325', '富源县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2570', '530326', '会泽县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2571', '530328', '沾益县', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2572', '530381', '宣威市', '530300');
INSERT INTO `base_provincecityarea` VALUES ('2574', '530402', '红塔区', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2575', '530421', '江川县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2576', '530422', '澄江县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2577', '530423', '通海县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2578', '530424', '华宁县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2579', '530425', '易门县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2580', '530426', '峨山彝族自治县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2581', '530427', '新平彝族傣族自治县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2582', '530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `base_provincecityarea` VALUES ('2584', '530502', '隆阳区', '530500');
INSERT INTO `base_provincecityarea` VALUES ('2585', '530521', '施甸县', '530500');
INSERT INTO `base_provincecityarea` VALUES ('2586', '530522', '腾冲县', '530500');
INSERT INTO `base_provincecityarea` VALUES ('2587', '530523', '龙陵县', '530500');
INSERT INTO `base_provincecityarea` VALUES ('2588', '530524', '昌宁县', '530500');
INSERT INTO `base_provincecityarea` VALUES ('2590', '530602', '昭阳区', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2591', '530621', '鲁甸县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2592', '530622', '巧家县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2593', '530623', '盐津县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2594', '530624', '大关县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2595', '530625', '永善县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2596', '530626', '绥江县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2597', '530627', '镇雄县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2598', '530628', '彝良县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2599', '530629', '威信县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2600', '530630', '水富县', '530600');
INSERT INTO `base_provincecityarea` VALUES ('2602', '530702', '古城区', '530700');
INSERT INTO `base_provincecityarea` VALUES ('2603', '530721', '玉龙纳西族自治县', '530700');
INSERT INTO `base_provincecityarea` VALUES ('2604', '530722', '永胜县', '530700');
INSERT INTO `base_provincecityarea` VALUES ('2605', '530723', '华坪县', '530700');
INSERT INTO `base_provincecityarea` VALUES ('2606', '530724', '宁蒗彝族自治县', '530700');
INSERT INTO `base_provincecityarea` VALUES ('2608', '530802', '翠云区', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2609', '530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2610', '530822', '墨江哈尼族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2611', '530823', '景东彝族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2612', '530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2613', '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2614', '530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2615', '530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2616', '530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2617', '530829', '西盟佤族自治县', '530800');
INSERT INTO `base_provincecityarea` VALUES ('2619', '530902', '临翔区', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2620', '530921', '凤庆县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2621', '530922', '云　县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2622', '530923', '永德县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2623', '530924', '镇康县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2624', '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2625', '530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2626', '530927', '沧源佤族自治县', '530900');
INSERT INTO `base_provincecityarea` VALUES ('2627', '532301', '楚雄市', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2628', '532322', '双柏县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2629', '532323', '牟定县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2630', '532324', '南华县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2631', '532325', '姚安县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2632', '532326', '大姚县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2633', '532327', '永仁县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2634', '532328', '元谋县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2635', '532329', '武定县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2636', '532331', '禄丰县', '532300');
INSERT INTO `base_provincecityarea` VALUES ('2637', '532501', '个旧市', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2638', '532502', '开远市', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2639', '532522', '蒙自县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2640', '532523', '屏边苗族自治县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2641', '532524', '建水县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2642', '532525', '石屏县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2643', '532526', '弥勒县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2644', '532527', '泸西县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2645', '532528', '元阳县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2646', '532529', '红河县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2647', '532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2648', '532531', '绿春县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2649', '532532', '河口瑶族自治县', '532500');
INSERT INTO `base_provincecityarea` VALUES ('2650', '532621', '文山县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2651', '532622', '砚山县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2652', '532623', '西畴县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2653', '532624', '麻栗坡县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2654', '532625', '马关县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2655', '532626', '丘北县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2656', '532627', '广南县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2657', '532628', '富宁县', '532600');
INSERT INTO `base_provincecityarea` VALUES ('2658', '532801', '景洪市', '532800');
INSERT INTO `base_provincecityarea` VALUES ('2659', '532822', '勐海县', '532800');
INSERT INTO `base_provincecityarea` VALUES ('2660', '532823', '勐腊县', '532800');
INSERT INTO `base_provincecityarea` VALUES ('2661', '532901', '大理市', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2662', '532922', '漾濞彝族自治县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2663', '532923', '祥云县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2664', '532924', '宾川县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2665', '532925', '弥渡县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2666', '532926', '南涧彝族自治县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2667', '532927', '巍山彝族回族自治县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2668', '532928', '永平县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2669', '532929', '云龙县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2670', '532930', '洱源县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2671', '532931', '剑川县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2672', '532932', '鹤庆县', '532900');
INSERT INTO `base_provincecityarea` VALUES ('2673', '533102', '瑞丽市', '533100');
INSERT INTO `base_provincecityarea` VALUES ('2674', '533103', '潞西市', '533100');
INSERT INTO `base_provincecityarea` VALUES ('2675', '533122', '梁河县', '533100');
INSERT INTO `base_provincecityarea` VALUES ('2676', '533123', '盈江县', '533100');
INSERT INTO `base_provincecityarea` VALUES ('2677', '533124', '陇川县', '533100');
INSERT INTO `base_provincecityarea` VALUES ('2678', '533321', '泸水县', '533300');
INSERT INTO `base_provincecityarea` VALUES ('2679', '533323', '福贡县', '533300');
INSERT INTO `base_provincecityarea` VALUES ('2680', '533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `base_provincecityarea` VALUES ('2681', '533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `base_provincecityarea` VALUES ('2682', '533421', '香格里拉县', '533400');
INSERT INTO `base_provincecityarea` VALUES ('2683', '533422', '德钦县', '533400');
INSERT INTO `base_provincecityarea` VALUES ('2684', '533423', '维西傈僳族自治县', '533400');
INSERT INTO `base_provincecityarea` VALUES ('2686', '540102', '城关区', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2687', '540121', '林周县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2688', '540122', '当雄县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2689', '540123', '尼木县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2690', '540124', '曲水县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2691', '540125', '堆龙德庆县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2692', '540126', '达孜县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2693', '540127', '墨竹工卡县', '540100');
INSERT INTO `base_provincecityarea` VALUES ('2694', '542121', '昌都县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2695', '542122', '江达县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2696', '542123', '贡觉县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2697', '542124', '类乌齐县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2698', '542125', '丁青县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2699', '542126', '察雅县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2700', '542127', '八宿县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2701', '542128', '左贡县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2702', '542129', '芒康县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2703', '542132', '洛隆县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2704', '542133', '边坝县', '542100');
INSERT INTO `base_provincecityarea` VALUES ('2705', '542221', '乃东县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2706', '542222', '扎囊县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2707', '542223', '贡嘎县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2708', '542224', '桑日县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2709', '542225', '琼结县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2710', '542226', '曲松县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2711', '542227', '措美县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2712', '542228', '洛扎县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2713', '542229', '加查县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2714', '542231', '隆子县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2715', '542232', '错那县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2716', '542233', '浪卡子县', '542200');
INSERT INTO `base_provincecityarea` VALUES ('2717', '542301', '日喀则市', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2718', '542322', '南木林县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2719', '542323', '江孜县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2720', '542324', '定日县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2721', '542325', '萨迦县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2722', '542326', '拉孜县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2723', '542327', '昂仁县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2724', '542328', '谢通门县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2725', '542329', '白朗县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2726', '542330', '仁布县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2727', '542331', '康马县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2728', '542332', '定结县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2729', '542333', '仲巴县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2730', '542334', '亚东县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2731', '542335', '吉隆县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2732', '542336', '聂拉木县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2733', '542337', '萨嘎县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2734', '542338', '岗巴县', '542300');
INSERT INTO `base_provincecityarea` VALUES ('2735', '542421', '那曲县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2736', '542422', '嘉黎县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2737', '542423', '比如县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2738', '542424', '聂荣县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2739', '542425', '安多县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2740', '542426', '申扎县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2741', '542427', '索　县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2742', '542428', '班戈县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2743', '542429', '巴青县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2744', '542430', '尼玛县', '542400');
INSERT INTO `base_provincecityarea` VALUES ('2745', '542521', '普兰县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2746', '542522', '札达县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2747', '542523', '噶尔县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2748', '542524', '日土县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2749', '542525', '革吉县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2750', '542526', '改则县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2751', '542527', '措勤县', '542500');
INSERT INTO `base_provincecityarea` VALUES ('2752', '542621', '林芝县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2753', '542622', '工布江达县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2754', '542623', '米林县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2755', '542624', '墨脱县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2756', '542625', '波密县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2757', '542626', '察隅县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2758', '542627', '朗　县', '542600');
INSERT INTO `base_provincecityarea` VALUES ('2760', '610102', '新城区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2761', '610103', '碑林区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2762', '610104', '莲湖区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2763', '610111', '灞桥区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2764', '610112', '未央区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2765', '610113', '雁塔区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2766', '610114', '阎良区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2767', '6101', '临潼区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2768', '610116', '长安区', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2769', '610122', '蓝田县', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2770', '610124', '周至县', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2771', '610125', '户　县', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2772', '610126', '高陵县', '610100');
INSERT INTO `base_provincecityarea` VALUES ('2774', '610202', '王益区', '610200');
INSERT INTO `base_provincecityarea` VALUES ('2775', '610203', '印台区', '610200');
INSERT INTO `base_provincecityarea` VALUES ('2776', '610204', '耀州区', '610200');
INSERT INTO `base_provincecityarea` VALUES ('2777', '610222', '宜君县', '610200');
INSERT INTO `base_provincecityarea` VALUES ('2779', '610302', '渭滨区', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2780', '610303', '金台区', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2781', '610304', '陈仓区', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2782', '610322', '凤翔县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2783', '610323', '岐山县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2784', '610324', '扶风县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2785', '610326', '眉　县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2786', '610327', '陇　县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2787', '610328', '千阳县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2788', '610329', '麟游县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2789', '610330', '凤　县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2790', '610331', '太白县', '610300');
INSERT INTO `base_provincecityarea` VALUES ('2792', '610402', '秦都区', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2793', '610403', '杨凌区', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2794', '610404', '渭城区', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2795', '610422', '三原县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2796', '610423', '泾阳县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2797', '610424', '乾　县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2798', '610425', '礼泉县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2799', '610426', '永寿县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2800', '610427', '彬　县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2801', '610428', '长武县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2802', '610429', '旬邑县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2803', '610430', '淳化县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2804', '610431', '武功县', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2805', '610481', '兴平市', '610400');
INSERT INTO `base_provincecityarea` VALUES ('2807', '610502', '临渭区', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2808', '610521', '华　县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2809', '610522', '潼关县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2810', '610523', '大荔县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2811', '610524', '合阳县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2812', '610525', '澄城县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2813', '610526', '蒲城县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2814', '610527', '白水县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2815', '610528', '富平县', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2816', '610581', '韩城市', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2817', '610582', '华阴市', '610500');
INSERT INTO `base_provincecityarea` VALUES ('2819', '610602', '宝塔区', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2820', '610621', '延长县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2821', '610622', '延川县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2822', '610623', '子长县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2823', '610624', '安塞县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2824', '610625', '志丹县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2825', '610626', '吴旗县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2826', '610627', '甘泉县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2827', '610628', '富　县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2828', '610629', '洛川县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2829', '610630', '宜川县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2830', '610631', '黄龙县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2831', '610632', '黄陵县', '610600');
INSERT INTO `base_provincecityarea` VALUES ('2833', '610702', '汉台区', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2834', '610721', '南郑县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2835', '610722', '城固县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2836', '610723', '洋　县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2837', '610724', '西乡县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2838', '610725', '勉　县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2839', '610726', '宁强县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2840', '610727', '略阳县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2841', '610728', '镇巴县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2842', '610729', '留坝县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2843', '610730', '佛坪县', '610700');
INSERT INTO `base_provincecityarea` VALUES ('2845', '610802', '榆阳区', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2846', '610821', '神木县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2847', '610822', '府谷县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2848', '610823', '横山县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2849', '610824', '靖边县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2850', '610825', '定边县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2851', '610826', '绥德县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2852', '610827', '米脂县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2853', '610828', '佳　县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2854', '610829', '吴堡县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2855', '610830', '清涧县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2856', '610831', '子洲县', '610800');
INSERT INTO `base_provincecityarea` VALUES ('2858', '610902', '汉滨区', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2859', '610921', '汉阴县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2860', '610922', '石泉县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2861', '610923', '宁陕县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2862', '610924', '紫阳县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2863', '610925', '岚皋县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2864', '610926', '平利县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2865', '610927', '镇坪县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2866', '610928', '旬阳县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2867', '610929', '白河县', '610900');
INSERT INTO `base_provincecityarea` VALUES ('2869', '611002', '商州区', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2870', '611021', '洛南县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2871', '611022', '丹凤县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2872', '611023', '商南县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2873', '611024', '山阳县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2874', '611025', '镇安县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2875', '611026', '柞水县', '611000');
INSERT INTO `base_provincecityarea` VALUES ('2877', '620102', '城关区', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2878', '620103', '七里河区', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2879', '620104', '西固区', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2880', '620105', '安宁区', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2881', '620111', '红古区', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2882', '620121', '永登县', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2883', '620122', '皋兰县', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2884', '620123', '榆中县', '620100');
INSERT INTO `base_provincecityarea` VALUES ('2887', '620302', '金川区', '620300');
INSERT INTO `base_provincecityarea` VALUES ('2888', '620321', '永昌县', '620300');
INSERT INTO `base_provincecityarea` VALUES ('2890', '620402', '白银区', '620400');
INSERT INTO `base_provincecityarea` VALUES ('2891', '620403', '平川区', '620400');
INSERT INTO `base_provincecityarea` VALUES ('2892', '620421', '靖远县', '620400');
INSERT INTO `base_provincecityarea` VALUES ('2893', '620422', '会宁县', '620400');
INSERT INTO `base_provincecityarea` VALUES ('2894', '620423', '景泰县', '620400');
INSERT INTO `base_provincecityarea` VALUES ('2896', '620502', '秦城区', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2897', '620503', '北道区', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2898', '620521', '清水县', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2899', '620522', '秦安县', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2900', '620523', '甘谷县', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2901', '620524', '武山县', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2902', '620525', '张家川回族自治县', '620500');
INSERT INTO `base_provincecityarea` VALUES ('2904', '620602', '凉州区', '620600');
INSERT INTO `base_provincecityarea` VALUES ('2905', '620621', '民勤县', '620600');
INSERT INTO `base_provincecityarea` VALUES ('2906', '620622', '古浪县', '620600');
INSERT INTO `base_provincecityarea` VALUES ('2907', '620623', '天祝藏族自治县', '620600');
INSERT INTO `base_provincecityarea` VALUES ('2909', '620702', '甘州区', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2910', '620721', '肃南裕固族自治县', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2911', '620722', '民乐县', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2912', '620723', '临泽县', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2913', '620724', '高台县', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2914', '620725', '山丹县', '620700');
INSERT INTO `base_provincecityarea` VALUES ('2916', '620802', '崆峒区', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2917', '620821', '泾川县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2918', '620822', '灵台县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2919', '620823', '崇信县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2920', '620824', '华亭县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2921', '620825', '庄浪县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2922', '620826', '静宁县', '620800');
INSERT INTO `base_provincecityarea` VALUES ('2924', '620902', '肃州区', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2925', '620921', '金塔县', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2926', '620922', '安西县', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2927', '620923', '肃北蒙古族自治县', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2928', '620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2929', '620981', '玉门市', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2930', '620982', '敦煌市', '620900');
INSERT INTO `base_provincecityarea` VALUES ('2932', '621002', '西峰区', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2933', '621021', '庆城县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2934', '621022', '环　县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2935', '621023', '华池县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2936', '621024', '合水县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2937', '621025', '正宁县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2938', '621026', '宁　县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2939', '621027', '镇原县', '621000');
INSERT INTO `base_provincecityarea` VALUES ('2941', '621102', '安定区', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2942', '621121', '通渭县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2943', '621122', '陇西县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2944', '621123', '渭源县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2945', '621124', '临洮县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2946', '621125', '漳　县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2947', '621126', '岷　县', '621100');
INSERT INTO `base_provincecityarea` VALUES ('2949', '621202', '武都区', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2950', '621221', '成　县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2951', '621222', '文　县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2952', '621223', '宕昌县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2953', '621224', '康　县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2954', '621225', '西和县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2955', '621226', '礼　县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2956', '621227', '徽　县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2957', '621228', '两当县', '621200');
INSERT INTO `base_provincecityarea` VALUES ('2958', '622901', '临夏市', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2959', '622921', '临夏县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2960', '622922', '康乐县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2961', '622923', '永靖县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2962', '622924', '广河县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2963', '622925', '和政县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2964', '622926', '东乡族自治县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2965', '622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `base_provincecityarea` VALUES ('2966', '623001', '合作市', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2967', '623021', '临潭县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2968', '623022', '卓尼县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2969', '623023', '舟曲县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2970', '623024', '迭部县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2971', '623025', '玛曲县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2972', '623026', '碌曲县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2973', '623027', '夏河县', '623000');
INSERT INTO `base_provincecityarea` VALUES ('2975', '630102', '城东区', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2976', '630103', '城中区', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2977', '630104', '城西区', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2978', '630105', '城北区', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2979', '630121', '大通回族土族自治县', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2980', '630122', '湟中县', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2981', '630123', '湟源县', '630100');
INSERT INTO `base_provincecityarea` VALUES ('2982', '632121', '平安县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2983', '632122', '民和回族土族自治县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2984', '632123', '乐都县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2985', '632126', '互助土族自治县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2986', '632127', '化隆回族自治县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2987', '632128', '循化撒拉族自治县', '632100');
INSERT INTO `base_provincecityarea` VALUES ('2988', '632221', '门源回族自治县', '632200');
INSERT INTO `base_provincecityarea` VALUES ('2989', '632222', '祁连县', '632200');
INSERT INTO `base_provincecityarea` VALUES ('2990', '632223', '海晏县', '632200');
INSERT INTO `base_provincecityarea` VALUES ('2991', '632224', '刚察县', '632200');
INSERT INTO `base_provincecityarea` VALUES ('2992', '632321', '同仁县', '632300');
INSERT INTO `base_provincecityarea` VALUES ('2993', '632322', '尖扎县', '632300');
INSERT INTO `base_provincecityarea` VALUES ('2994', '632323', '泽库县', '632300');
INSERT INTO `base_provincecityarea` VALUES ('2995', '632324', '河南蒙古族自治县', '632300');
INSERT INTO `base_provincecityarea` VALUES ('2996', '632521', '共和县', '632500');
INSERT INTO `base_provincecityarea` VALUES ('2997', '632522', '同德县', '632500');
INSERT INTO `base_provincecityarea` VALUES ('2998', '632523', '贵德县', '632500');
INSERT INTO `base_provincecityarea` VALUES ('2999', '632524', '兴海县', '632500');
INSERT INTO `base_provincecityarea` VALUES ('3000', '632525', '贵南县', '632500');
INSERT INTO `base_provincecityarea` VALUES ('3001', '632621', '玛沁县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3002', '632622', '班玛县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3003', '632623', '甘德县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3004', '632624', '达日县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3005', '632625', '久治县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3006', '632626', '玛多县', '632600');
INSERT INTO `base_provincecityarea` VALUES ('3007', '632721', '玉树县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3008', '632722', '杂多县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3009', '632723', '称多县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3010', '632724', '治多县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3011', '632725', '囊谦县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3012', '632726', '曲麻莱县', '632700');
INSERT INTO `base_provincecityarea` VALUES ('3013', '632801', '格尔木市', '632800');
INSERT INTO `base_provincecityarea` VALUES ('3014', '632802', '德令哈市', '632800');
INSERT INTO `base_provincecityarea` VALUES ('3015', '632821', '乌兰县', '632800');
INSERT INTO `base_provincecityarea` VALUES ('3016', '632822', '都兰县', '632800');
INSERT INTO `base_provincecityarea` VALUES ('3017', '632823', '天峻县', '632800');
INSERT INTO `base_provincecityarea` VALUES ('3019', '640104', '兴庆区', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3020', '640105', '西夏区', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3021', '640106', '金凤区', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3022', '640121', '永宁县', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3023', '640122', '贺兰县', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3024', '640181', '灵武市', '640100');
INSERT INTO `base_provincecityarea` VALUES ('3026', '640202', '大武口区', '640200');
INSERT INTO `base_provincecityarea` VALUES ('3027', '640205', '惠农区', '640200');
INSERT INTO `base_provincecityarea` VALUES ('3028', '640221', '平罗县', '640200');
INSERT INTO `base_provincecityarea` VALUES ('3030', '640302', '利通区', '640300');
INSERT INTO `base_provincecityarea` VALUES ('3031', '640323', '盐池县', '640300');
INSERT INTO `base_provincecityarea` VALUES ('3032', '640324', '同心县', '640300');
INSERT INTO `base_provincecityarea` VALUES ('3033', '640381', '青铜峡市', '640300');
INSERT INTO `base_provincecityarea` VALUES ('3035', '640402', '原州区', '640400');
INSERT INTO `base_provincecityarea` VALUES ('3036', '640422', '西吉县', '640400');
INSERT INTO `base_provincecityarea` VALUES ('3037', '640423', '隆德县', '640400');
INSERT INTO `base_provincecityarea` VALUES ('3038', '640424', '泾源县', '640400');
INSERT INTO `base_provincecityarea` VALUES ('3039', '640425', '彭阳县', '640400');
INSERT INTO `base_provincecityarea` VALUES ('3041', '640502', '沙坡头区', '640500');
INSERT INTO `base_provincecityarea` VALUES ('3042', '640521', '中宁县', '640500');
INSERT INTO `base_provincecityarea` VALUES ('3043', '640522', '海原县', '640500');
INSERT INTO `base_provincecityarea` VALUES ('3045', '650102', '天山区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3046', '650103', '沙依巴克区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3047', '650104', '新市区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3048', '650105', '水磨沟区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3049', '650106', '头屯河区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3050', '650107', '达坂城区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3051', '650108', '东山区', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3052', '650121', '乌鲁木齐县', '650100');
INSERT INTO `base_provincecityarea` VALUES ('3054', '650202', '独山子区', '650200');
INSERT INTO `base_provincecityarea` VALUES ('3055', '650203', '克拉玛依区', '650200');
INSERT INTO `base_provincecityarea` VALUES ('3056', '650204', '白碱滩区', '650200');
INSERT INTO `base_provincecityarea` VALUES ('3057', '650205', '乌尔禾区', '650200');
INSERT INTO `base_provincecityarea` VALUES ('3058', '652101', '吐鲁番市', '652100');
INSERT INTO `base_provincecityarea` VALUES ('3059', '652122', '鄯善县', '652100');
INSERT INTO `base_provincecityarea` VALUES ('3060', '652123', '托克逊县', '652100');
INSERT INTO `base_provincecityarea` VALUES ('3061', '652201', '哈密市', '652200');
INSERT INTO `base_provincecityarea` VALUES ('3062', '652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `base_provincecityarea` VALUES ('3063', '652223', '伊吾县', '652200');
INSERT INTO `base_provincecityarea` VALUES ('3064', '652301', '昌吉市', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3065', '652302', '阜康市', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3066', '652303', '米泉市', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3067', '652323', '呼图壁县', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3068', '652324', '玛纳斯县', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3069', '652325', '奇台县', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3070', '652327', '吉木萨尔县', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3071', '652328', '木垒哈萨克自治县', '652300');
INSERT INTO `base_provincecityarea` VALUES ('3072', '652701', '博乐市', '652700');
INSERT INTO `base_provincecityarea` VALUES ('3073', '652722', '精河县', '652700');
INSERT INTO `base_provincecityarea` VALUES ('3074', '652723', '温泉县', '652700');
INSERT INTO `base_provincecityarea` VALUES ('3075', '652801', '库尔勒市', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3076', '652822', '轮台县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3077', '652823', '尉犁县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3078', '652824', '若羌县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3079', '652825', '且末县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3080', '652826', '焉耆回族自治县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3081', '652827', '和静县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3082', '652828', '和硕县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3083', '652829', '博湖县', '652800');
INSERT INTO `base_provincecityarea` VALUES ('3084', '652901', '阿克苏市', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3085', '652922', '温宿县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3086', '652923', '库车县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3087', '652924', '沙雅县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3088', '652925', '新和县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3089', '652926', '拜城县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3090', '652927', '乌什县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3091', '652928', '阿瓦提县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3092', '652929', '柯坪县', '652900');
INSERT INTO `base_provincecityarea` VALUES ('3093', '653001', '阿图什市', '653000');
INSERT INTO `base_provincecityarea` VALUES ('3094', '653022', '阿克陶县', '653000');
INSERT INTO `base_provincecityarea` VALUES ('3095', '653023', '阿合奇县', '653000');
INSERT INTO `base_provincecityarea` VALUES ('3096', '653024', '乌恰县', '653000');
INSERT INTO `base_provincecityarea` VALUES ('3097', '653101', '喀什市', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3098', '653121', '疏附县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3099', '653122', '疏勒县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3100', '653123', '英吉沙县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3101', '653124', '泽普县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3102', '653125', '莎车县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3103', '653126', '叶城县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3104', '653127', '麦盖提县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3105', '653128', '岳普湖县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3106', '653129', '伽师县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3107', '653130', '巴楚县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3108', '653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `base_provincecityarea` VALUES ('3109', '653201', '和田市', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3110', '653221', '和田县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3111', '653222', '墨玉县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3112', '653223', '皮山县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3113', '653224', '洛浦县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3114', '653225', '策勒县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3115', '653226', '于田县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3116', '653227', '民丰县', '653200');
INSERT INTO `base_provincecityarea` VALUES ('3117', '654002', '伊宁市', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3118', '654003', '奎屯市', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3119', '654021', '伊宁县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3120', '654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3121', '654023', '霍城县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3122', '654024', '巩留县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3123', '654025', '新源县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3124', '654026', '昭苏县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3125', '654027', '特克斯县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3126', '654028', '尼勒克县', '654000');
INSERT INTO `base_provincecityarea` VALUES ('3127', '654201', '塔城市', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3128', '654202', '乌苏市', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3129', '654221', '额敏县', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3130', '654223', '沙湾县', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3131', '654224', '托里县', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3132', '654225', '裕民县', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3133', '654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `base_provincecityarea` VALUES ('3134', '654301', '阿勒泰市', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3135', '654321', '布尔津县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3136', '654322', '富蕴县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3137', '654323', '福海县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3138', '654324', '哈巴河县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3139', '654325', '青河县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3140', '654326', '吉木乃县', '654300');
INSERT INTO `base_provincecityarea` VALUES ('3141', '659001', '石河子市', '659000');
INSERT INTO `base_provincecityarea` VALUES ('3142', '659002', '阿拉尔市', '659000');
INSERT INTO `base_provincecityarea` VALUES ('3143', '659003', '图木舒克市', '659000');
INSERT INTO `base_provincecityarea` VALUES ('3144', '659004', '五家渠市', '659000');

-- ----------------------------
-- Table structure for `hat_city`
-- ----------------------------
DROP TABLE IF EXISTS `hat_city`;
CREATE TABLE `hat_city` (
  `id` int(11) NOT NULL,
  `cityID` varchar(8) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `father` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hat_city
-- ----------------------------
INSERT INTO `hat_city` VALUES ('0', '371300', '临沂市', '370000');
INSERT INTO `hat_city` VALUES ('1', '110100', '市辖区', '110000');
INSERT INTO `hat_city` VALUES ('2', '110200', '县', '110000');
INSERT INTO `hat_city` VALUES ('3', '120100', '市辖区', '110000');
INSERT INTO `hat_city` VALUES ('4', '120200', '县', '110000');
INSERT INTO `hat_city` VALUES ('5', '130100', '石家庄市', '130000');
INSERT INTO `hat_city` VALUES ('6', '130200', '唐山市', '130000');
INSERT INTO `hat_city` VALUES ('7', '130300', '秦皇岛市', '130000');
INSERT INTO `hat_city` VALUES ('8', '130400', '邯郸市', '130000');
INSERT INTO `hat_city` VALUES ('9', '130500', '邢台市', '130000');
INSERT INTO `hat_city` VALUES ('10', '130600', '保定市', '130000');
INSERT INTO `hat_city` VALUES ('11', '130700', '张家口市', '130000');
INSERT INTO `hat_city` VALUES ('12', '130800', '承德市', '130000');
INSERT INTO `hat_city` VALUES ('13', '130900', '沧州市', '130000');
INSERT INTO `hat_city` VALUES ('14', '131000', '廊坊市', '130000');
INSERT INTO `hat_city` VALUES ('15', '131100', '衡水市', '130000');
INSERT INTO `hat_city` VALUES ('16', '140100', '太原市', '140000');
INSERT INTO `hat_city` VALUES ('17', '140200', '大同市', '140000');
INSERT INTO `hat_city` VALUES ('18', '140300', '阳泉市', '140000');
INSERT INTO `hat_city` VALUES ('19', '140400', '长治市', '140000');
INSERT INTO `hat_city` VALUES ('20', '140500', '晋城市', '140000');
INSERT INTO `hat_city` VALUES ('21', '140600', '朔州市', '140000');
INSERT INTO `hat_city` VALUES ('22', '140700', '晋中市', '140000');
INSERT INTO `hat_city` VALUES ('23', '140800', '运城市', '140000');
INSERT INTO `hat_city` VALUES ('24', '140900', '忻州市', '140000');
INSERT INTO `hat_city` VALUES ('25', '14115000', '临汾市', '140000');
INSERT INTO `hat_city` VALUES ('26', '141100', '吕梁市', '140000');
INSERT INTO `hat_city` VALUES ('27', '0100', '呼和浩特市', '0000');
INSERT INTO `hat_city` VALUES ('28', '0200', '包头市', '0000');
INSERT INTO `hat_city` VALUES ('29', '0300', '乌海市', '0000');
INSERT INTO `hat_city` VALUES ('30', '0400', '赤峰市', '0000');
INSERT INTO `hat_city` VALUES ('31', '0500', '通辽市', '0000');
INSERT INTO `hat_city` VALUES ('32', '0600', '鄂尔多斯市', '0000');
INSERT INTO `hat_city` VALUES ('33', '0700', '呼伦贝尔市', '0000');
INSERT INTO `hat_city` VALUES ('34', '0800', '巴彦淖尔市', '0000');
INSERT INTO `hat_city` VALUES ('35', '0900', '乌兰察布市', '0000');
INSERT INTO `hat_city` VALUES ('36', '2200', '兴安盟', '0000');
INSERT INTO `hat_city` VALUES ('37', '2500', '锡林郭勒盟', '0000');
INSERT INTO `hat_city` VALUES ('38', '2900', '阿拉善盟', '0000');
INSERT INTO `hat_city` VALUES ('39', '210100', '沈阳市', '210000');
INSERT INTO `hat_city` VALUES ('40', '210200', '大连市', '210000');
INSERT INTO `hat_city` VALUES ('41', '210300', '鞍山市', '210000');
INSERT INTO `hat_city` VALUES ('42', '210400', '抚顺市', '210000');
INSERT INTO `hat_city` VALUES ('43', '210500', '本溪市', '210000');
INSERT INTO `hat_city` VALUES ('44', '210600', '丹东市', '210000');
INSERT INTO `hat_city` VALUES ('45', '210700', '锦州市', '210000');
INSERT INTO `hat_city` VALUES ('46', '210800', '营口市', '210000');
INSERT INTO `hat_city` VALUES ('47', '210900', '阜新市', '210000');
INSERT INTO `hat_city` VALUES ('48', '211000', '辽阳市', '210000');
INSERT INTO `hat_city` VALUES ('49', '211100', '盘锦市', '210000');
INSERT INTO `hat_city` VALUES ('50', '211200', '铁岭市', '210000');
INSERT INTO `hat_city` VALUES ('51', '211300', '朝阳市', '210000');
INSERT INTO `hat_city` VALUES ('52', '211400', '葫芦岛市', '210000');
INSERT INTO `hat_city` VALUES ('53', '220100', '长春市', '220000');
INSERT INTO `hat_city` VALUES ('54', '220200', '吉林市', '220000');
INSERT INTO `hat_city` VALUES ('55', '220300', '四平市', '220000');
INSERT INTO `hat_city` VALUES ('56', '220400', '辽源市', '220000');
INSERT INTO `hat_city` VALUES ('57', '220500', '通化市', '220000');
INSERT INTO `hat_city` VALUES ('58', '220600', '白山市', '220000');
INSERT INTO `hat_city` VALUES ('59', '220700', '松原市', '220000');
INSERT INTO `hat_city` VALUES ('60', '220800', '白城市', '220000');
INSERT INTO `hat_city` VALUES ('61', '222400', '延边朝鲜族自治州', '220000');
INSERT INTO `hat_city` VALUES ('62', '230100', '哈尔滨市', '230000');
INSERT INTO `hat_city` VALUES ('63', '230200', '齐齐哈尔市', '230000');
INSERT INTO `hat_city` VALUES ('64', '230300', '鸡西市', '230000');
INSERT INTO `hat_city` VALUES ('65', '230400', '鹤岗市', '230000');
INSERT INTO `hat_city` VALUES ('66', '230500', '双鸭山市', '230000');
INSERT INTO `hat_city` VALUES ('67', '230600', '大庆市', '230000');
INSERT INTO `hat_city` VALUES ('68', '230700', '伊春市', '230000');
INSERT INTO `hat_city` VALUES ('69', '230800', '佳木斯市', '230000');
INSERT INTO `hat_city` VALUES ('70', '230900', '七台河市', '230000');
INSERT INTO `hat_city` VALUES ('71', '231000', '牡丹江市', '230000');
INSERT INTO `hat_city` VALUES ('72', '231100', '黑河市', '230000');
INSERT INTO `hat_city` VALUES ('73', '231200', '绥化市', '230000');
INSERT INTO `hat_city` VALUES ('74', '232700', '大兴安岭地区', '230000');
INSERT INTO `hat_city` VALUES ('75', '310100', '市辖区', '310000');
INSERT INTO `hat_city` VALUES ('76', '310200', '县', '310000');
INSERT INTO `hat_city` VALUES ('77', '320100', '南京市', '320000');
INSERT INTO `hat_city` VALUES ('78', '320200', '无锡市', '320000');
INSERT INTO `hat_city` VALUES ('79', '320300', '徐州市', '320000');
INSERT INTO `hat_city` VALUES ('80', '320400', '常州市', '320000');
INSERT INTO `hat_city` VALUES ('81', '320500', '苏州市', '320000');
INSERT INTO `hat_city` VALUES ('82', '320600', '南通市', '320000');
INSERT INTO `hat_city` VALUES ('83', '320700', '连云港市', '320000');
INSERT INTO `hat_city` VALUES ('84', '320800', '淮安市', '320000');
INSERT INTO `hat_city` VALUES ('85', '320900', '盐城市', '320000');
INSERT INTO `hat_city` VALUES ('86', '321000', '扬州市', '320000');
INSERT INTO `hat_city` VALUES ('87', '321100', '镇江市', '320000');
INSERT INTO `hat_city` VALUES ('88', '321200', '泰州市', '320000');
INSERT INTO `hat_city` VALUES ('89', '321300', '宿迁市', '320000');
INSERT INTO `hat_city` VALUES ('90', '330100', '杭州市', '330000');
INSERT INTO `hat_city` VALUES ('91', '330200', '宁波市', '330000');
INSERT INTO `hat_city` VALUES ('92', '330300', '温州市', '330000');
INSERT INTO `hat_city` VALUES ('93', '330400', '嘉兴市', '330000');
INSERT INTO `hat_city` VALUES ('94', '330500', '湖州市', '330000');
INSERT INTO `hat_city` VALUES ('95', '330600', '绍兴市', '330000');
INSERT INTO `hat_city` VALUES ('96', '330700', '金华市', '330000');
INSERT INTO `hat_city` VALUES ('97', '330800', '衢州市', '330000');
INSERT INTO `hat_city` VALUES ('98', '330900', '舟山市', '330000');
INSERT INTO `hat_city` VALUES ('99', '331000', '台州市', '330000');
INSERT INTO `hat_city` VALUES ('100', '331100', '丽水市', '330000');
INSERT INTO `hat_city` VALUES ('101', '340100', '合肥市', '340000');
INSERT INTO `hat_city` VALUES ('102', '340200', '芜湖市', '340000');
INSERT INTO `hat_city` VALUES ('103', '340300', '蚌埠市', '340000');
INSERT INTO `hat_city` VALUES ('104', '340400', '淮南市', '340000');
INSERT INTO `hat_city` VALUES ('105', '340500', '马鞍山市', '340000');
INSERT INTO `hat_city` VALUES ('106', '340600', '淮北市', '340000');
INSERT INTO `hat_city` VALUES ('107', '340700', '铜陵市', '340000');
INSERT INTO `hat_city` VALUES ('108', '340800', '安庆市', '340000');
INSERT INTO `hat_city` VALUES ('109', '34115000', '黄山市', '340000');
INSERT INTO `hat_city` VALUES ('110', '341100', '滁州市', '340000');
INSERT INTO `hat_city` VALUES ('111', '341200', '阜阳市', '340000');
INSERT INTO `hat_city` VALUES ('112', '341300', '宿州市', '340000');
INSERT INTO `hat_city` VALUES ('113', '341400', '巢湖市', '340000');
INSERT INTO `hat_city` VALUES ('114', '3400', '六安市', '340000');
INSERT INTO `hat_city` VALUES ('115', '341600', '亳州市', '340000');
INSERT INTO `hat_city` VALUES ('116', '341700', '池州市', '340000');
INSERT INTO `hat_city` VALUES ('117', '341800', '宣城市', '340000');
INSERT INTO `hat_city` VALUES ('118', '350100', '福州市', '350000');
INSERT INTO `hat_city` VALUES ('119', '350200', '厦门市', '350000');
INSERT INTO `hat_city` VALUES ('120', '350300', '莆田市', '350000');
INSERT INTO `hat_city` VALUES ('121', '350400', '三明市', '350000');
INSERT INTO `hat_city` VALUES ('122', '350500', '泉州市', '350000');
INSERT INTO `hat_city` VALUES ('123', '350600', '漳州市', '350000');
INSERT INTO `hat_city` VALUES ('124', '350700', '南平市', '350000');
INSERT INTO `hat_city` VALUES ('125', '350800', '龙岩市', '350000');
INSERT INTO `hat_city` VALUES ('126', '350900', '宁德市', '350000');
INSERT INTO `hat_city` VALUES ('127', '360100', '南昌市', '360000');
INSERT INTO `hat_city` VALUES ('128', '360200', '景德镇市', '360000');
INSERT INTO `hat_city` VALUES ('129', '360300', '萍乡市', '360000');
INSERT INTO `hat_city` VALUES ('130', '360400', '九江市', '360000');
INSERT INTO `hat_city` VALUES ('131', '360500', '新余市', '360000');
INSERT INTO `hat_city` VALUES ('132', '360600', '鹰潭市', '360000');
INSERT INTO `hat_city` VALUES ('133', '360700', '赣州市', '360000');
INSERT INTO `hat_city` VALUES ('134', '360800', '吉安市', '360000');
INSERT INTO `hat_city` VALUES ('135', '360900', '宜春市', '360000');
INSERT INTO `hat_city` VALUES ('136', '361000', '抚州市', '360000');
INSERT INTO `hat_city` VALUES ('137', '361100', '上饶市', '360000');
INSERT INTO `hat_city` VALUES ('138', '370100', '济南市', '370000');
INSERT INTO `hat_city` VALUES ('139', '370200', '青岛市', '370000');
INSERT INTO `hat_city` VALUES ('140', '370300', '淄博市', '370000');
INSERT INTO `hat_city` VALUES ('141', '370400', '枣庄市', '370000');
INSERT INTO `hat_city` VALUES ('142', '370500', '东营市', '370000');
INSERT INTO `hat_city` VALUES ('143', '370600', '烟台市', '370000');
INSERT INTO `hat_city` VALUES ('144', '370700', '潍坊市', '370000');
INSERT INTO `hat_city` VALUES ('145', '370800', '济宁市', '370000');
INSERT INTO `hat_city` VALUES ('146', '370900', '泰安市', '370000');
INSERT INTO `hat_city` VALUES ('147', '371000', '威海市', '370000');
INSERT INTO `hat_city` VALUES ('148', '371100', '日照市', '370000');
INSERT INTO `hat_city` VALUES ('149', '371200', '莱芜市', '370000');
INSERT INTO `hat_city` VALUES ('151', '371400', '德州市', '370000');
INSERT INTO `hat_city` VALUES ('152', '3700', '聊城市', '370000');
INSERT INTO `hat_city` VALUES ('153', '371600', '滨州市', '370000');
INSERT INTO `hat_city` VALUES ('154', '371700', '荷泽市', '370000');
INSERT INTO `hat_city` VALUES ('155', '410100', '郑州市', '41150000');
INSERT INTO `hat_city` VALUES ('156', '410200', '开封市', '41150000');
INSERT INTO `hat_city` VALUES ('157', '410300', '洛阳市', '41150000');
INSERT INTO `hat_city` VALUES ('158', '410400', '平顶山市', '41150000');
INSERT INTO `hat_city` VALUES ('159', '410500', '安阳市', '41150000');
INSERT INTO `hat_city` VALUES ('160', '410600', '鹤壁市', '41150000');
INSERT INTO `hat_city` VALUES ('161', '410700', '新乡市', '41150000');
INSERT INTO `hat_city` VALUES ('162', '410800', '焦作市', '41150000');
INSERT INTO `hat_city` VALUES ('163', '410900', '濮阳市', '41150000');
INSERT INTO `hat_city` VALUES ('164', '411000', '许昌市', '41150000');
INSERT INTO `hat_city` VALUES ('165', '411100', '漯河市', '41150000');
INSERT INTO `hat_city` VALUES ('166', '411200', '三门峡市', '41150000');
INSERT INTO `hat_city` VALUES ('167', '411300', '南阳市', '41150000');
INSERT INTO `hat_city` VALUES ('168', '411400', '商丘市', '41150000');
INSERT INTO `hat_city` VALUES ('169', '411500', '信阳市', '41150000');
INSERT INTO `hat_city` VALUES ('170', '411600', '周口市', '41150000');
INSERT INTO `hat_city` VALUES ('171', '411700', '驻马店市', '41150000');
INSERT INTO `hat_city` VALUES ('172', '420100', '武汉市', '420000');
INSERT INTO `hat_city` VALUES ('173', '420200', '黄石市', '420000');
INSERT INTO `hat_city` VALUES ('174', '420300', '十堰市', '420000');
INSERT INTO `hat_city` VALUES ('175', '420500', '宜昌市', '420000');
INSERT INTO `hat_city` VALUES ('176', '420600', '襄樊市', '420000');
INSERT INTO `hat_city` VALUES ('177', '420700', '鄂州市', '420000');
INSERT INTO `hat_city` VALUES ('178', '420800', '荆门市', '420000');
INSERT INTO `hat_city` VALUES ('179', '420900', '孝感市', '420000');
INSERT INTO `hat_city` VALUES ('180', '421000', '荆州市', '420000');
INSERT INTO `hat_city` VALUES ('181', '421100', '黄冈市', '420000');
INSERT INTO `hat_city` VALUES ('182', '421200', '咸宁市', '420000');
INSERT INTO `hat_city` VALUES ('183', '421300', '随州市', '420000');
INSERT INTO `hat_city` VALUES ('184', '422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `hat_city` VALUES ('185', '429000', '省直辖行政单位', '420000');
INSERT INTO `hat_city` VALUES ('186', '430100', '长沙市', '430000');
INSERT INTO `hat_city` VALUES ('187', '430200', '株洲市', '430000');
INSERT INTO `hat_city` VALUES ('188', '430300', '湘潭市', '430000');
INSERT INTO `hat_city` VALUES ('189', '430400', '衡阳市', '430000');
INSERT INTO `hat_city` VALUES ('190', '430500', '邵阳市', '430000');
INSERT INTO `hat_city` VALUES ('191', '430600', '岳阳市', '430000');
INSERT INTO `hat_city` VALUES ('192', '430700', '常德市', '430000');
INSERT INTO `hat_city` VALUES ('193', '430800', '张家界市', '430000');
INSERT INTO `hat_city` VALUES ('194', '430900', '益阳市', '430000');
INSERT INTO `hat_city` VALUES ('195', '431000', '郴州市', '430000');
INSERT INTO `hat_city` VALUES ('196', '431100', '永州市', '430000');
INSERT INTO `hat_city` VALUES ('197', '431200', '怀化市', '430000');
INSERT INTO `hat_city` VALUES ('198', '431300', '娄底市', '430000');
INSERT INTO `hat_city` VALUES ('199', '433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `hat_city` VALUES ('200', '440100', '广州市', '440000');
INSERT INTO `hat_city` VALUES ('201', '440200', '韶关市', '440000');
INSERT INTO `hat_city` VALUES ('202', '440300', '深圳市', '440000');
INSERT INTO `hat_city` VALUES ('203', '440400', '珠海市', '440000');
INSERT INTO `hat_city` VALUES ('204', '440500', '汕头市', '440000');
INSERT INTO `hat_city` VALUES ('205', '440600', '佛山市', '440000');
INSERT INTO `hat_city` VALUES ('206', '440700', '江门市', '440000');
INSERT INTO `hat_city` VALUES ('207', '440800', '湛江市', '440000');
INSERT INTO `hat_city` VALUES ('208', '440900', '茂名市', '440000');
INSERT INTO `hat_city` VALUES ('209', '441200', '肇庆市', '440000');
INSERT INTO `hat_city` VALUES ('210', '441300', '惠州市', '440000');
INSERT INTO `hat_city` VALUES ('211', '441400', '梅州市', '440000');
INSERT INTO `hat_city` VALUES ('212', '4400', '汕尾市', '440000');
INSERT INTO `hat_city` VALUES ('213', '441600', '河源市', '440000');
INSERT INTO `hat_city` VALUES ('214', '441700', '阳江市', '440000');
INSERT INTO `hat_city` VALUES ('215', '441800', '清远市', '440000');
INSERT INTO `hat_city` VALUES ('216', '441900', '东莞市', '440000');
INSERT INTO `hat_city` VALUES ('217', '442000', '中山市', '440000');
INSERT INTO `hat_city` VALUES ('218', '445100', '潮州市', '440000');
INSERT INTO `hat_city` VALUES ('219', '445200', '揭阳市', '440000');
INSERT INTO `hat_city` VALUES ('220', '445300', '云浮市', '440000');
INSERT INTO `hat_city` VALUES ('221', '450100', '南宁市', '450000');
INSERT INTO `hat_city` VALUES ('222', '450200', '柳州市', '450000');
INSERT INTO `hat_city` VALUES ('223', '450300', '桂林市', '450000');
INSERT INTO `hat_city` VALUES ('224', '450400', '梧州市', '450000');
INSERT INTO `hat_city` VALUES ('225', '450500', '北海市', '450000');
INSERT INTO `hat_city` VALUES ('226', '450600', '防城港市', '450000');
INSERT INTO `hat_city` VALUES ('227', '450700', '钦州市', '450000');
INSERT INTO `hat_city` VALUES ('228', '450800', '贵港市', '450000');
INSERT INTO `hat_city` VALUES ('229', '450900', '玉林市', '450000');
INSERT INTO `hat_city` VALUES ('230', '451000', '百色市', '450000');
INSERT INTO `hat_city` VALUES ('231', '451100', '贺州市', '450000');
INSERT INTO `hat_city` VALUES ('232', '451200', '河池市', '450000');
INSERT INTO `hat_city` VALUES ('233', '451300', '来宾市', '450000');
INSERT INTO `hat_city` VALUES ('234', '451400', '崇左市', '450000');
INSERT INTO `hat_city` VALUES ('235', '460100', '海口市', '460000');
INSERT INTO `hat_city` VALUES ('236', '460200', '三亚市', '460000');
INSERT INTO `hat_city` VALUES ('237', '469000', '省直辖县级行政单位', '460000');
INSERT INTO `hat_city` VALUES ('238', '500100', '市辖区', '500000');
INSERT INTO `hat_city` VALUES ('239', '500200', '县', '500000');
INSERT INTO `hat_city` VALUES ('240', '500300', '市', '500000');
INSERT INTO `hat_city` VALUES ('241', '510100', '成都市', '510000');
INSERT INTO `hat_city` VALUES ('242', '510300', '自贡市', '510000');
INSERT INTO `hat_city` VALUES ('243', '510400', '攀枝花市', '510000');
INSERT INTO `hat_city` VALUES ('244', '510500', '泸州市', '510000');
INSERT INTO `hat_city` VALUES ('245', '510600', '德阳市', '510000');
INSERT INTO `hat_city` VALUES ('246', '510700', '绵阳市', '510000');
INSERT INTO `hat_city` VALUES ('247', '510800', '广元市', '510000');
INSERT INTO `hat_city` VALUES ('248', '510900', '遂宁市', '510000');
INSERT INTO `hat_city` VALUES ('249', '511000', '内江市', '510000');
INSERT INTO `hat_city` VALUES ('250', '511100', '乐山市', '510000');
INSERT INTO `hat_city` VALUES ('251', '511300', '南充市', '510000');
INSERT INTO `hat_city` VALUES ('252', '511400', '眉山市', '510000');
INSERT INTO `hat_city` VALUES ('253', '5100', '宜宾市', '510000');
INSERT INTO `hat_city` VALUES ('254', '511600', '广安市', '510000');
INSERT INTO `hat_city` VALUES ('255', '511700', '达州市', '510000');
INSERT INTO `hat_city` VALUES ('256', '511800', '雅安市', '510000');
INSERT INTO `hat_city` VALUES ('257', '511900', '巴中市', '510000');
INSERT INTO `hat_city` VALUES ('258', '512000', '资阳市', '510000');
INSERT INTO `hat_city` VALUES ('259', '513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `hat_city` VALUES ('260', '513300', '甘孜藏族自治州', '510000');
INSERT INTO `hat_city` VALUES ('261', '513400', '凉山彝族自治州', '510000');
INSERT INTO `hat_city` VALUES ('262', '520100', '贵阳市', '520000');
INSERT INTO `hat_city` VALUES ('263', '520200', '六盘水市', '520000');
INSERT INTO `hat_city` VALUES ('264', '520300', '遵义市', '520000');
INSERT INTO `hat_city` VALUES ('265', '520400', '安顺市', '520000');
INSERT INTO `hat_city` VALUES ('266', '522200', '铜仁地区', '520000');
INSERT INTO `hat_city` VALUES ('267', '522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `hat_city` VALUES ('268', '522400', '毕节地区', '520000');
INSERT INTO `hat_city` VALUES ('269', '522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `hat_city` VALUES ('270', '522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `hat_city` VALUES ('271', '530100', '昆明市', '530000');
INSERT INTO `hat_city` VALUES ('272', '530300', '曲靖市', '530000');
INSERT INTO `hat_city` VALUES ('273', '530400', '玉溪市', '530000');
INSERT INTO `hat_city` VALUES ('274', '530500', '保山市', '530000');
INSERT INTO `hat_city` VALUES ('275', '530600', '昭通市', '530000');
INSERT INTO `hat_city` VALUES ('276', '530700', '丽江市', '530000');
INSERT INTO `hat_city` VALUES ('277', '530800', '思茅市', '530000');
INSERT INTO `hat_city` VALUES ('278', '530900', '临沧市', '530000');
INSERT INTO `hat_city` VALUES ('279', '532300', '楚雄彝族自治州', '530000');
INSERT INTO `hat_city` VALUES ('280', '532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `hat_city` VALUES ('281', '532600', '文山壮族苗族自治州', '530000');
INSERT INTO `hat_city` VALUES ('282', '532800', '西双版纳傣族自治州', '530000');
INSERT INTO `hat_city` VALUES ('283', '532900', '大理白族自治州', '530000');
INSERT INTO `hat_city` VALUES ('284', '533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `hat_city` VALUES ('285', '533300', '怒江傈僳族自治州', '530000');
INSERT INTO `hat_city` VALUES ('286', '533400', '迪庆藏族自治州', '530000');
INSERT INTO `hat_city` VALUES ('287', '540100', '拉萨市', '540000');
INSERT INTO `hat_city` VALUES ('288', '542100', '昌都地区', '540000');
INSERT INTO `hat_city` VALUES ('289', '542200', '山南地区', '540000');
INSERT INTO `hat_city` VALUES ('290', '542300', '日喀则地区', '540000');
INSERT INTO `hat_city` VALUES ('291', '542400', '那曲地区', '540000');
INSERT INTO `hat_city` VALUES ('292', '542500', '阿里地区', '540000');
INSERT INTO `hat_city` VALUES ('293', '542600', '林芝地区', '540000');
INSERT INTO `hat_city` VALUES ('294', '610100', '西安市', '610000');
INSERT INTO `hat_city` VALUES ('295', '610200', '铜川市', '610000');
INSERT INTO `hat_city` VALUES ('296', '610300', '宝鸡市', '610000');
INSERT INTO `hat_city` VALUES ('297', '610400', '咸阳市', '610000');
INSERT INTO `hat_city` VALUES ('298', '610500', '渭南市', '610000');
INSERT INTO `hat_city` VALUES ('299', '610600', '延安市', '610000');
INSERT INTO `hat_city` VALUES ('300', '610700', '汉中市', '610000');
INSERT INTO `hat_city` VALUES ('301', '610800', '榆林市', '610000');
INSERT INTO `hat_city` VALUES ('302', '610900', '安康市', '610000');
INSERT INTO `hat_city` VALUES ('303', '611000', '商洛市', '610000');
INSERT INTO `hat_city` VALUES ('304', '620100', '兰州市', '620000');
INSERT INTO `hat_city` VALUES ('305', '620200', '嘉峪关市', '620000');
INSERT INTO `hat_city` VALUES ('306', '620300', '金昌市', '620000');
INSERT INTO `hat_city` VALUES ('307', '620400', '白银市', '620000');
INSERT INTO `hat_city` VALUES ('308', '620500', '天水市', '620000');
INSERT INTO `hat_city` VALUES ('309', '620600', '武威市', '620000');
INSERT INTO `hat_city` VALUES ('310', '620700', '张掖市', '620000');
INSERT INTO `hat_city` VALUES ('311', '620800', '平凉市', '620000');
INSERT INTO `hat_city` VALUES ('312', '620900', '酒泉市', '620000');
INSERT INTO `hat_city` VALUES ('313', '621000', '庆阳市', '620000');
INSERT INTO `hat_city` VALUES ('314', '621100', '定西市', '620000');
INSERT INTO `hat_city` VALUES ('315', '621200', '陇南市', '620000');
INSERT INTO `hat_city` VALUES ('316', '622900', '临夏回族自治州', '620000');
INSERT INTO `hat_city` VALUES ('317', '623000', '甘南藏族自治州', '620000');
INSERT INTO `hat_city` VALUES ('318', '630100', '西宁市', '630000');
INSERT INTO `hat_city` VALUES ('319', '632100', '海东地区', '630000');
INSERT INTO `hat_city` VALUES ('320', '632200', '海北藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('321', '632300', '黄南藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('322', '632500', '海南藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('323', '632600', '果洛藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('324', '632700', '玉树藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('325', '632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `hat_city` VALUES ('326', '640100', '银川市', '640000');
INSERT INTO `hat_city` VALUES ('327', '640200', '石嘴山市', '640000');
INSERT INTO `hat_city` VALUES ('328', '640300', '吴忠市', '640000');
INSERT INTO `hat_city` VALUES ('329', '640400', '固原市', '640000');
INSERT INTO `hat_city` VALUES ('330', '640500', '中卫市', '640000');
INSERT INTO `hat_city` VALUES ('331', '650100', '乌鲁木齐市', '650000');
INSERT INTO `hat_city` VALUES ('332', '650200', '克拉玛依市', '650000');
INSERT INTO `hat_city` VALUES ('333', '652100', '吐鲁番地区', '650000');
INSERT INTO `hat_city` VALUES ('334', '652200', '哈密地区', '650000');
INSERT INTO `hat_city` VALUES ('335', '652300', '昌吉回族自治州', '650000');
INSERT INTO `hat_city` VALUES ('336', '652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `hat_city` VALUES ('337', '652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `hat_city` VALUES ('338', '652900', '阿克苏地区', '650000');
INSERT INTO `hat_city` VALUES ('339', '653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `hat_city` VALUES ('340', '653100', '喀什地区', '650000');
INSERT INTO `hat_city` VALUES ('341', '653200', '和田地区', '650000');
INSERT INTO `hat_city` VALUES ('342', '654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `hat_city` VALUES ('343', '654200', '塔城地区', '650000');
INSERT INTO `hat_city` VALUES ('344', '654300', '阿勒泰地区', '650000');
INSERT INTO `hat_city` VALUES ('345', '659000', '省直辖行政单位', '650000');

-- ----------------------------
-- Table structure for `hat_province`
-- ----------------------------
DROP TABLE IF EXISTS `hat_province`;
CREATE TABLE `hat_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provinceID` varchar(10) DEFAULT NULL,
  `province` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hat_province
-- ----------------------------
INSERT INTO `hat_province` VALUES ('3', '130000', '河北省');
INSERT INTO `hat_province` VALUES ('4', '140000', '山西省');
INSERT INTO `hat_province` VALUES ('5', '0000', '内蒙古自治区');
INSERT INTO `hat_province` VALUES ('6', '210000', '辽宁省');
INSERT INTO `hat_province` VALUES ('7', '220000', '吉林省');
INSERT INTO `hat_province` VALUES ('8', '230000', '黑龙江省');
INSERT INTO `hat_province` VALUES ('9', '310000', '上海市');
INSERT INTO `hat_province` VALUES ('10', '320000', '江苏省');
INSERT INTO `hat_province` VALUES ('11', '330000', '浙江省');
INSERT INTO `hat_province` VALUES ('12', '340000', '安徽省');
INSERT INTO `hat_province` VALUES ('13', '350000', '福建省');
INSERT INTO `hat_province` VALUES ('14', '360000', '江西省');
INSERT INTO `hat_province` VALUES ('16', '41150000', '河南省');
INSERT INTO `hat_province` VALUES ('18', '430000', '湖南省');
INSERT INTO `hat_province` VALUES ('19', '440000', '广东省');
INSERT INTO `hat_province` VALUES ('20', '450000', '广西壮族自治区');
INSERT INTO `hat_province` VALUES ('21', '460000', '海南省');
INSERT INTO `hat_province` VALUES ('22', '500000', '重庆市');
INSERT INTO `hat_province` VALUES ('24', '520000', '贵州省');
INSERT INTO `hat_province` VALUES ('25', '530000', '云南省');
INSERT INTO `hat_province` VALUES ('26', '540000', '西藏自治区');
INSERT INTO `hat_province` VALUES ('27', '610000', '陕西省');
INSERT INTO `hat_province` VALUES ('28', '620000', '甘肃省');
INSERT INTO `hat_province` VALUES ('29', '630000', '青海省');
INSERT INTO `hat_province` VALUES ('30', '640000', '宁夏回族自治区');
INSERT INTO `hat_province` VALUES ('31', '650000', '新疆维吾尔自治区');
INSERT INTO `hat_province` VALUES ('32', '710000', '台湾省');
INSERT INTO `hat_province` VALUES ('33', '810000', '香港特别行政区');
INSERT INTO `hat_province` VALUES ('34', '820000', '澳门特别行政区');
INSERT INTO `hat_province` VALUES ('37', '110000', '北京市');
INSERT INTO `hat_province` VALUES ('38', '420000', '湖北省');

-- ----------------------------
-- Table structure for `hat_street`
-- ----------------------------
DROP TABLE IF EXISTS `hat_street`;
CREATE TABLE `hat_street` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `street` varchar(50) DEFAULT NULL COMMENT '街道名称',
  `streetID` varchar(8) DEFAULT NULL COMMENT '街道编码',
  `father` varchar(8) DEFAULT NULL COMMENT '父类',
  `hats_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `hats_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hat_street
-- ----------------------------
INSERT INTO `hat_street` VALUES ('1', '光谷/鲁巷', '1000', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('2', '石碑岭/街道口', '1001', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('3', '武汉火车站/杨春湖', '1002', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('4', '虎泉/关西', '1003', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('5', '光谷天地', '1004', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('6', '东湖风景区', '1005', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('7', '珞狮南路', '1006', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('8', '黄家湖大学城', '1007', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('9', '南湖城市广场', '1008', '420111', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('10', '腰路堤/建港', '1009', '420105', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('11', '王家湾', '1010', '420105', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('12', '钟家村', '1011', '420105', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('13', '琴台', '1012', '420105', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('14', '四新', '1013', '420105', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('15', '江汉路步行街', '1014', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('16', '西北湖', '1015', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('17', '汉口火车站', '1016', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('18', '武商广场', '1017', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('19', '菱角湖', '1018', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('20', '青年路/常青路', '1019', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('21', '常青花园', '1020', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('22', '六渡桥/汉正街', '1021', '420103', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('23', '首义汇/阅马场', '1022', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('24', '徐东大街', '1023', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('25', '付家坡/大东门', '1024', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('26', '武昌火车站', '1025', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('27', '水果湖', '1026', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('28', '南湖花园', '1027', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('29', '汉街', '1028', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('30', '司门口', '1029', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('31', '中南路/洪山广场', '1030', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('32', '丁字桥/石牌岭', '1031', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('33', '岳家嘴/东亭', '1032', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('34', '和平大道积玉桥', '1033', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('35', '白沙洲', '1034', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('36', '海达广场', '1035', '420106', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('37', '硚口路', '1036', '420104', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('38', '古田路', '1037', '420104', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('39', '武胜路凯德广场', '1038', '420104', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('40', '武胜路', '1039', '420104', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('41', '汉西', '1040', '420104', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('42', '武钢厂区/武东', '1041', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('43', '工业路', '1042', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('44', '红钢城/沿港路', '1043', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('45', '建二/八大家', '1044', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('46', '欢乐大道/仁和路', '1045', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('47', '奥山/钢都花园', '1046', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('48', '余家头/四美塘', '1047', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('49', '铁机/柴林花园', '1048', '420107', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('50', '解放公园/永清街', '1049', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('51', '客运港/江滩', '1050', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('52', '港澳台风情街', '1051', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('53', '百步亭/二七', '1052', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('54', '后湖', '1053', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('55', '武汉天地', '1054', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('56', '吉庆街/大智路', '1055', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('57', '三阳路/山海关路', '1056', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('58', '竹叶山/花桥', '1057', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('59', '江汉路/南京路', '1058', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('60', '盘龙城', '1059', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('61', '新荣/堤角', '1060', '420102', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('62', '吴家山', '1061', '420112', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('63', '金银湖', '1062', '420112', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('64', '藏龙岛', '1063', '420115', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('65', '纸坊', '1064', '420115', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('66', '大花岭', '1065', '420115', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('67', '庙山', '1066', '420115', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('68', '梁子湖', '1067', '420115', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('69', '离黄陂广场', '1068', '420116', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('70', '盛世大厦', '1069', '420116', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('71', '黄陂广场', '1070', '420116', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('72', '沌口', '1071', '420114', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('73', '蔡甸城区', '1072', '420114', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('74', '武生院/工程学院', '1073', '420117', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('75', '阳逻街区', '1074', '420117', '10/18/2016 11:48:06', '');
INSERT INTO `hat_street` VALUES ('76', '邾城街', '1075', '420117', '10/18/2016 11:48:06', '');

-- ----------------------------
-- Table structure for `sys_gl_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_gl_qx`;
CREATE TABLE `sys_gl_qx` (
  `GL_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `FX_QX` int(10) DEFAULT NULL,
  `FW_QX` int(10) DEFAULT NULL,
  `QX1` int(10) DEFAULT NULL,
  `QX2` int(10) DEFAULT NULL,
  `QX3` int(10) DEFAULT NULL,
  `QX4` int(10) DEFAULT NULL,
  PRIMARY KEY (`GL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_gl_qx
-- ----------------------------
INSERT INTO `sys_gl_qx` VALUES ('08c3ac84ff0d44bc8e02cb3772e74c6f', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('14bc4e26549249c4be327fa7d55817d1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('2', '1', '0', '0', '1', '1', '1', '1');
INSERT INTO `sys_gl_qx` VALUES ('5034645252d645688f1a52f6a800d562', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '7', '0', '0', '1', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('56315d61216f42dbb64027775c9ddd67', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '7', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('6e116b1400d74163a777b445a532acd9', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('7a50f231349046e7b42f23fd26a031d0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('8ec7399d414a40dabe6558c642b71549', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('917777f4f7e048cdab7b95b3fcf06787', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '7', '1', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('c5b999b9284946e6959622a0e36fee96', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('d1a6d1d904f9480c83bad2dd4c6fe17f', '1', '0', '0', '1', '1', '0', '0');
INSERT INTO `sys_gl_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '7', '1', '1', '1', '1', '0', '0');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(30) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '', '0', '1', 'icon-desktop', '1');
INSERT INTO `sys_menu` VALUES ('2', '角色管理', 'role.do', '1', '2', '', '1');
INSERT INTO `sys_menu` VALUES ('5', '系统用户', 'user/listUsers.do', '1', '3', '', '1');
INSERT INTO `sys_menu` VALUES ('21', '菜单管理', 'menu', '1', '1', '', '1');
INSERT INTO `sys_menu` VALUES ('22', '用户管理', '', '0', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('23', 'APP用户', 'appuser/appUserList.do', '22', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('24', '店铺管理', '', '0', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('25', '店铺信息', 'shop/shopList.do', '24', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('26', '商品管理', '', '0', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('27', '商品信息', 'good/goodList.do', '26', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('28', '广告管理', '', '0', '5', null, '1');
INSERT INTO `sys_menu` VALUES ('29', '轮播图信息', 'banner/bannerList.do', '28', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('30', '商圈管理', '', '0', '6', null, '1');
INSERT INTO `sys_menu` VALUES ('31', '商圈列表', 'tradArea/tradAreaList.do', '30', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('32', '店铺类型列表', 'shopType/shopTypeList', '24', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('33', '商品类型列表', 'goodType/goodTypeList.do', '26', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('34', '系统消息', 'messege/geteMessageList.do', '1', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('35', '加速卡', 'integral/getSpeedCardlistPage.do', '1', '', null, '1');
INSERT INTO `sys_menu` VALUES ('36', '订单管理', '', '0', '7', null, '1');
INSERT INTO `sys_menu` VALUES ('37', '订单查询', 'orders/ordersList.do', '36', '', null, '1');
INSERT INTO `sys_menu` VALUES ('38', '精品推荐', '', '0', '8', null, '1');
INSERT INTO `sys_menu` VALUES ('39', '发现维护', '', '0', '9', null, '1');
INSERT INTO `sys_menu` VALUES ('40', '店铺精品', 'recommend/recommendList.do?type=1', '38', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('41', '商品精品', 'recommend/recommendList.do?type=2', '38', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('42', '广告模板', 'banner/bannerView.do', '1', '4', null, '1');
INSERT INTO `sys_menu` VALUES ('43', '美食资讯', 'finds/getFoodInformationlistPage.do', '39', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('44', '美食测试', 'finds/questList.do', '39', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('45', '奖品管理', '', '0', '91', null, '1');
INSERT INTO `sys_menu` VALUES ('46', '订单退订列表', 'orders/orderBackList.do', '36', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('47', '推荐餐厅', '', '0', '92', null, '1');
INSERT INTO `sys_menu` VALUES ('48', '推荐餐厅列表', 'apply/applyList.do', '47', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('49', '奖金池', 'prize/prizePoolList.do', '45', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('50', '提现申请', '', '0', '93', null, '1');
INSERT INTO `sys_menu` VALUES ('51', '提现申请列表', 'withdraw/withdrawList.do', '50', '1', null, '1');
INSERT INTO `sys_menu` VALUES ('52', '奖品列表', 'prize/prizeList.do', '45', '2', null, '1');
INSERT INTO `sys_menu` VALUES ('53', '订单扫描', 'orders/ordersScan.do', '36', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('54', '上架审核', 'good/getallShopNewgoodslistPage.do', '26', '3', null, '1');
INSERT INTO `sys_menu` VALUES ('55', '财务管理', '', '0', '13', null, '1');
INSERT INTO `sys_menu` VALUES ('56', '店铺财务管理', 'financial/Getfinancial.do', '55', '1', null, '1');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  `QX_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理员', '72057594035830822', '0', '1', '1', '1', '1', '1');
INSERT INTO `sys_role` VALUES ('14bc4e26549249c4be327fa7d55817d1', '店主', '117093796721721378', '0', '0', '0', '0', '0', '14bc4e26549249c4be327fa7d55817d1');
INSERT INTO `sys_role` VALUES ('5034645252d645688f1a52f6a800d562', '客服', '27092185803390976', '0', '0', '0', '0', '0', '5034645252d645688f1a52f6a800d562');
INSERT INTO `sys_role` VALUES ('6e116b1400d74163a777b445a532acd9', '运营', '18467139597893632', '0', '0', '0', '0', '0', '6e116b1400d74163a777b445a532acd9');
INSERT INTO `sys_role` VALUES ('7a50f231349046e7b42f23fd26a031d0', '财务', '17557207830757376', '0', '0', '0', '0', '0', '7a50f231349046e7b42f23fd26a031d0');
INSERT INTO `sys_role` VALUES ('917777f4f7e048cdab7b95b3fcf06787', '店员', '9077774157348864', '0', '0', '0', '0', '0', '917777f4f7e048cdab7b95b3fcf06787');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  `shopkeeper_id` varchar(32) DEFAULT NULL COMMENT '店主userid',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '系统管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2016-11-07 09:23:40', '0:0:0:0:0:0:0:1', '0', null, 'default', null, null, '18788887788', null);
INSERT INTO `sys_user` VALUES ('29d79c31e6ae425cb94bc45e2599f361', 'MCNH', 'adf07454a30f53117208125431b5358f4037f25e', '', '', '14bc4e26549249c4be327fa7d55817d1', '2016-11-01 10:13:57', '211.161.163.173', '0', null, 'default', null, null, '', null);
INSERT INTO `sys_user` VALUES ('99640a5ed99649608803af9d7ce72328', 'test1', '5d8c9cfd972eadc84f1c16816c56974a818013ab', '', '', '14bc4e26549249c4be327fa7d55817d1', '2016-10-22 16:55:39', '49.211.75.139', '0', null, 'default', null, null, '', null);
INSERT INTO `sys_user` VALUES ('b62b082293a14189ac54698f20d82260', '麻城吊锅', 'fb1d08c6aa3d06cc02ab9551dff6c17316905782', '王昌斌', '', '14bc4e26549249c4be327fa7d55817d1', '2016-10-22 12:07:50', '58.49.146.152', '0', null, 'default', null, null, '', null);
INSERT INTO `sys_user` VALUES ('d312bca735d94de79f1fca2eeab195d1', 'test3', 'f167bf74fc7e1294df459f9a49d14854c0d1abb1', '', '', '14bc4e26549249c4be327fa7d55817d1', '2016-10-31 14:34:32', '119.98.105.245', '0', null, 'default', null, null, '', null);
INSERT INTO `sys_user` VALUES ('d88313a43fa34851bbd0e96ca2e07926', 'LGBL', '324577de6493e1e33914aeab76a916536d182800', '', '', '14bc4e26549249c4be327fa7d55817d1', '2016-11-07 09:12:00', '0:0:0:0:0:0:0:1', '0', null, 'default', null, null, '', null);

-- ----------------------------
-- Table structure for `sys_user_qx`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_qx`;
CREATE TABLE `sys_user_qx` (
  `U_ID` varchar(100) NOT NULL,
  `C1` int(10) DEFAULT NULL,
  `C2` int(10) DEFAULT NULL,
  `C3` int(10) DEFAULT NULL,
  `C4` int(10) DEFAULT NULL,
  `Q1` int(10) DEFAULT NULL,
  `Q2` int(10) DEFAULT NULL,
  `Q3` int(10) DEFAULT NULL,
  `Q4` int(10) DEFAULT NULL,
  PRIMARY KEY (`U_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_qx
-- ----------------------------
INSERT INTO `sys_user_qx` VALUES ('08c3ac84ff0d44bc8e02cb3772e74c6f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('1', '1', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('14bc4e26549249c4be327fa7d55817d1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('2', '1', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `sys_user_qx` VALUES ('5034645252d645688f1a52f6a800d562', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('55896f5ce3c0494fa6850775a4e29ff6', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('56315d61216f42dbb64027775c9ddd67', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('68f23fc0caee475bae8d52244dea8444', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('6e116b1400d74163a777b445a532acd9', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('7a50f231349046e7b42f23fd26a031d0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('8ec7399d414a40dabe6558c642b71549', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('917777f4f7e048cdab7b95b3fcf06787', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('b0c77c29dfa140dc9b14a29c056f824f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('c5b999b9284946e6959622a0e36fee96', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('d1a6d1d904f9480c83bad2dd4c6fe17f', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `sys_user_qx` VALUES ('f944a9df72634249bbcb8cb73b0c9b86', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `zs_bk_banner_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_banner_info`;
CREATE TABLE `zs_bk_banner_info` (
  `baid` int(4) NOT NULL AUTO_INCREMENT,
  `banner_image` varchar(1000) DEFAULT NULL COMMENT '广告图片',
  `banner_type` varchar(2) DEFAULT NULL COMMENT '广告类型:0非轮播,1轮播,2欢迎页,3引导页',
  `banner_content_img` varchar(1000) DEFAULT NULL COMMENT '广告内容图片',
  `banner_detail` mediumtext COMMENT '广告明细',
  `banner_url` varchar(500) DEFAULT NULL COMMENT '跳转地址',
  `banner_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `banner_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `banner_order` varchar(10) DEFAULT NULL COMMENT '排序',
  `banner_search` varchar(50) DEFAULT NULL COMMENT '搜索条件',
  `search_type` varchar(1) DEFAULT '0' COMMENT '类型：0:单品；1：全场',
  `model_id` varchar(11) DEFAULT NULL COMMENT '模板ID',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_banner_info
-- ----------------------------
INSERT INTO `zs_bk_banner_info` VALUES ('19', 'upload/img/banner/317f0763988246c0b860411898bcf3a7.png', '0', '', null, null, '2016-10-20 14:36:34', null, '1', null, null, '7');
INSERT INTO `zs_bk_banner_info` VALUES ('24', 'upload/img/banner/4adc924e3f7c49cca99298e5b175d70f.png', '1', '', null, null, '2016-10-20 15:16:16', null, '2', null, null, '');
INSERT INTO `zs_bk_banner_info` VALUES ('25', 'upload/img/banner/ef38e498d57d4fd3a4a1aae92bae40bc.png', '1', '', null, null, '2016-10-20 15:16:29', null, '3', null, null, '7');
INSERT INTO `zs_bk_banner_info` VALUES ('27', 'upload/img/banner/fbbc1fbb43794527addbe57d9d780159.png', '1', '', null, null, '2016-10-20 15:16:53', null, '5', null, null, '7');
INSERT INTO `zs_bk_banner_info` VALUES ('28', 'upload/img/banner/fcdf5ff8577a4a1791158ae2ebf21e6e.png', '1', '', null, null, '2016-10-20 15:21:06', null, '4', null, null, '7');
INSERT INTO `zs_bk_banner_info` VALUES ('31', 'upload/img/banner/e07135cf1297476399652f948e9f007b.png', '2', '', null, null, '2016-11-02 15:25:23', null, '1', null, null, '8');

-- ----------------------------
-- Table structure for `zs_bk_cancel_order`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_cancel_order`;
CREATE TABLE `zs_bk_cancel_order` (
  `tu_id` int(11) NOT NULL AUTO_INCREMENT,
  `cancel_no` varchar(30) DEFAULT NULL COMMENT '退货单号',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单号',
  `cancel_time` varchar(30) DEFAULT NULL COMMENT '退货时间',
  `cancel_moeny` double(10,2) DEFAULT NULL COMMENT '退款金额',
  `cancel_state` int(2) DEFAULT NULL COMMENT '退货状态 0商家已经确认退货1用户已经提交退货申请',
  `cancel_userid` varchar(11) DEFAULT NULL COMMENT '退货人id',
  `cancel_type` tinyint(2) DEFAULT NULL COMMENT '类型:0全额,1退款90%,2退款70%',
  PRIMARY KEY (`tu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='用户取消订单表';

-- ----------------------------
-- Records of zs_bk_cancel_order
-- ----------------------------
INSERT INTO `zs_bk_cancel_order` VALUES ('133', '20161104170911479153', 'BK20161104170841928114', '2016-11-04 17:14:35', '1005.00', '0', '98', '0');
INSERT INTO `zs_bk_cancel_order` VALUES ('134', '20161105153505463717', 'BK20161105152235794049', '2016-11-05 15:35:05', '3005.00', '1', '95', '0');
INSERT INTO `zs_bk_cancel_order` VALUES ('135', '20161105154325154852', 'BK20161105154203634837', '2016-11-05 15:43:25', '2704.50', '1', '95', '1');
INSERT INTO `zs_bk_cancel_order` VALUES ('136', '20161105170704456306', 'BK20161105170641532053', '2016-11-05 17:07:41', '5.00', '0', '96', '0');
INSERT INTO `zs_bk_cancel_order` VALUES ('137', '20161105171233930504', 'BK20161105171135116857', '2016-11-05 17:12:56', '35.00', '0', '96', '0');
INSERT INTO `zs_bk_cancel_order` VALUES ('138', '20161105174237943166', 'BK20161105174148765785', '2016-11-05 17:47:25', '1804.50', '0', '95', '1');
INSERT INTO `zs_bk_cancel_order` VALUES ('139', '20161105174918616064', 'BK20161105174841748822', '2016-11-05 17:49:32', '3604.50', '0', '95', '1');
INSERT INTO `zs_bk_cancel_order` VALUES ('140', '20161107090857154080', 'BK20161107090831623503', '2016-11-07 09:09:09', '904.50', '0', '95', '1');

-- ----------------------------
-- Table structure for `zs_bk_discovery_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_discovery_info`;
CREATE TABLE `zs_bk_discovery_info` (
  `dfid` int(11) NOT NULL AUTO_INCREMENT,
  `discoveryf_type` varchar(2) DEFAULT NULL COMMENT '发现类型：1:美食头条；2:营养饮食；3:吃货趣事',
  `discoveryf_image` varchar(500) DEFAULT NULL COMMENT '图片',
  `discoveryf_title` varchar(1000) DEFAULT NULL COMMENT '标题',
  `discoveryf_content` text COMMENT '内容',
  `discoveryf_detail` text COMMENT '明细',
  `discoveryf_date` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `discoveryf_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dfid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_discovery_info
-- ----------------------------
INSERT INTO `zs_bk_discovery_info` VALUES ('1', '1', 'upload/img/foodInformation/ca37ba23ce2c49459db9bb5f531005ca.png', '九寨沟的特色美食有哪些?', '<p>1.如意菜即蕨菜，因其状若一柄绿莹莹的古代如意而得名。国外把它列为健康食品，称为“山菜之王”\r\n2.雅茶是用茶树的粗枝大叶制成的茶，因产地在雅安地区，故称“雅茶”。明代称为“马茶”，清代以后祢为“边茶”。</p>', '1.如意菜即蕨菜，因其状若一柄绿莹莹的古代如意而得名。国外把它列为健康食品，称为“山菜之王”\r\n2.雅茶是用茶树的粗枝大叶制成的茶，因产地在雅安地区，故称“雅茶”。明代称为“马茶”，清代以后祢为“边茶”。', '2016-09-01 09:06:01', null);
INSERT INTO `zs_bk_discovery_info` VALUES ('2', '1', 'upload/img/foodInformation/ca37ba23ce2c49459db9bb5f531005cb.png', '青稞酒是什么酒?', '<p>青稞酒色微黄，酸中带甜，有“藏式啤酒”之称，是藏事胞生活中不可缺少的饮料，也是欢度节日和招待客人的上品。按照藏族习俗，客人来了，豪爽热情的评价要端起青稞酒壶，边斟三碗敬献客人。前两碗酒，客人按自己的酒量，可喝完，也可剩一点，但不能一点也不喝。第三碗斟满后则要一饮而尽，以示尊重评价。藏族同胞劝酒时，经常要唱酒歌，歌词丰富多彩，曲调优美动人。</p>', '青稞酒色微黄，酸中带甜，有“藏式啤酒”之称，是藏事胞生活中不可缺少的饮料，也是欢度节日和招待客人的上品。按照藏族习俗，客人来了，豪爽热情的评价要端起青稞酒壶，边斟三碗敬献客人。前两碗酒，客人按自己的酒量，可喝完，也可剩一点，但不能一点也不喝。第三碗斟满后则要一饮而尽，以示尊重评价。藏族同胞劝酒时，经常要唱酒歌，歌词丰富多彩，曲调优美动人。', '2016-09-01 09:07:01', null);
INSERT INTO `zs_bk_discovery_info` VALUES ('3', '2', 'upload/img/foodInformation/ca37ba23ce2c49459db9bb5f531005cc.png', '4个养生进补“小能手”', '<p>俗话说：“一夏无病三分虚”，此时更要遵循养生原则进补，以下4种食物堪称专属秋季的养生进补“小能手”。\r\n1.润肺---山药\r\n2.补肺---杏仁\r\n3.养阴---银耳\r\n4.多酸---葡萄</p>', '俗话说：“一夏无病三分虚”，此时更要遵循养生原则进补，以下4种食物堪称专属秋季的养生进补“小能手”。\r\n1.润肺---山药\r\n2.补肺---杏仁\r\n3.养阴---银耳\r\n4.多酸---葡萄', '2016-09-01 09:08:01', null);
INSERT INTO `zs_bk_discovery_info` VALUES ('4', '3', 'upload/img/foodInformation/ca37ba23ce2c49459db9bb5f531005cd.png', '涮火锅吃这些蔬菜当心让你胖', '<p>涮火锅最适宜吃的青菜,像白菜、生菜、油麦菜这些叶片面积大的蔬菜就不适合放进锅中，它们会大量吸附汤底中的油脂，相反，玉米，花菜，红薯，土豆等蔬菜的棱角清晰，性状不规则，而且富含更多的纤维质，不管是清汤锅还是红油锅底都适合加入涮煮的哦～</p>', '涮火锅最适宜吃的青菜,像白菜、生菜、油麦菜这些叶片面积大的蔬菜就不适合放进锅中，它们会大量吸附汤底中的油脂，相反，玉米，花菜，红薯，土豆等蔬菜的棱角清晰，性状不规则，而且富含更多的纤维质，不管是清汤锅还是红油锅底都适合加入涮煮的哦～', '2016-09-01 09:07:01', null);
INSERT INTO `zs_bk_discovery_info` VALUES ('9', '2', 'upload/img/foodInformation/01bade80e163483990163ac1ca822582.jpg', '霉变甘蔗中毒是指什么', '<p><span style=\"color: rgb(43, 43, 43); font-family: 宋体, Arial, HELVETICA; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">霉变甘蔗中毒是指食用了保存不当而霉变的甘蔗引起的急性食物中毒，常发于我国北方地区的初春季节。霉变甘蔗中的甘蔗节菱孢霉，产生的毒素主要损害人体的</span><span style=\"color: rgb(43, 43, 43); font-family: 宋体, Arial, HELVETICA; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">中枢神经系统</span></p>', null, '2016-10-11 15:18:38', null);

-- ----------------------------
-- Table structure for `zs_bk_goodstype_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_goodstype_info`;
CREATE TABLE `zs_bk_goodstype_info` (
  `ftid` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ft_foodtype_name` varchar(20) DEFAULT NULL COMMENT '菜品类型名称',
  `ft_foodtype_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `ft_foodtype_remark` varchar(500) DEFAULT NULL COMMENT '备注 ',
  PRIMARY KEY (`ftid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_goodstype_info
-- ----------------------------
INSERT INTO `zs_bk_goodstype_info` VALUES ('1', '炒菜', '2016-09-01 11:05:30', '炒菜');
INSERT INTO `zs_bk_goodstype_info` VALUES ('2', '凉菜', '2016-09-01 11:05:30', '凉菜');
INSERT INTO `zs_bk_goodstype_info` VALUES ('3', '凉面', '2016-09-01 11:05:30', '凉面');
INSERT INTO `zs_bk_goodstype_info` VALUES ('5', 'KTV', '2016-09-08 10:20:43', 'KTV');
INSERT INTO `zs_bk_goodstype_info` VALUES ('6', '烤肉', '2016-09-08 15:18:50', '烤肉');
INSERT INTO `zs_bk_goodstype_info` VALUES ('7', '火锅', '2016-09-08 15:30:39', '火锅');
INSERT INTO `zs_bk_goodstype_info` VALUES ('8', '自助餐', '2016-09-08 15:36:02', '自助餐');
INSERT INTO `zs_bk_goodstype_info` VALUES ('9', '下午茶', '2016-09-08 15:42:22', '下午茶');
INSERT INTO `zs_bk_goodstype_info` VALUES ('10', '积分兑换', '2016-09-08 15:42:22', '积分兑换');
INSERT INTO `zs_bk_goodstype_info` VALUES ('11', '特色推荐', '2016-10-13 09:53:53', '');

-- ----------------------------
-- Table structure for `zs_bk_goods_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_goods_info`;
CREATE TABLE `zs_bk_goods_info` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `goods_moeny` float(10,2) DEFAULT '0.00' COMMENT '单价',
  `goods_dis_money` int(11) DEFAULT '0' COMMENT '积分价',
  `goods_images` varchar(2000) DEFAULT NULL COMMENT '菜品图片集合',
  `goods_gtid` int(4) DEFAULT NULL COMMENT '类型ID',
  `goods_sid` int(11) DEFAULT NULL COMMENT '商铺ID',
  `goods_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `goods_ISrecommend` varchar(1) DEFAULT '0' COMMENT '是否推荐：1：是；0否',
  `goods_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `goods_taste` varchar(2) DEFAULT '0' COMMENT '菜品口味：0：无辣；1微辣；2中辣；3特辣',
  `goods_ISshelves` varchar(2) DEFAULT NULL COMMENT '菜品是否启用:0:未启用；1启用 2;禁用; 3售罄',
  `goods_up_shelves` varchar(20) DEFAULT NULL COMMENT '上架时间',
  `goods_dw_shelves` varchar(20) DEFAULT NULL COMMENT '下架时间',
  `goods_time` varchar(50) DEFAULT NULL COMMENT 'KTV时间',
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_goods_info
-- ----------------------------
INSERT INTO `zs_bk_goods_info` VALUES ('76', '朝鲜冷面', '20.00', '0', 'upload/img/good/99579102e41d49a6a03d7bf92b850a8a.jpg', '1', '1032', '2016-10-31 12:29:13', '0', '元', '1', '1', '2016-10-14', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('77', '木须肉', '30.00', '0', 'upload/img/good/aba585d366ba4a93b13cf51d5b18a6b7.png', '1', '1032', '2016-11-03 10:05:14', '0', '元', '0', '1', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('78', '凉拌山蕨', '5.00', '0', 'upload/img/good/51992fa0320e46a1836712117439b630.png', '2', '1032', '2016-10-31 13:43:07', '0', '元', '0', '1', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('79', '酱大骨', '0.00', '100', 'upload/img/good/2a970018a33e4d59a022bfc2bcafaaf6.png', '10', '1032', '2016-10-31 13:46:30', '0', '积分', '0', '1', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('80', '小鸡炖蘑菇', '30.00', '0', 'upload/img/good/3d4015cfbfdd4093b97192f4588a1853.png', '1', '1032', '2016-10-31 13:51:50', '0', '元', '0', '3', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('81', '锅包肉', '15.00', '0', 'upload/img/good/a7c90c205c214640bbc91f2030a52f4f.png', '1', '1032', '2016-10-31 13:52:50', '1', '元', '0', '3', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('82', '酸辣土豆丝', '5.00', '0', 'upload/img/good/78ffd85780644c4392cc93250e0442fb.png', '1', '1034', '2016-10-31 14:35:37', '0', '元', '0', '1', '2016-10-31', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('83', '火锅', '2.00', '0', 'upload/img/good/2bbe8df9d3af4987af66c937190f346f.png', '11', '1035', '2016-11-01 10:14:31', '0', '元', '0', '1', '2016-11-01', '', null);
INSERT INTO `zs_bk_goods_info` VALUES ('84', '牛扒', '1000.00', '0', 'upload/img/good/ece103ac8e25426abb05fb7a3d096b53.png', '11', '1032', '2016-11-02 10:32:14', '0', '元', '0', '1', '2016-11-02', '', null);

-- ----------------------------
-- Table structure for `zs_bk_modelview`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_modelview`;
CREATE TABLE `zs_bk_modelview` (
  `mid` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `m_topImg` varchar(500) DEFAULT NULL COMMENT '模板头部图片',
  `m_bgImg` varchar(500) DEFAULT NULL COMMENT '背景图片',
  `m_type` varchar(2) DEFAULT '0' COMMENT '模板类型:0:多商家活动；1:单独商家活动',
  `m_No` varchar(50) DEFAULT NULL COMMENT '模板单号',
  `m_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `m_createDate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `m_title` varchar(50) DEFAULT NULL COMMENT '模板标题',
  `m_order` int(10) DEFAULT '1',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_modelview
-- ----------------------------
INSERT INTO `zs_bk_modelview` VALUES ('7', 'upload/img/banner/056ce774ceda40d98ec65abdba3996f2.png', 'upload/img/banner/587cd6752206471abe79e9474e9c3541.png', '2', '20160910111447957964', 'sdd', '2016-09-10 11:14:47', '2', '2');
INSERT INTO `zs_bk_modelview` VALUES ('8', 'upload/img/banner/a35c18e9071c49ec923fbd38c6bdabe0.png', 'upload/img/banner/b63f2a91f2a94ae88d6eb62f6055d661.png', '1', '20160910111447957965', '1、活动时间：2016年09月15日-9月28日;2、活动范围：意大利风情街;3、活动内容：为庆祝中秋佳节，全场满200减30，另有礼品赠送。;4、优惠仅限百客下单且在线支付的订单享受。', '2016-09-10 11:14:47', '1', '1');
INSERT INTO `zs_bk_modelview` VALUES ('9', 'upload/img/banner/388b6b5b388d4d02bdba3a006f5a7716.png', 'upload/img/banner/749c06980f60444ba627b7e3a93b92dd.png', '0', '20160910111447957966', '1、活动时间：2016年09月15日-9月28日;2、活动范围：意大利风情街;3、活动内容：为庆祝中秋佳节，全场满200减30，另有礼品赠送。;4、优惠仅限百客下单且在线支付的订单享受。', '2016-09-10 11:14:47', '3', '3');

-- ----------------------------
-- Table structure for `zs_bk_modelview_detail`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_modelview_detail`;
CREATE TABLE `zs_bk_modelview_detail` (
  `md_id` int(10) NOT NULL AUTO_INCREMENT,
  `md_mNO` varchar(50) DEFAULT NULL COMMENT '模板编号',
  `md_param` int(11) DEFAULT NULL COMMENT '对应的商家或商品',
  `md_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`md_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_modelview_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `zs_bk_order_detail_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_order_detail_info`;
CREATE TABLE `zs_bk_order_detail_info` (
  `odid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `od_oNO` varchar(30) NOT NULL COMMENT '订单No',
  `od_goodsId` int(11) NOT NULL COMMENT '菜品ID',
  `od_goodsName` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `od_goodsNum` int(4) DEFAULT NULL COMMENT '点餐数量',
  `od_goods_Pmoeny` float(10,2) DEFAULT '0.00' COMMENT '菜品单价',
  `od_goods_Smoeny` float(10,2) DEFAULT '0.00' COMMENT '菜品小计',
  `od_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `od_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`odid`)
) ENGINE=InnoDB AUTO_INCREMENT=2812 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_order_detail_info
-- ----------------------------
INSERT INTO `zs_bk_order_detail_info` VALUES ('2749', 'BK20161104160816309413', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-04 16:08:17', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2750', 'BK20161104160816309413', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 16:08:17', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2751', 'BK20161104161144941021', '84', '牛扒', '10', '1000.00', '10000.00', '2016-11-04 16:11:44', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2752', 'BK20161104161144941021', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 16:11:44', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2753', 'BK20161104161237129577', '84', '牛扒', '2', '1000.00', '2000.00', '2016-11-04 16:12:38', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2754', 'BK20161104161237129577', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 16:12:38', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2755', 'BK20161104161450673761', '84', '牛扒', '7', '1000.00', '7000.00', '2016-11-04 16:14:50', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2756', 'BK20161104161450673761', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 16:14:50', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2757', 'BK20161104170453503945', '82', '酸辣土豆丝', '1', '5.00', '5.00', '2016-11-04 17:04:54', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2758', 'BK20161104170706334736', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-04 17:07:06', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2759', 'BK20161104170706334736', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 17:07:06', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2760', 'BK20161104170841928114', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-04 17:08:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2761', 'BK20161104170841928114', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 17:08:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2762', 'BK20161104202507499300', '76', '朝鲜冷面', '1', '20.00', '20.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2763', 'BK20161104202507499300', '77', '木须肉', '1', '30.00', '30.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2764', 'BK20161104202507499300', '78', '凉拌山蕨', '1', '5.00', '5.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2765', 'BK20161104202507499300', '79', '酱大骨', '1', '0.00', '0.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2766', 'BK20161104202507499300', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2767', 'BK20161104202507499300', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 20:25:07', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2768', 'BK20161104213819519944', '78', '凉拌山蕨', '1', '5.00', '5.00', '2016-11-04 21:38:19', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2769', 'BK20161104213819519944', '76', '朝鲜冷面', '1', '20.00', '20.00', '2016-11-04 21:38:19', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2770', 'BK20161104213819519944', '77', '木须肉', '1', '30.00', '30.00', '2016-11-04 21:38:19', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2771', 'BK20161104213819519944', '0', '油碟费', '1', '5.00', '5.00', '2016-11-04 21:38:19', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2772', 'BK20161105092633175042', '77', '木须肉', '1', '30.00', '30.00', '2016-11-05 09:26:33', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2773', 'BK20161105092633175042', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 09:26:33', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2774', 'BK20161105103155154915', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 10:31:55', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2775', 'BK20161105103155154915', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 10:31:55', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2776', 'BK20161105110745702212', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 11:07:45', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2777', 'BK20161105110745702212', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 11:07:45', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2778', 'BK20161105110856823568', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 11:08:56', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2779', 'BK20161105110856823568', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 11:08:56', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2780', 'BK20161105142429309197', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 14:24:29', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2781', 'BK20161105142429309197', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 14:24:29', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2782', 'BK20161105152235794049', '84', '牛扒', '3', '1000.00', '3000.00', '2016-11-05 15:22:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2783', 'BK20161105152235794049', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 15:22:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2784', 'BK20161105154203634837', '84', '牛扒', '3', '1000.00', '3000.00', '2016-11-05 15:42:03', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2785', 'BK20161105154203634837', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 15:42:03', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2786', 'BK20161105154244830974', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 15:42:44', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2787', 'BK20161105154244830974', '79', '酱大骨', '1', '0.00', '0.00', '2016-11-05 15:42:44', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2788', 'BK20161105154244830974', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 15:42:44', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2789', 'BK20161105154420335739', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-05 15:44:20', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2790', 'BK20161105154420335739', '79', '酱大骨', '1', '0.00', '0.00', '2016-11-05 15:44:20', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2791', 'BK20161105154420335739', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 15:44:20', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2792', 'BK20161105154435761080', '84', '牛扒', '3', '1000.00', '3000.00', '2016-11-05 15:44:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2793', 'BK20161105154435761080', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 15:44:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2794', 'BK20161105170609547858', '78', '凉拌山蕨', '1', '5.00', '5.00', '2016-11-05 17:06:09', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2795', 'BK20161105170609547858', '77', '木须肉', '1', '30.00', '30.00', '2016-11-05 17:06:09', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2796', 'BK20161105170609547858', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 17:06:09', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2797', 'BK20161105170641532053', '79', '酱大骨', '1', '0.00', '0.00', '2016-11-05 17:06:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2798', 'BK20161105170641532053', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 17:06:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2799', 'BK20161105171135116857', '79', '酱大骨', '1', '0.00', '0.00', '2016-11-05 17:11:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2800', 'BK20161105171135116857', '77', '木须肉', '1', '30.00', '30.00', '2016-11-05 17:11:35', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2801', 'BK20161105171135116857', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 17:11:36', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2802', 'BK20161105174148765785', '84', '牛扒', '2', '1000.00', '2000.00', '2016-11-05 17:41:48', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2803', 'BK20161105174148765785', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 17:41:48', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2804', 'BK20161105174841748822', '84', '牛扒', '4', '1000.00', '4000.00', '2016-11-05 17:48:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2805', 'BK20161105174841748822', '0', '油碟费', '1', '5.00', '5.00', '2016-11-05 17:48:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2806', 'BK20161107090831623503', '84', '牛扒', '1', '1000.00', '1000.00', '2016-11-07 09:08:31', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2807', 'BK20161107090831623503', '0', '油碟费', '1', '5.00', '5.00', '2016-11-07 09:08:31', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2808', 'BK20161107091340964139', '83', '火锅', '1', '2.00', '2.00', '2016-11-07 09:13:40', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2809', 'BK20161107091340964139', '0', '餐位费', '1', '3.00', '3.00', '2016-11-07 09:13:41', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2810', 'BK20161107091643792930', '83', '火锅', '1', '2.00', '2.00', '2016-11-07 09:16:43', null);
INSERT INTO `zs_bk_order_detail_info` VALUES ('2811', 'BK20161107091643792930', '0', '餐位费', '1', '3.00', '3.00', '2016-11-07 09:16:43', null);

-- ----------------------------
-- Table structure for `zs_bk_order_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_order_info`;
CREATE TABLE `zs_bk_order_info` (
  `oid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_no` varchar(30) DEFAULT NULL COMMENT '订单号：BK开头',
  `order_date` varchar(20) DEFAULT NULL COMMENT '下单时间',
  `order_money` float(10,2) DEFAULT '0.00' COMMENT '订单金额',
  `order_type` varchar(2) DEFAULT '1' COMMENT '订单类型：0:预定点餐；1：点餐；',
  `order_pay_state` varchar(2) DEFAULT '0' COMMENT '订单支付状态：0:未付款；1:付款成功;2:付款失败',
  `order_pay_date` varchar(20) DEFAULT NULL COMMENT '支付时间',
  `order_pay_type` varchar(2) DEFAULT NULL COMMENT '订单支付类型：1：支付宝；2:微信; 3余额 0：现金',
  `order_userId` int(11) NOT NULL COMMENT '用户ID',
  `order_sid` int(11) NOT NULL COMMENT '商铺ID',
  `order_confirm_state` varchar(2) DEFAULT '0' COMMENT '确认订单：0:未确认；1确认',
  `order_state` varchar(2) DEFAULT NULL COMMENT '订单状态：0:未付款；1:已付款;2:已消费;3已删除;4申请退款中,5已退款',
  `order_qcode` varchar(200) DEFAULT NULL COMMENT '订单二维码',
  `order_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `order_shopName` varchar(100) DEFAULT NULL COMMENT '商店名称',
  `order_repast_date` varchar(20) DEFAULT NULL COMMENT '就餐时间',
  `order_getIntegral` int(10) DEFAULT '0' COMMENT '订单获取的积分值',
  `order_Growth` int(10) DEFAULT '0' COMMENT '消费成功获取的成长值',
  PRIMARY KEY (`oid`),
  KEY `orderno` (`order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=1109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_order_info
-- ----------------------------
INSERT INTO `zs_bk_order_info` VALUES ('1082', 'BK20161104160816309413', '2016-11-04 16:08:17', '1005.00', '1', '1', '2016-11-04 16:09:40', '3', '95', '1032', '0', '1', 'upload/code/order/order_a3414edd417f467485970a54cdc94350.png', '2016-11-04 16:08:17', 'test2', '2016-11-04 16:08:16', '503', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1083', 'BK20161104161144941021', '2016-11-04 16:11:44', '10005.00', '1', '1', '2016-11-04 16:12:22', '3', '96', '1032', '1', '2', 'upload/code/order/order_c7e004e9bcbb4898ab8a04085a2dac8b.png', '2016-11-04 16:11:44', 'test2', '2016-11-04 16:11:44', '3000', '20010');
INSERT INTO `zs_bk_order_info` VALUES ('1084', 'BK20161104161237129577', '2016-11-04 16:12:38', '2005.00', '0', '1', '2016-11-04 16:13:22', '3', '97', '1032', '0', '1', 'upload/code/order/order_949cdddf5ea34dc6ba8218941ee5c7fa.png', '2016-11-04 16:12:38', 'test2', '2016-11-04 16:30', '1003', '4010');
INSERT INTO `zs_bk_order_info` VALUES ('1085', 'BK20161104161450673761', '2016-11-04 16:14:50', '7005.00', '0', '1', '2016-11-04 16:14:55', '3', '96', '1032', '1', '2', 'upload/code/order/order_d6b82e0a5eb3466790d3c82a32a25e1e.png', '2016-11-04 16:14:50', 'test2', '2016-11-18 11:30', '3200', '14010');
INSERT INTO `zs_bk_order_info` VALUES ('1086', 'BK20161104170453503945', '2016-11-04 17:04:54', '5.00', '0', '1', '2016-11-04 17:05:33', '3', '98', '1034', '0', '1', 'upload/code/order/order_e593ad9b5e654a0c943ce0a37c8a5aad.png', '2016-11-04 17:04:54', 'test3', '2016-11-04 18:00', '0', '0');
INSERT INTO `zs_bk_order_info` VALUES ('1087', 'BK20161104170706334736', '2016-11-04 17:07:06', '1005.00', '1', '1', '2016-11-04 17:07:14', '3', '98', '1032', '0', '1', 'upload/code/order/order_90a5500d2c17461aba932cf20cf8695c.png', '2016-11-04 17:07:06', 'test2', '2016-11-04 17:07:06', '503', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1088', 'BK20161104170841928114', '2016-11-04 17:08:41', '1005.00', '0', '1', '2016-11-04 17:08:48', '3', '98', '1032', '0', '5', 'upload/code/order/order_a0697ad067c947ceb7d9a4cacb08c6e6.png', '2016-11-04 17:08:41', 'test2', '2016-11-05 11:00', '503', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1089', 'BK20161104202507499300', '2016-11-04 20:25:07', '1060.00', '0', '1', '2016-11-04 20:25:15', '3', '97', '1032', '0', '1', 'upload/code/order/order_80aefaafa5c74753938886baf3397f97.png', '2016-11-04 20:25:07', 'test2', '2016-11-04 20:30', '583', '2120');
INSERT INTO `zs_bk_order_info` VALUES ('1090', 'BK20161104213819519944', '2016-11-04 21:38:19', '60.00', '1', '0', null, null, '103', '1032', '0', '0', 'upload/code/order/order_4a7de2b044af47c09ce15604163b6ee9.png', '2016-11-04 21:38:19', 'test2', '2016-11-04 21:38:19', '0', '0');
INSERT INTO `zs_bk_order_info` VALUES ('1091', 'BK20161105092633175042', '2016-11-05 09:26:33', '35.00', '1', '1', '2016-11-05 09:26:40', '3', '96', '1032', '1', '2', 'upload/code/order/order_de7dcc33fe85440b98055e4228497ae0.png', '2016-11-05 09:26:33', 'test2', '2016-11-05 09:26:33', '21', '70');
INSERT INTO `zs_bk_order_info` VALUES ('1092', 'BK20161105103155154915', '2016-11-05 10:31:55', '1005.00', '1', '1', '2016-11-05 10:32:02', '3', '95', '1032', '0', '1', 'upload/code/order/order_c34f8483cdc443dab7edebb5b8dec4cd.png', '2016-11-04 10:31:55', 'test2', '2016-11-05 10:31:55', '503', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1093', 'BK20161105110745702212', '2016-11-05 11:07:45', '1005.00', '0', '1', '2016-11-05 11:08:00', '3', '98', '1032', '0', '1', 'upload/code/order/order_1e66d72e14734a4088ff6d12c76823db.png', '2016-11-05 11:07:45', 'test2', '2016-11-05 14:00', '503', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1094', 'BK20161105110856823568', '2016-11-05 11:08:56', '1005.00', '1', '1', '2016-11-05 11:09:02', '3', '98', '1032', '0', '1', 'upload/code/order/order_e55d36b2eceb44f59c1e3e2b93e2cf58.png', '2016-11-05 11:08:56', 'test2', '2016-11-05 11:08:56', '553', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1095', 'BK20161105142429309197', '2016-11-05 14:24:29', '1005.00', '0', '1', '2016-11-05 14:24:48', '3', '98', '1032', '0', '1', 'upload/code/order/order_4e46a1c4d0fd472f93213dd3c39928e2.png', '2016-11-05 14:24:29', 'test2', '2016-11-06 18:30', '553', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1096', 'BK20161105152235794049', '2016-11-05 15:22:35', '3005.00', '0', '1', '2016-11-05 15:22:41', '3', '95', '1032', '0', '4', 'upload/code/order/order_d9daf0a27b994a95b70fea30b8e1aa67.png', '2016-11-05 15:22:35', 'test2', '2016-11-05 17:00', '1653', '6010');
INSERT INTO `zs_bk_order_info` VALUES ('1097', 'BK20161105154203634837', '2016-11-05 15:42:03', '3005.00', '0', '1', '2016-11-05 15:42:08', '3', '95', '1032', '0', '4', 'upload/code/order/order_7a133ac443954e1aaa101f4f67b68951.png', '2016-11-05 15:42:03', 'test2', '2016-11-05 16:00', '1803', '6010');
INSERT INTO `zs_bk_order_info` VALUES ('1098', 'BK20161105154244830974', '2016-11-05 15:42:44', '1005.00', '1', '1', '2016-11-05 15:42:52', '3', '98', '1032', '0', '1', 'upload/code/order/order_c8a447e3c0024433bce91f65db3abab4.png', '2016-11-05 15:42:44', 'test2', '2016-11-05 15:42:44', '603', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1099', 'BK20161105154420335739', '2016-11-05 15:44:20', '1005.00', '1', '1', '2016-11-05 15:44:27', '3', '98', '1032', '0', '1', 'upload/code/order/order_07c9d5d80e724c4295335ae61b4a6673.png', '2016-11-05 15:44:20', 'test2', '2016-11-05 15:44:20', '603', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1100', 'BK20161105154435761080', '2016-11-05 15:44:35', '3005.00', '0', '1', '2016-11-05 15:45:07', '3', '95', '1032', '0', '1', 'upload/code/order/order_7b4a936305f54707a74484f0e8500b97.png', '2016-11-05 15:44:35', 'test2', '2016-11-05 16:00', '1803', '6010');
INSERT INTO `zs_bk_order_info` VALUES ('1101', 'BK20161105170609547858', '2016-11-05 17:06:09', '40.00', '0', '1', '2016-11-05 17:06:16', '3', '96', '1032', '0', '1', 'upload/code/order/order_2d8fe938bfaf48d8bdb06e3bcecd03dc.png', '2016-11-05 17:06:09', 'test2', '2016-11-25 11:30', '24', '80');
INSERT INTO `zs_bk_order_info` VALUES ('1102', 'BK20161105170641532053', '2016-11-05 17:06:41', '5.00', '0', '1', '2016-11-05 17:06:46', '3', '96', '1032', '0', '5', 'upload/code/order/order_2e486a5f790e45ab9753dbcf776664c4.png', '2016-11-05 17:06:41', 'test2', '2016-11-18 11:30', '0', '0');
INSERT INTO `zs_bk_order_info` VALUES ('1103', 'BK20161105171135116857', '2016-11-05 17:11:36', '35.00', '0', '1', '2016-11-05 17:11:42', '3', '96', '1032', '0', '5', 'upload/code/order/order_a5d8c7df58bd4937b9f577600e74f8cb.png', '2016-11-05 17:11:36', 'test2', '2016-11-18 11:30', '21', '70');
INSERT INTO `zs_bk_order_info` VALUES ('1104', 'BK20161105174148765785', '2016-11-05 17:41:48', '2005.00', '0', '1', '2016-11-05 17:41:55', '3', '95', '1032', '0', '5', 'upload/code/order/order_06e93e7d0dd8470795258f568b137ee9.png', '2016-11-05 17:41:48', 'test2', '2016-11-05 18:00', '0', '0');
INSERT INTO `zs_bk_order_info` VALUES ('1105', 'BK20161105174841748822', '2016-11-05 17:48:41', '4005.00', '0', '1', '2016-11-05 17:48:47', '3', '95', '1032', '0', '5', 'upload/code/order/order_2b5cb95202d540d9aee66508a2a4ca13.png', '2016-11-05 17:48:41', 'test2', '2016-11-05 18:00', '2403', '8010');
INSERT INTO `zs_bk_order_info` VALUES ('1106', 'BK20161107090831623503', '2016-11-07 09:08:31', '1005.00', '0', '1', '2016-11-07 09:08:37', '3', '95', '1032', '0', '5', 'upload/code/order/order_0135d3066d67495691b7af62a14742b0.png', '2016-11-07 09:08:31', 'test2', '2016-11-07 09:30', '603', '2010');
INSERT INTO `zs_bk_order_info` VALUES ('1107', 'BK20161107091340964139', '2016-11-07 09:13:41', '5.00', '1', '1', '2016-11-07 09:13:52', '1', '96', '1035', '1', '2', 'upload/code/order/order_2aee8064590f4bf2b6883c7b888f5ccd.png', '2016-11-07 09:13:41', '测试4', '2016-11-07 09:13:40', '0', '0');
INSERT INTO `zs_bk_order_info` VALUES ('1108', 'BK20161107091643792930', '2016-11-07 09:16:43', '5.00', '1', '0', null, '2', '96', '1035', '0', '0', 'upload/code/order/order_c13e835fe78d433685978dc5637adcec.png', '2016-11-07 09:16:43', '测试4', '2016-11-07 09:16:43', '0', '0');

-- ----------------------------
-- Table structure for `zs_bk_prizegift_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_prizegift_info`;
CREATE TABLE `zs_bk_prizegift_info` (
  `pgid` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `prizeg_gift_name` varchar(20) DEFAULT NULL COMMENT '奖项名称',
  `prizeg_gift_probability` float(3,2) DEFAULT '0.00' COMMENT '奖项率',
  `prizeg_gift_num` int(2) DEFAULT '0' COMMENT '次数',
  `prizeg_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `prizeg_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `level` tinyint(2) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`pgid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_prizegift_info
-- ----------------------------
INSERT INTO `zs_bk_prizegift_info` VALUES ('1', '一等奖', '1.00', '1', '2016-09-09 17:41:20', '无', '1');
INSERT INTO `zs_bk_prizegift_info` VALUES ('2', '二等奖', '1.00', '1', '2016-09-09 17:41:36', '无', '2');
INSERT INTO `zs_bk_prizegift_info` VALUES ('3', '三等奖', '0.50', '20', '2016-09-09 17:41:41', '无', '3');
INSERT INTO `zs_bk_prizegift_info` VALUES ('4', '四等奖', '0.30', '25', '2016-09-09 17:42:08', '无', '4');
INSERT INTO `zs_bk_prizegift_info` VALUES ('5', '五等奖', '0.20', '24', '2016-09-09 17:42:28', '无', '5');
INSERT INTO `zs_bk_prizegift_info` VALUES ('6', '六等奖', '0.10', '0', '2016-09-09 17:42:52', '无', '6');

-- ----------------------------
-- Table structure for `zs_bk_prizepool_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_prizepool_info`;
CREATE TABLE `zs_bk_prizepool_info` (
  `bpid` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `bp_money` float(11,2) DEFAULT '0.00' COMMENT '奖金池金额',
  `bp_min_money` float(11,2) DEFAULT '0.00' COMMENT '最少金额',
  `bp_distributable` float(11,2) DEFAULT '0.00' COMMENT '可分配金额',
  `bp_distributable_min` float(11,2) DEFAULT '0.00' COMMENT '最小支配金额',
  `bp_allocated` float(11,2) DEFAULT '0.00' COMMENT '已分配金额',
  `bp_distributable_men` decimal(8,2) DEFAULT '0.00' COMMENT '每次分配及时到账率',
  `bp_increasing_rate` decimal(8,2) DEFAULT '0.00' COMMENT '增长率',
  `bp_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `bp_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `bp_profit` decimal(8,2) DEFAULT '0.00' COMMENT '纯利润',
  PRIMARY KEY (`bpid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_prizepool_info
-- ----------------------------
INSERT INTO `zs_bk_prizepool_info` VALUES ('1', '6710.20', '1000.00', '5210.20', '1500.00', '4742.60', '0.20', '0.03', '2016-09-10 10:37:24', '无', '7635.20');

-- ----------------------------
-- Table structure for `zs_bk_question_answer`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_question_answer`;
CREATE TABLE `zs_bk_question_answer` (
  `qaid` int(4) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qa_qid` int(11) NOT NULL COMMENT '问题ID',
  `qa_no` varchar(2) DEFAULT NULL COMMENT '题号',
  `qa_content` varchar(500) DEFAULT NULL COMMENT '答案内容',
  `qa_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `qa_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`qaid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_question_answer
-- ----------------------------
INSERT INTO `zs_bk_question_answer` VALUES ('33', '12', '1', '宫门献鱼', '', '2016-10-24 10:15:59');
INSERT INTO `zs_bk_question_answer` VALUES ('34', '12', '2', '将军过桥', '', '2016-10-24 10:16:10');
INSERT INTO `zs_bk_question_answer` VALUES ('35', '12', '3', '苏三鱼', '', '2016-10-24 10:16:20');
INSERT INTO `zs_bk_question_answer` VALUES ('36', '12', '4', '杀生鱼', '', '2016-10-24 10:16:30');
INSERT INTO `zs_bk_question_answer` VALUES ('37', '13', '1', '东坡墨鱼', '', '2016-10-24 10:16:58');
INSERT INTO `zs_bk_question_answer` VALUES ('38', '13', '2', '东坡肉', '', '2016-10-24 10:17:08');
INSERT INTO `zs_bk_question_answer` VALUES ('39', '13', '3', '东坡绵蹄 ', '', '2016-10-24 10:17:18');
INSERT INTO `zs_bk_question_answer` VALUES ('40', '13', '4', '东坡饼', '', '2016-10-24 10:17:28');
INSERT INTO `zs_bk_question_answer` VALUES ('41', '14', '1', '虾爆鳝面', '', '2016-10-24 10:18:00');
INSERT INTO `zs_bk_question_answer` VALUES ('42', '14', '2', '油炸秦桧', '', '2016-10-24 10:18:11');
INSERT INTO `zs_bk_question_answer` VALUES ('43', '14', '3', '宋嫂鱼羹', '', '2016-10-24 10:18:20');
INSERT INTO `zs_bk_question_answer` VALUES ('44', '14', '4', '蟹肉小笼', '', '2016-10-24 10:18:30');
INSERT INTO `zs_bk_question_answer` VALUES ('45', '15', '1', '由挑夫创制', '', '2016-10-24 10:19:09');
INSERT INTO `zs_bk_question_answer` VALUES ('46', '15', '2', '用棒棒串食', '', '2016-10-24 10:19:19');
INSERT INTO `zs_bk_question_answer` VALUES ('47', '15', '3', '用棒棒捶打', '', '2016-10-24 10:19:32');
INSERT INTO `zs_bk_question_answer` VALUES ('48', '15', '4', '口味特别棒', '', '2016-10-24 10:19:43');

-- ----------------------------
-- Table structure for `zs_bk_question_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_question_info`;
CREATE TABLE `zs_bk_question_info` (
  `qid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `q_qname` varchar(500) DEFAULT NULL COMMENT '问题名称',
  `q_qNO` int(4) DEFAULT NULL COMMENT '题号',
  `q_type` varchar(2) DEFAULT NULL COMMENT '问题类型',
  `q_answer` varchar(20) DEFAULT NULL COMMENT '标准答案',
  `q_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `q_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`qid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_question_info
-- ----------------------------
INSERT INTO `zs_bk_question_info` VALUES ('12', '以下四道菜不属于“一鱼两吃”的是', '1', '0', '', '2016-10-24 10:15:43', '');
INSERT INTO `zs_bk_question_info` VALUES ('13', '以下因苏轼得名的美食，属于川菜的是', '2', '0', '', '2016-10-24 10:16:46', '');
INSERT INTO `zs_bk_question_info` VALUES ('14', '“一碗值几钱？旧京遗制动天颜。时人倍价来争市，半买君恩半买鲜。”这是一杭州美食的掌故，诗中的君是指宋高宗赵构。时人争食之，以抒家国之叹。这种美食是', '3', '0', '', '2016-10-24 10:17:48', '');
INSERT INTO `zs_bk_question_info` VALUES ('15', '重庆有一名菜“棒棒鸡”，其得名是因为', '4', '0', '', '2016-10-24 10:18:55', '');

-- ----------------------------
-- Table structure for `zs_bk_shopping_car`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_shopping_car`;
CREATE TABLE `zs_bk_shopping_car` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `sc_NO` varchar(50) NOT NULL COMMENT '购物车单号：BKC开头',
  `sc_userId` int(11) NOT NULL,
  `sc_shoppingdate` varchar(20) DEFAULT NULL COMMENT '下单时间',
  `sc_shoppingmoeny` float(10,2) DEFAULT NULL COMMENT '下单金额',
  `sc_sid` int(11) NOT NULL COMMENT '商铺ID',
  `sc_shopName` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `sc_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `sc_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sc_shoppingcar_type` varchar(2) DEFAULT NULL COMMENT '购物车类型：1预约，0实时',
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_shopping_car
-- ----------------------------

-- ----------------------------
-- Table structure for `zs_bk_shopping_car_detail`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_shopping_car_detail`;
CREATE TABLE `zs_bk_shopping_car_detail` (
  `scdid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `scd_scNO` int(11) NOT NULL COMMENT '购物车No',
  `scd_goodsId` int(11) NOT NULL COMMENT '菜品ID',
  `scd_goodsName` varchar(50) DEFAULT NULL COMMENT '菜品名称',
  `scd_goodsNum` int(4) DEFAULT NULL COMMENT '点餐数量',
  `scd_goods_Pmoeny` float(4,2) DEFAULT '0.00' COMMENT '菜品单价',
  `scd_goods_Smoeny` float(10,2) DEFAULT '0.00' COMMENT '菜品小计',
  `scd_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `scd_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`scdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_shopping_car_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `zs_bk_shop_evaluate_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_shop_evaluate_info`;
CREATE TABLE `zs_bk_shop_evaluate_info` (
  `seid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `se_userId` int(11) NOT NULL COMMENT '用户ID',
  `se_sid` int(11) NOT NULL COMMENT '商铺ID',
  `se_fid` int(11) DEFAULT NULL COMMENT '菜品ID',
  `se_grade` varchar(5) DEFAULT '1' COMMENT '评价等级：1-5；',
  `se_evaluate_content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `se_evaluate_date` varchar(20) DEFAULT NULL COMMENT '评价时间',
  `se_service` int(5) DEFAULT NULL COMMENT '服务态度',
  `se_speed` int(5) DEFAULT NULL COMMENT '上菜速度',
  `se_environment` int(5) DEFAULT NULL COMMENT '环境',
  `se_taste` varchar(5) DEFAULT NULL COMMENT '口味',
  `se_orderNo` varchar(50) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`seid`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_shop_evaluate_info
-- ----------------------------
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('35', '72', '1035', null, '4', null, '2016-11-01 11:25:20', '4', '4', '3', '辣', 'BK20161101111407766025');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('36', '72', '1032', null, '4', null, '2016-11-01 15:38:05', '5', '1', '5', '辣', 'BK20161101153300704208');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('37', '72', '1032', null, '4', null, '2016-11-01 15:54:28', '3', '4', '5', '辣', 'BK20161101154948743202');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('38', '72', '1032', null, '5', null, '2016-11-01 17:20:59', '5', '5', '5', '辣', 'BK20161101162401492543');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('39', '72', '1032', null, '5', null, '2016-11-01 17:21:05', '5', '5', '5', '辣', 'BK20161101162059689542');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('40', '72', '1032', null, '1', null, '2016-11-01 17:21:15', '1', '1', '1', '辣', 'BK20161101161828882331');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('41', '72', '1032', null, '1', null, '2016-11-01 17:21:31', '1', '2', '1', '辣', 'BK20161101114405286437');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('42', '72', '1032', null, '5', null, '2016-11-02 10:44:56', '5', '4', '5', '辣', 'BK20161102103253815557');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('43', '76', '1032', null, '1', null, '2016-11-03 13:42:25', '1', '1', '1', '辣', 'BK20161101170417368121');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('44', '90', '1035', null, '5', null, '2016-11-04 10:06:23', '4', '5', '5', '辣', 'BK20161104092240609771');
INSERT INTO `zs_bk_shop_evaluate_info` VALUES ('45', '96', '1032', null, '4', null, '2016-11-05 09:24:26', '4', '4', '4', '辣', 'BK20161104161450673761');

-- ----------------------------
-- Table structure for `zs_bk_shop_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_shop_info`;
CREATE TABLE `zs_bk_shop_info` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_name` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `shop_consume` float(10,2) DEFAULT '0.00' COMMENT '人均消费',
  `shop_province` varchar(50) DEFAULT NULL COMMENT '省',
  `shop_city` varchar(50) DEFAULT NULL COMMENT '市',
  `shop_area` varchar(100) DEFAULT NULL COMMENT '区',
  `shop_street` varchar(100) DEFAULT NULL COMMENT '街道',
  `shop_time` varchar(20) DEFAULT NULL COMMENT '营业时间',
  `shop_adders` varchar(500) DEFAULT NULL COMMENT '商铺地址',
  `shop_tel` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `shop_images` varchar(4000) DEFAULT NULL COMMENT '商铺图片集合',
  `shop_activity` varchar(1000) DEFAULT NULL COMMENT '活动须知',
  `shop_draw` varchar(1) DEFAULT '1' COMMENT '是否抽奖：1：是0：否',
  `shop_longitude` varchar(30) DEFAULT NULL COMMENT '商铺经度',
  `shop_latitude` varchar(30) DEFAULT NULL COMMENT '商铺纬度',
  `shop_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `shop_introduce` text COMMENT '商店介绍',
  `shop_ISNew` varchar(1) DEFAULT '0' COMMENT '是否今日上新：0否；1是',
  `shop_ISrecommend` varchar(1) DEFAULT '0' COMMENT '是否推荐：1：是；0否',
  `shop_ISshelves` varchar(2) DEFAULT '1' COMMENT '店铺是否启用：0：未启用；1启用,2注销',
  `user_id` varchar(32) DEFAULT NULL COMMENT '系统用户ID',
  `shop_type` int(10) DEFAULT NULL COMMENT '商铺类型',
  `shop_grade` varchar(1) DEFAULT '5' COMMENT '店铺等级:默认五星',
  `shop_seat_name` varchar(45) DEFAULT NULL COMMENT '其他就餐费用名称',
  `shop_seat_money` int(4) DEFAULT NULL COMMENT '餐位费',
  `shop_money` decimal(8,2) DEFAULT '0.00' COMMENT '店铺余额',
  `machine_code` varchar(32) DEFAULT NULL COMMENT '打印机终端号',
  `mKey` varchar(32) DEFAULT NULL COMMENT '打印机秘钥',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_shop_info
-- ----------------------------
INSERT INTO `zs_bk_shop_info` VALUES ('1031', '麻城吊锅的店铺', '20.00', '湖北省', '武汉市', '洪山区', '石碑岭/街道口', '8:00 - 20:00', '湖北省武汉市关山大道保利时代4楼401', '18271863726', 'upload/img/shop/default.png', '', '1', '114.41127063162541', '30.492257176678425', '2016-10-22 12:07:16', '', null, '0', '0', '1', 'b62b082293a14189ac54698f20d82260', '1', '5', '餐位费', '2', '0.00', '', '');
INSERT INTO `zs_bk_shop_info` VALUES ('1032', 'test2', '43.00', '湖北省', '武汉市', '洪山区', '光谷/鲁巷', '10:00-21:00', '湖北省武汉市洪山区卓刀泉特1号虎泉购物广场美食城5楼（虎泉地铁D出口100米即到)', '02787770115', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg', '', '1', '114.36884993674299', '30.51374728263799', '2016-10-22 14:09:09', '', null, '0', '1', '1', 'd88313a43fa34851bbd0e96ca2e07926', '1', '3', '油碟费', '5', '0.00', '4004514561', 'ix27w288tkc8');
INSERT INTO `zs_bk_shop_info` VALUES ('1033', '屈臣氏', '60.00', '湖北省', '武汉市', '洪山区', '石碑岭/街道口', ' 8:00 - 20:00', ' 湖北省武汉市武珞路628号亚贸广场5楼', '02787770113', 'upload/img/shop/452961c86c0b4ef784e2c01b6b550eb7.jpg', '', '1', '114.342837', '30.528862', '2016-10-22 16:47:59', '', null, '0', '0', '1', '99640a5ed99649608803af9d7ce72328', '2', '5', '餐位费', '4', '0.00', '11', '');
INSERT INTO `zs_bk_shop_info` VALUES ('1034', 'test3', '53.00', '湖北省', '武汉市', '武昌区', '徐东大街', '8:00 - 20:00', ' 湖北省武汉市徐东大街18号销品茂3楼', '02787770115', 'upload/img/shop/c7b0f38bd4954b5ca8727cfffa78e9ac.png', '', '1', '114.343307', '30.588225', '2016-10-26 16:34:04', '', null, '0', '0', '1', 'd312bca735d94de79f1fca2eeab195d1', '1', '5', null, null, '0.00', '', '');
INSERT INTO `zs_bk_shop_info` VALUES ('1035', '测试4', '28.00', '湖北省', '武汉市', '武昌区', '南湖花园', ' 8:00 - 20:00', '湖北省武汉市洪山区南湖大道46号', '02787291777', 'upload/img/shop/0ac20e4e5d4b45a197fc0edb4c6e7f0b.jpg', '', '1', '114.33350736294784', '30.497515732782386', '2016-11-01 10:09:40', '', null, '0', '1', '1', '29d79c31e6ae425cb94bc45e2599f361', '3', '5', '餐位费', '3', '0.00', '4004514561', 'ix27w288tkc8');

-- ----------------------------
-- Table structure for `zs_bk_shop_type_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_shop_type_info`;
CREATE TABLE `zs_bk_shop_type_info` (
  `stid` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `st_name` varchar(50) DEFAULT NULL COMMENT '类型名称',
  `st_img` varchar(500) DEFAULT NULL COMMENT '类型图片',
  `st_createdate` varchar(20) DEFAULT NULL,
  `st_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `type` tinyint(2) DEFAULT NULL COMMENT '类型0好吃,1好玩',
  PRIMARY KEY (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_shop_type_info
-- ----------------------------
INSERT INTO `zs_bk_shop_type_info` VALUES ('1', '中餐', null, '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('2', '西餐', '', '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('3', '火锅', '', '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('4', '烧烤烤肉', '', '2016-09-01 10:43:11', '', '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('5', '自助餐', null, '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('6', '日韩料理', null, '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('7', '下午茶', null, '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('8', '聚餐宴请', null, '2016-08-26 11:24:23', null, '0');
INSERT INTO `zs_bk_shop_type_info` VALUES ('9', 'KTV', null, '2016-08-26 11:24:23', null, '1');

-- ----------------------------
-- Table structure for `zs_bk_speed_card`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_speed_card`;
CREATE TABLE `zs_bk_speed_card` (
  `scid` int(4) NOT NULL AUTO_INCREMENT,
  `sc_speedc_name` varchar(50) DEFAULT '奖励加速卡' COMMENT '加速卡名称',
  `sc_speedc_integral` int(10) DEFAULT NULL COMMENT '积分兑换',
  `sc_speedc_rate` int(3) DEFAULT NULL COMMENT '加速率',
  `sc_speedc_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `sc_speedc_date` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `sc_beggrade` varchar(20) DEFAULT NULL COMMENT '开始等级',
  `sc_endgrade` varchar(20) DEFAULT NULL COMMENT '结束等级',
  `sc_state` int(2) DEFAULT '1' COMMENT '加速卡状态：0：失效；1有效',
  PRIMARY KEY (`scid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_speed_card
-- ----------------------------
INSERT INTO `zs_bk_speed_card` VALUES ('1', '奖励加速卡', '100', '5', null, '2016-08-27 09:05:01', '1', '5', '1');
INSERT INTO `zs_bk_speed_card` VALUES ('2', '奖励加速卡', '600', '30', null, '2016-08-27 09:06:01', '1', '6', '1');
INSERT INTO `zs_bk_speed_card` VALUES ('4', '奖励加速卡', '800', '45', null, '2016-09-05 17:31:10', '3', '6', '1');
INSERT INTO `zs_bk_speed_card` VALUES ('5', '奖励加速卡', '1000', '55', null, '2016-09-06 17:31:10', '5', '6', '1');
INSERT INTO `zs_bk_speed_card` VALUES ('6', '奖励加速卡', '2000', '100', null, '2016-09-06 17:31:10', '6', '6', '1');

-- ----------------------------
-- Table structure for `zs_bk_temp_prize`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_temp_prize`;
CREATE TABLE `zs_bk_temp_prize` (
  `tp_pid` int(11) NOT NULL COMMENT '奖项ID',
  `tp_pname` varchar(50) DEFAULT NULL COMMENT '奖项名称',
  `tp_pr` float(4,2) DEFAULT NULL COMMENT '中奖率',
  `tp_shop_name` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `tp_usertel` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `tp_sid` int(11) DEFAULT NULL COMMENT '店铺ID',
  `tp_user_consumeday` varchar(20) DEFAULT NULL COMMENT '消费时间',
  `tp_reward_money` float(4,2) DEFAULT NULL COMMENT '中奖金额',
  `tp_shop_images` varchar(500) DEFAULT NULL COMMENT '商铺图片',
  `tp_orderId` int(11) DEFAULT NULL COMMENT '订单ID',
  PRIMARY KEY (`tp_pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_temp_prize
-- ----------------------------

-- ----------------------------
-- Table structure for `zs_bk_user_account_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_account_info`;
CREATE TABLE `zs_bk_user_account_info` (
  `ua_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ua_userId` int(11) NOT NULL COMMENT '用户ID',
  `ua_userName` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `ua_userIP` varchar(20) DEFAULT NULL COMMENT '身份证',
  `ua_user_account` varchar(50) DEFAULT NULL COMMENT '支付宝账号',
  `ua_user_verifycode` varchar(8) DEFAULT NULL COMMENT '验证码',
  `ua_user_tel` varchar(20) DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`ua_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_account_info
-- ----------------------------
INSERT INTO `zs_bk_user_account_info` VALUES ('10', '76', null, null, '18727381157', null, null);
INSERT INTO `zs_bk_user_account_info` VALUES ('11', '72', null, null, '13026335994', null, null);
INSERT INTO `zs_bk_user_account_info` VALUES ('12', '97', null, null, '18727381157', null, null);
INSERT INTO `zs_bk_user_account_info` VALUES ('13', '95', null, null, '18271863726', null, null);

-- ----------------------------
-- Table structure for `zs_bk_user_bespeak_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_bespeak_info`;
CREATE TABLE `zs_bk_user_bespeak_info` (
  `ubid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ub_userId` int(11) NOT NULL COMMENT '预约者ID',
  `ub_userName` varchar(20) DEFAULT NULL COMMENT '预约者名称',
  `ub_userTel` varchar(20) DEFAULT NULL COMMENT '预约者电话',
  `ub_bespeakdate` varchar(20) DEFAULT NULL COMMENT '预约时间',
  `ub_dinersNum` int(4) DEFAULT '0' COMMENT '预约人数',
  `ub_ISroom` varchar(1) DEFAULT '0' COMMENT '是否需要包房：1：是；0：否',
  `ub_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `ub_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `ub_sid` int(11) DEFAULT NULL COMMENT '预约商铺',
  `ub_state` int(5) DEFAULT NULL COMMENT '预约状态0成功预约（表示已付款）1预约未成功（未付款）',
  `ub_order_no` varchar(30) DEFAULT NULL COMMENT '订单id',
  `ub_isremind` tinyint(2) DEFAULT '0' COMMENT '是否提醒:0未提醒,1提醒',
  PRIMARY KEY (`ubid`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_bespeak_info
-- ----------------------------
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('297', '76', '我', '18727381157', '2016-11-04 16:30', '1', '0', '2016-11-04 16:10:04', '', '1032', '1', null, '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('298', '97', '我', '18727381157', '2016-11-04 16:30', '1', '0', '2016-11-04 16:12:30', '', '1032', '1', 'BK20161104161237129577', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('299', '96', '13026335994', '13026335994', '2016-11-18 11:30', '1', '1', '2016-11-04 16:14:49', '', '1032', '1', 'BK20161104161450673761', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('300', '98', '赵日天', '18202717201', '2016-11-04 18:00', '1', '1', '2016-11-04 17:04:51', 'xxxxxxxx', '1034', '1', 'BK20161104170453503945', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('301', '98', '赵日天', '18202717201', '2016-11-05 11:00', '1', '1', '2016-11-04 17:08:40', 'xxxx', '1032', '1', 'BK20161104170841928114', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('302', '97', '荆州市', '18727381157', '2016-11-04 20:30', '1', '0', '2016-11-04 20:25:05', '', '1032', '1', 'BK20161104202507499300', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('303', '98', '赵日天', '18202717201', '2016-11-05 14:00', '1', '1', '2016-11-05 11:07:43', '', '1032', '1', 'BK20161105110745702212', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('304', '98', '赵日天', '18202717201', '2016-11-06 18:30', '1', '1', '2016-11-05 14:24:23', 'xxxx', '1032', '1', 'BK20161105142429309197', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('305', '95', '啦啦啦', '18271863726', '2016-11-05 17:00', '4', '1', '2016-11-05 15:22:33', '', '1032', '1', 'BK20161105152235794049', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('306', '95', '辣椒', '18271863726', '2016-11-05 16:00', '4', '1', '2016-11-05 15:42:02', '辣', '1032', '1', 'BK20161105154203634837', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('307', '98', '赵日天', '18202717201', '2016-11-05 19:00', '1', '1', '2016-11-05 15:42:37', '', '1032', '1', null, '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('308', '95', '吴', '18271863726', '2016-11-05 16:00', '4', '1', '2016-11-05 15:44:34', '辣', '1032', '1', 'BK20161105154435761080', '1');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('309', '96', '13026335994', '13026335994', '2016-11-25 11:30', '1', '1', '2016-11-05 17:06:08', '', '1032', '1', 'BK20161105170609547858', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('310', '96', '13026335994', '13026335994', '2016-11-18 11:30', '1', '1', '2016-11-05 17:06:40', '', '1032', '1', 'BK20161105170641532053', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('311', '96', '13026335994', '13026335994', '2016-11-18 11:30', '1', '1', '2016-11-05 17:11:33', '', '1032', '1', 'BK20161105171135116857', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('312', '95', '吴', '18271863726', '2016-11-05 18:00', '3', '1', '2016-11-05 17:41:47', '辣', '1032', '1', 'BK20161105174148765785', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('313', '95', '啦啦啦', '18271863726', '2016-11-05 18:00', '3', '1', '2016-11-05 17:48:40', '', '1032', '1', 'BK20161105174841748822', '0');
INSERT INTO `zs_bk_user_bespeak_info` VALUES ('314', '95', '吴', '18271863726', '2016-11-07 09:30', '2', '1', '2016-11-07 09:08:25', '', '1032', '1', 'BK20161107090831623503', '0');

-- ----------------------------
-- Table structure for `zs_bk_user_follow_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_follow_info`;
CREATE TABLE `zs_bk_user_follow_info` (
  `uf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `uf_userId` int(11) NOT NULL COMMENT '关注-用户ID',
  `uf_sid` int(11) NOT NULL COMMENT '关注-商铺ID',
  `uf_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `uf_shop_name` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `uf_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `uf_shop_images` varchar(5000) DEFAULT NULL COMMENT '商铺图片集合',
  PRIMARY KEY (`uf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_follow_info
-- ----------------------------
INSERT INTO `zs_bk_user_follow_info` VALUES ('211', '98', '1032', '2016-11-04 16:42:51', 'test2', null, 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_follow_info` VALUES ('212', '98', '1033', '2016-11-04 16:42:53', '屈臣氏', null, 'upload/img/shop/452961c86c0b4ef784e2c01b6b550eb7.jpg');
INSERT INTO `zs_bk_user_follow_info` VALUES ('213', '98', '1034', '2016-11-04 16:42:58', 'test3', null, 'upload/img/shop/c7b0f38bd4954b5ca8727cfffa78e9ac.png');

-- ----------------------------
-- Table structure for `zs_bk_user_ig_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_ig_info`;
CREATE TABLE `zs_bk_user_ig_info` (
  `uig_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uig_grade_name` varchar(50) DEFAULT NULL COMMENT '等级名称',
  `uig_grade_begin` int(10) DEFAULT '0' COMMENT '开始分值',
  `uig_grade_type` varchar(2) DEFAULT '0' COMMENT '积分类型：0：B值;1：米币',
  `uig_grade_end` int(10) DEFAULT '0' COMMENT '结束',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `uig_grade_No` int(2) DEFAULT NULL COMMENT '等级标识',
  PRIMARY KEY (`uig_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_ig_info
-- ----------------------------
INSERT INTO `zs_bk_user_ig_info` VALUES ('1', '普通会员', '0', '0', '200', null, '0');
INSERT INTO `zs_bk_user_ig_info` VALUES ('2', '普通会员', '200', '0', '2400', null, '1');
INSERT INTO `zs_bk_user_ig_info` VALUES ('3', '普通会员', '2400', '0', '7200', null, '2');
INSERT INTO `zs_bk_user_ig_info` VALUES ('4', '普通会员', '7200', '0', '18000', null, '3');
INSERT INTO `zs_bk_user_ig_info` VALUES ('5', '普通会员', '18000', '0', '28800', null, '4');
INSERT INTO `zs_bk_user_ig_info` VALUES ('6', '普通会员', '28800', '0', '58000', null, '5');
INSERT INTO `zs_bk_user_ig_info` VALUES ('7', '普通会员', '58000', '0', '1000000', null, '6');

-- ----------------------------
-- Table structure for `zs_bk_user_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_info`;
CREATE TABLE `zs_bk_user_info` (
  `userid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_code` varchar(20) DEFAULT NULL COMMENT '用户账号',
  `user_qq` varchar(50) DEFAULT NULL COMMENT 'QQ号',
  `user_wx` varchar(50) DEFAULT NULL COMMENT '微信账号',
  `user_wb` varchar(50) DEFAULT NULL COMMENT '微博账号',
  `user_pwd` varchar(100) DEFAULT NULL COMMENT '密码',
  `verifycode` varchar(8) DEFAULT NULL COMMENT '验证码',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名称',
  `user_img` varchar(200) DEFAULT 'upload/img/headimage/default.png' COMMENT '用户图片',
  `user_sex` varchar(1) DEFAULT '1' COMMENT '性别：1:男；0女',
  `user_birthday` varchar(10) DEFAULT NULL,
  `user_addres` varchar(100) DEFAULT NULL COMMENT '用户地址',
  `user_t_area` varchar(10) DEFAULT NULL COMMENT '用户活跃商圈',
  `user_pay_pwd` varchar(50) DEFAULT NULL COMMENT '用户支付密码',
  `user_last_logindate` varchar(20) DEFAULT NULL COMMENT '上次登入时间',
  `user_min_freepay` varchar(1) DEFAULT '0' COMMENT '小额免费支付：0:未开启;1:已开启',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `user_qcode` varchar(500) DEFAULT NULL COMMENT '用户二维码',
  `user_money` decimal(8,2) DEFAULT '0.00' COMMENT '用户金额',
  `user_invite_code` varchar(6) DEFAULT NULL COMMENT '邀请码',
  `user_integral` int(10) DEFAULT '0' COMMENT '用户积分',
  `referee_phone` varchar(20) DEFAULT NULL COMMENT '推荐人手机号',
  `user_createdate` varchar(20) DEFAULT NULL COMMENT '注册时间',
  `user_grade_integral` int(10) DEFAULT '0' COMMENT '用户等级积分：用来计算用户等级，此积分只加不减',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_info
-- ----------------------------
INSERT INTO `zs_bk_user_info` VALUES ('95', '18271863726', null, null, null, 'MTExMTEx', '353814', '18271863726', 'upload/img/headimage/19c51c3a-7ce7-4903-ac4e-b87b32baddb3.img', '1', null, null, null, '96e79218965eb72c92a549dd5a330112', '2016-11-05 10:31:38', '0', null, null, '16494.00', 'G1U7C2', '7468', null, '2016-11-04 16:07:40', '26060');
INSERT INTO `zs_bk_user_info` VALUES ('96', '13026335994', null, null, null, 'MTIzNDU2', '323583', '13026335994', 'upload/img/headimage/default.png', '0', null, null, null, 'e10adc3949ba59abbe56e057f20f883e', '2016-11-07 09:04:22', '0', null, 'upload/code/user/user_30e2dde610174853931c741090706fe3.png', '4623.50', 'OLj87F', '445', '', '2016-11-04 16:08:53', '34170');
INSERT INTO `zs_bk_user_info` VALUES ('97', '18727381157', null, null, null, 'MDAwMDAw', '513067', '18727381157', 'upload/img/headimage/default.png', '1', null, null, null, '670b14728ad9902aecba32e22fa4f6bd', '2016-11-07 09:17:27', '0', null, null, '16941.00', 'lgGkob', '1486', null, '2016-11-04 16:11:20', '6130');
INSERT INTO `zs_bk_user_info` VALUES ('98', '18202717201', null, null, null, 'ODg4ODg4', '011686', '赵日天', 'upload/img/headimage/5e864188-ef48-4576-ad22-8446db83a969.jpg', '1', '1991-04-27', '湖北省-武汉市-蔡甸区', null, 'f379eaf3c831b04de153469d1bec345e', '2016-11-07 07:50:38', '0', null, 'upload/code/user/user_781a239d076c4a0e9c9773ab581005d8.png', '13965.00', 'mzufLR', '3118', null, '2016-11-04 16:38:47', '12060');
INSERT INTO `zs_bk_user_info` VALUES ('99', '18212347526', null, null, null, null, '825432', '18212347526', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'KwT3bh', '0', null, '2016-11-04 17:22:50', '0');
INSERT INTO `zs_bk_user_info` VALUES ('100', '1234567890566', null, null, null, null, '714650', '1234567890566', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'twDgTj', '0', null, '2016-11-04 17:24:09', '0');
INSERT INTO `zs_bk_user_info` VALUES ('101', '18627809062', null, null, null, 'NjY2NjY2', '032151', '18627809062', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'GOw7XH', '0', null, '2016-11-04 17:25:48', '0');
INSERT INTO `zs_bk_user_info` VALUES ('102', '1589884565455966', null, null, null, null, '250408', '1589884565455966', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'yGB6bq', '0', null, '2016-11-04 17:27:29', '0');
INSERT INTO `zs_bk_user_info` VALUES ('103', '15037349720', null, null, null, 'MTIzNDU2', '318780', '15037349720', 'upload/img/headimage/8184d281-5713-4a31-8f3d-d7ed05608c7d.img', '1', '2016.11.4', '北京市北京市东城区', null, null, '2016-11-04 21:37:23', '0', null, 'upload/code/user/user_ed0b10f0935f4d03a019d4474075bfae.png', '0.00', 'LqqzAm', '0', null, '2016-11-04 21:37:17', '0');
INSERT INTO `zs_bk_user_info` VALUES ('104', '18271861111', null, null, null, null, '482540', '18271861111', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'zHk1Ld', '0', null, '2016-11-05 09:30:12', '0');
INSERT INTO `zs_bk_user_info` VALUES ('105', '18888888888', null, null, null, null, '161020', '18888888888', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'CqdxCc', '0', null, '2016-11-05 09:34:15', '0');
INSERT INTO `zs_bk_user_info` VALUES ('106', '13512341234', null, null, null, null, '820576', '13512341234', 'upload/img/headimage/default.png', '1', null, null, null, null, null, '0', null, null, '0.00', 'J7PWV7', '0', null, '2016-11-05 10:06:29', '0');
INSERT INTO `zs_bk_user_info` VALUES ('107', '18928892613', null, null, null, 'bWVpMTk5MA==', '367081', '18928892613', 'upload/img/headimage/f26253b9-9455-4a4a-a39e-86dfe70fb63f.img', '0', '1990.2.2', '湖北省武汉市武昌区', null, '68ace1f676cba8de87de9927c2600242', '2016-11-07 09:25:37', '0', null, 'upload/code/user/user_4761a67e05464e609571ccf78d3c7213.png', '0.00', 'hdqbrP', '0', null, '2016-11-07 09:25:31', '0');

-- ----------------------------
-- Table structure for `zs_bk_user_integral_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_integral_info`;
CREATE TABLE `zs_bk_user_integral_info` (
  `ui_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ui_userid` int(11) NOT NULL COMMENT '用户ID',
  `ui_integral_type` varchar(1) DEFAULT '0' COMMENT '积分类型：0：消费送积分；1：兑换加速卡;2：积分消费;3:积分增长;4取消订单积分收回',
  `ui_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `ui_integral_score` int(4) DEFAULT NULL COMMENT '积分分值',
  `ui_sid` int(11) DEFAULT NULL COMMENT '商户id',
  `ui_ISsid` varchar(1) DEFAULT NULL COMMENT '是否店铺消费积分：1:是；0:否',
  PRIMARY KEY (`ui_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_integral_info
-- ----------------------------
INSERT INTO `zs_bk_user_integral_info` VALUES ('1113', '95', '0', '2016-11-04 16:09:40', '503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1114', '96', '0', '2016-11-04 16:12:22', '3000', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1115', '97', '0', '2016-11-04 16:13:23', '1003', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1116', '96', '0', '2016-11-04 16:14:55', '3200', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1117', '96', '1', '2016-11-04 17:04:57', '100', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1118', '96', '1', '2016-11-04 17:04:58', '600', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1119', '96', '1', '2016-11-04 17:04:59', '800', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1120', '96', '1', '2016-11-04 17:05:02', '800', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1121', '98', '0', '2016-11-04 17:07:14', '503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1122', '98', '0', '2016-11-04 17:08:48', '503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1123', '98', '4', '2016-11-04 17:14:35', '-503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1124', '97', '2', '2016-11-04 20:25:07', '100', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1125', '97', '0', '2016-11-04 20:25:15', '583', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1126', '96', '0', '2016-11-05 09:26:41', '21', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1127', '96', '1', '2016-11-05 09:55:56', '100', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1128', '96', '1', '2016-11-05 09:55:57', '600', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1129', '96', '1', '2016-11-05 09:55:58', '600', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1130', '96', '1', '2016-11-05 09:55:58', '600', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1131', '96', '1', '2016-11-05 09:55:59', '800', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1132', '95', '0', '2016-11-05 10:32:02', '503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1133', '98', '0', '2016-11-05 11:08:00', '503', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1134', '98', '0', '2016-11-05 11:09:02', '553', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1135', '98', '0', '2016-11-05 14:24:48', '553', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1136', '96', '1', '2016-11-05 14:39:22', '600', null, null);
INSERT INTO `zs_bk_user_integral_info` VALUES ('1137', '95', '0', '2016-11-05 15:22:41', '1653', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1138', '95', '0', '2016-11-05 15:42:08', '1803', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1139', '98', '2', '2016-11-05 15:42:44', '100', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1140', '98', '0', '2016-11-05 15:42:52', '603', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1141', '98', '2', '2016-11-05 15:44:21', '100', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1142', '98', '0', '2016-11-05 15:44:27', '603', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1143', '95', '0', '2016-11-05 15:45:07', '1803', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1144', '96', '0', '2016-11-05 17:06:16', '24', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1145', '96', '2', '2016-11-05 17:06:41', '100', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1146', '96', '4', '2016-11-05 17:07:41', '0', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1147', '96', '2', '2016-11-05 17:11:36', '100', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1148', '96', '0', '2016-11-05 17:11:42', '21', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1149', '96', '4', '2016-11-05 17:12:56', '-21', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1150', '95', '4', '2016-11-05 17:47:25', '0', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1151', '95', '0', '2016-11-05 17:48:47', '2403', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1152', '95', '4', '2016-11-05 17:49:32', '-2403', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1153', '95', '0', '2016-11-07 09:08:38', '603', '1032', '1');
INSERT INTO `zs_bk_user_integral_info` VALUES ('1154', '95', '4', '2016-11-07 09:09:08', '-603', '1032', '1');

-- ----------------------------
-- Table structure for `zs_bk_user_message`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_message`;
CREATE TABLE `zs_bk_user_message` (
  `umid` int(11) NOT NULL AUTO_INCREMENT,
  `um_userId` int(11) DEFAULT NULL,
  `um_msg_type` int(2) DEFAULT '1' COMMENT '消息类型:1系统消息,2订单通知,3预约提醒',
  `um_orderId` varchar(50) DEFAULT NULL COMMENT '百客订单ID ',
  `um_orderNO` varchar(50) DEFAULT NULL COMMENT '订单编号支付宝',
  `um_msgdate` varchar(20) DEFAULT NULL COMMENT '消息时间',
  `um_msgtitle` varchar(500) DEFAULT NULL COMMENT '标题',
  `um_msgcontent` text COMMENT '消息内容',
  `umremark` varchar(500) DEFAULT NULL COMMENT '备注',
  `u_tuistate` int(2) DEFAULT NULL COMMENT '推送状态0表示已经推送1未推送',
  PRIMARY KEY (`umid`)
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_message
-- ----------------------------
INSERT INTO `zs_bk_user_message` VALUES ('418', '95', '2', '', 'BK20161104160816309413', '2016-11-04 16:09:40', '订单通知', '您的订单BK20161104160816309413已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('419', '96', '2', '', 'BK20161104161144941021', '2016-11-04 16:12:22', '订单通知', '您的订单BK20161104161144941021已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('420', '97', '2', '', 'BK20161104161237129577', '2016-11-04 16:13:23', '订单通知', '您的订单BK20161104161237129577已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('421', '96', '2', '', 'BK20161104161450673761', '2016-11-04 16:14:55', '订单通知', '您的订单BK20161104161450673761已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('422', '97', '3', '', 'BK20161104161237129577', '2016-11-04 16:25:34', '预约提醒', '您的预约订单BK20161104161237129577还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('423', '98', '2', '', 'BK20161104170453503945', '2016-11-04 17:05:33', '订单通知', '您的订单BK20161104170453503945已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('424', '98', '3', '', 'BK20161104170453503945', '2016-11-04 17:05:34', '预约提醒', '您的预约订单BK20161104170453503945还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('425', '98', '2', '', 'BK20161104170706334736', '2016-11-04 17:07:14', '订单通知', '您的订单BK20161104170706334736已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('426', '98', '2', '', 'BK20161104170841928114', '2016-11-04 17:08:48', '订单通知', '您的订单BK20161104170841928114已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('427', '97', '2', '', 'BK20161104202507499300', '2016-11-04 20:25:15', '订单通知', '您的订单BK20161104202507499300已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('428', '97', '3', '', 'BK20161104202507499300', '2016-11-04 20:25:35', '预约提醒', '您的预约订单BK20161104202507499300还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('429', '96', '2', '', 'BK20161105092633175042', '2016-11-05 09:26:41', '订单通知', '您的订单BK20161105092633175042已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('430', '95', '2', '', 'BK20161105103155154915', '2016-11-05 10:32:02', '订单通知', '您的订单BK20161105103155154915已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('431', '98', '2', '', 'BK20161105110745702212', '2016-11-05 11:08:01', '订单通知', '您的订单BK20161105110745702212已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('432', '98', '2', '', 'BK20161105110856823568', '2016-11-05 11:09:03', '订单通知', '您的订单BK20161105110856823568已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('433', '98', '3', '', 'BK20161105110745702212', '2016-11-05 12:10:35', '预约提醒', '您的预约订单BK20161105110745702212还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('434', '98', '2', '', 'BK20161105142429309197', '2016-11-05 14:24:49', '订单通知', '您的订单BK20161105142429309197已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('435', '95', '2', '', 'BK20161105152235794049', '2016-11-05 15:22:41', '订单通知', '您的订单BK20161105152235794049已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('436', '95', '3', '', 'BK20161105152235794049', '2016-11-05 15:30:35', '预约提醒', '您的预约订单BK20161105152235794049还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('437', '95', '2', '', 'BK20161105154203634837', '2016-11-05 15:42:09', '订单通知', '您的订单BK20161105154203634837已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('438', '98', '2', '', 'BK20161105154244830974', '2016-11-05 15:42:52', '订单通知', '您的订单BK20161105154244830974已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('439', '98', '2', '', 'BK20161105154420335739', '2016-11-05 15:44:28', '订单通知', '您的订单BK20161105154420335739已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('440', '95', '2', '', 'BK20161105154435761080', '2016-11-05 15:45:08', '订单通知', '您的订单BK20161105154435761080已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('441', '95', '3', '', 'BK20161105154435761080', '2016-11-05 15:50:36', '预约提醒', '您的预约订单BK20161105154435761080还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('442', '96', '2', '', 'BK20161105170609547858', '2016-11-05 17:06:16', '订单通知', '您的订单BK20161105170609547858已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('443', '96', '2', '', 'BK20161105170641532053', '2016-11-05 17:06:47', '订单通知', '您的订单BK20161105170641532053已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('444', '96', '2', '', 'BK20161105171135116857', '2016-11-05 17:11:42', '订单通知', '您的订单BK20161105171135116857已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('445', '95', '2', '', 'BK20161105174148765785', '2016-11-05 17:41:56', '订单通知', '您的订单BK20161105174148765785已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('446', '95', '2', '', 'BK20161105174841748822', '2016-11-05 17:48:48', '订单通知', '您的订单BK20161105174841748822已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('447', '98', '3', '', 'BK20161105142429309197', '2016-11-06 16:30:40', '预约提醒', '您的预约订单BK20161105142429309197还有2小时就到了，请合理安排时间。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('448', '95', '2', '', 'BK20161107090831623503', '2016-11-07 09:08:38', '订单通知', '您的订单BK20161107090831623503已用余额付款，请注意安全，防止泄露密码。', null, '0');
INSERT INTO `zs_bk_user_message` VALUES ('449', '96', '2', '', 'BK20161107091340964139', '2016-11-07 09:13:52', '订单通知', '您的订单BK20161107091340964139已用支付宝付款，请注意安全，防止泄露密码。', null, '0');

-- ----------------------------
-- Table structure for `zs_bk_user_prize`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_prize`;
CREATE TABLE `zs_bk_user_prize` (
  `upid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `up_userId` int(11) NOT NULL COMMENT '中奖用户',
  `up_pgId` int(4) NOT NULL COMMENT '中奖等级Id',
  `up_prizelevel` int(4) DEFAULT NULL COMMENT '中奖等级',
  `up_userName` varchar(50) DEFAULT NULL COMMENT '中奖用户名称',
  `up_userTel` varchar(20) DEFAULT NULL COMMENT '中奖者电话',
  `up_userdate` varchar(20) DEFAULT NULL COMMENT '中奖时间',
  `up_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `up_oNO` varchar(50) DEFAULT NULL COMMENT '订单单号',
  `up_money` float(10,2) DEFAULT NULL COMMENT '订单金额',
  PRIMARY KEY (`upid`),
  KEY `level` (`up_prizelevel`)
) ENGINE=InnoDB AUTO_INCREMENT=771016 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_prize
-- ----------------------------
INSERT INTO `zs_bk_user_prize` VALUES ('770997', '96', '6', '6', '13026335994', '13026335994', '2016-11-04 16:12:24', null, 'BK20161104161144941021', '10005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('770998', '96', '6', '6', '13026335994', '13026335994', '2016-11-04 16:14:58', null, 'BK20161104161450673761', '7005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('770999', '98', '6', '6', '赵日天', '18202717201', '2016-11-04 17:07:19', null, 'BK20161104170706334736', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771000', '98', '6', '6', '赵日天', '18202717201', '2016-11-04 17:08:52', null, 'BK20161104170841928114', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771001', '97', '6', '6', '18727381157', '18727381157', '2016-11-04 20:26:51', null, 'BK20161104202507499300', '1060.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771002', '96', '6', '6', '13026335994', '13026335994', '2016-11-05 09:26:43', null, 'BK20161105092633175042', '35.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771003', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 10:32:06', null, 'BK20161105103155154915', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771004', '98', '6', '6', '赵日天', '18202717201', '2016-11-05 11:08:10', null, 'BK20161105110745702212', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771005', '98', '6', '6', '赵日天', '18202717201', '2016-11-05 14:25:00', null, 'BK20161105142429309197', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771006', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 15:22:45', null, 'BK20161105152235794049', '3005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771007', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 15:42:54', null, 'BK20161105154203634837', '3005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771008', '98', '6', '6', '赵日天', '18202717201', '2016-11-05 15:43:01', null, 'BK20161105154244830974', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771009', '98', '6', '6', '赵日天', '18202717201', '2016-11-05 15:44:33', null, 'BK20161105154420335739', '1005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771010', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 15:45:10', null, 'BK20161105154435761080', '3005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771011', '96', '6', '6', '13026335994', '13026335994', '2016-11-05 17:06:18', null, 'BK20161105170609547858', '40.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771012', '96', '6', '6', '13026335994', '13026335994', '2016-11-05 17:12:01', null, 'BK20161105171135116857', '35.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771013', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 17:42:03', null, 'BK20161105174148765785', '2005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771014', '95', '6', '6', '18271863726', '18271863726', '2016-11-05 17:48:51', null, 'BK20161105174841748822', '4005.00');
INSERT INTO `zs_bk_user_prize` VALUES ('771015', '95', '6', '6', '18271863726', '18271863726', '2016-11-07 09:08:41', null, 'BK20161107090831623503', '1005.00');

-- ----------------------------
-- Table structure for `zs_bk_user_question`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_question`;
CREATE TABLE `zs_bk_user_question` (
  `uqid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uq_qno` varchar(50) NOT NULL COMMENT '答题单号',
  `uq_userId` int(11) NOT NULL COMMENT '用户ID',
  `uq_answers` varchar(20) NOT NULL COMMENT '所选择的答案集合',
  `uq_createdate` varchar(20) DEFAULT NULL COMMENT '答题时间',
  `uq_random_goodsname` varchar(50) DEFAULT NULL COMMENT '随机食物名称',
  `uq_random_goodsimg` varchar(500) DEFAULT NULL COMMENT '随机食物图片',
  `uq_random_sId` int(11) DEFAULT NULL COMMENT '店铺ID',
  `uq_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`uqid`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_question
-- ----------------------------
INSERT INTO `zs_bk_user_question` VALUES ('130', '20161105154659696907', '95', '1,1,2,1', '2016-11-05 15:46:59', '火锅', 'upload/img/good/2bbe8df9d3af4987af66c937190f346f.png', '1035', null);

-- ----------------------------
-- Table structure for `zs_bk_user_rate`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_rate`;
CREATE TABLE `zs_bk_user_rate` (
  `usid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `us_userid` int(11) DEFAULT NULL COMMENT '用户ID',
  `us_usertel` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `us_sid` varchar(11) DEFAULT NULL COMMENT '商户ID',
  `us_shopname` varchar(50) DEFAULT NULL COMMENT '商户名称 ',
  `us_oid` int(11) DEFAULT NULL COMMENT '订单ID',
  `us_oNO` varchar(50) DEFAULT NULL COMMENT '订单单号',
  `us_rate` float(40,2) DEFAULT NULL COMMENT '增长率',
  `us_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `us_remark` varchar(50) DEFAULT NULL COMMENT '备注',
  `us_state` varchar(2) DEFAULT '0' COMMENT '兑换状态:0不可兑换；1可兑换,2兑换完成',
  `us_date` varchar(20) DEFAULT NULL COMMENT '兑换时间',
  `up_pgId` int(4) DEFAULT NULL COMMENT '中奖等级',
  PRIMARY KEY (`usid`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_rate
-- ----------------------------
INSERT INTO `zs_bk_user_rate` VALUES ('685', '95', '18271863726', '1032', 'test2', '1082', 'BK20161104160816309413', '0.25', '2016-11-04 16:09:40', null, '0', null, null);
INSERT INTO `zs_bk_user_rate` VALUES ('686', '96', '13026335994', '1032', 'test2', '1083', 'BK20161104161144941021', '1.00', '2016-11-04 16:12:22', null, '2', '2016-11-04 17:14:47', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('687', '97', '18727381157', '1032', 'test2', '1084', 'BK20161104161237129577', '0.25', '2016-11-04 16:13:22', null, '0', null, null);
INSERT INTO `zs_bk_user_rate` VALUES ('688', '96', '13026335994', '1032', 'test2', '1085', 'BK20161104161450673761', '1.00', '2016-11-04 16:14:55', null, '2', '2016-11-04 17:13:49', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('689', '98', '18202717201', '1032', 'test2', '1087', 'BK20161104170706334736', '0.95', '2016-11-04 17:07:14', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('690', '98', '18202717201', '1032', 'test2', '1088', 'BK20161104170841928114', '0.95', '2016-11-04 17:08:48', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('691', '97', '18727381157', '1032', 'test2', '1089', 'BK20161104202507499300', '1.00', '2016-11-04 20:25:15', null, '2', '2016-11-04 20:27:26', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('692', '96', '13026335994', '1032', 'test2', '1091', 'BK20161105092633175042', '1.00', '2016-11-05 09:26:41', null, '2', '2016-11-05 09:28:00', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('693', '95', '18271863726', '1032', 'test2', '1092', 'BK20161105103155154915', '0.95', '2016-11-05 10:32:02', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('694', '98', '18202717201', '1032', 'test2', '1093', 'BK20161105110745702212', '0.95', '2016-11-05 11:08:00', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('695', '98', '18202717201', '1032', 'test2', '1094', 'BK20161105110856823568', '0.25', '2016-11-05 11:09:02', null, '0', null, null);
INSERT INTO `zs_bk_user_rate` VALUES ('696', '98', '18202717201', '1032', 'test2', '1095', 'BK20161105142429309197', '0.95', '2016-11-05 14:24:48', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('697', '95', '18271863726', '1032', 'test2', '1096', 'BK20161105152235794049', '0.95', '2016-11-05 15:22:41', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('698', '95', '18271863726', '1032', 'test2', '1097', 'BK20161105154203634837', '0.95', '2016-11-05 15:42:08', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('699', '98', '18202717201', '1032', 'test2', '1098', 'BK20161105154244830974', '0.95', '2016-11-05 15:42:52', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('700', '98', '18202717201', '1032', 'test2', '1099', 'BK20161105154420335739', '0.95', '2016-11-05 15:44:27', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('701', '95', '18271863726', '1032', 'test2', '1100', 'BK20161105154435761080', '1.00', '2016-11-05 15:45:07', null, '2', '2016-11-05 15:45:22', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('702', '96', '13026335994', '1032', 'test2', '1101', 'BK20161105170609547858', '1.00', '2016-11-05 17:06:16', null, '2', '2016-11-05 17:12:19', '6');
INSERT INTO `zs_bk_user_rate` VALUES ('703', '96', '13026335994', '1032', 'test2', '1103', 'BK20161105171135116857', '0.95', '2016-11-05 17:11:42', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('704', '95', '18271863726', '1032', 'test2', '1104', 'BK20161105174148765785', '0.95', '2016-11-05 17:41:55', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('705', '95', '18271863726', '1032', 'test2', '1105', 'BK20161105174841748822', '0.95', '2016-11-05 17:48:47', null, '0', null, '6');
INSERT INTO `zs_bk_user_rate` VALUES ('706', '95', '18271863726', '1032', 'test2', '1106', 'BK20161107090831623503', '0.95', '2016-11-07 09:08:37', null, '0', null, '6');

-- ----------------------------
-- Table structure for `zs_bk_user_recommendr`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_recommendr`;
CREATE TABLE `zs_bk_user_recommendr` (
  `urr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `urr_userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `urr_restaurant_name` varchar(50) DEFAULT NULL COMMENT '餐厅名称',
  `urr_restaurant_tyepId` varchar(50) DEFAULT NULL COMMENT '餐厅类型',
  `urr_restaurant_address` varchar(4000) DEFAULT NULL COMMENT '餐厅地址',
  `urr_restaurant_tel` varchar(20) DEFAULT NULL COMMENT '推荐餐厅电话',
  `urr_state` varchar(1) DEFAULT '0' COMMENT '推荐餐厅状态：0:推荐中；1:成功;2；失败',
  `urr_error_remark` varchar(2000) DEFAULT NULL COMMENT '失败理由',
  `urr_createdate` varchar(20) DEFAULT NULL COMMENT '推荐时间',
  `urr_restaurant_longitude` varchar(30) DEFAULT NULL COMMENT '餐厅经度',
  `urr_restaurant_latitude` varchar(30) DEFAULT NULL COMMENT '餐厅纬度',
  PRIMARY KEY (`urr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_recommendr
-- ----------------------------

-- ----------------------------
-- Table structure for `zs_bk_user_reward_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_reward_info`;
CREATE TABLE `zs_bk_user_reward_info` (
  `urid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ur_userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `ur_orderId` int(11) NOT NULL COMMENT '订单ID',
  `ur_orderNo` varchar(50) DEFAULT NULL COMMENT '订单号',
  `ur_sid` int(11) NOT NULL COMMENT '商铺ID',
  `ur_usertel` varchar(20) DEFAULT NULL COMMENT '用户电话',
  `ur_shop_name` varchar(50) DEFAULT NULL COMMENT '商铺名称',
  `ur_user_consumeday` varchar(20) DEFAULT '' COMMENT '消费时间',
  `ur_reward_money` float(10,2) DEFAULT '0.00' COMMENT '奖励金额',
  `ur_reward_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `ur_shop_images` varchar(500) DEFAULT NULL COMMENT '商铺图片集合',
  PRIMARY KEY (`urid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_reward_info
-- ----------------------------
INSERT INTO `zs_bk_user_reward_info` VALUES ('1', '76', '1059', 'BK20161104135241331522', '1032', '18727381157', 'test2', '2016-11-04 13:52:42', '100.50', '2016-11-04 14:09:54', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('2', '90', '1073', 'BK20161104150128285155', '1032', '13026335994', 'test2', '2016-11-04 15:01:29', '2.00', '2016-11-04 15:01:41', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('3', '90', '1072', 'BK20161104145941509704', '1032', '13026335994', 'test2', '2016-11-04 14:59:42', '401.00', '2016-11-04 15:01:48', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('4', '90', '1081', 'BK20161104160537901437', '1032', '13026335994', 'test2', '2016-11-04 16:05:37', '2.00', '2016-11-04 16:05:47', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('5', '96', '1083', 'BK20161104161144941021', '1032', '13026335994', 'test2', '2016-11-04 16:11:44', '1000.50', '2016-11-04 16:12:24', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('6', '96', '1085', 'BK20161104161450673761', '1032', '13026335994', 'test2', '2016-11-04 16:14:50', '700.50', '2016-11-04 16:14:58', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('7', '98', '1087', 'BK20161104170706334736', '1032', '18202717201', 'test2', '2016-11-04 17:07:06', '100.50', '2016-11-04 17:07:19', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('8', '98', '1088', 'BK20161104170841928114', '1032', '18202717201', 'test2', '2016-11-04 17:08:41', '100.50', '2016-11-04 17:08:52', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('9', '97', '1089', 'BK20161104202507499300', '1032', '18727381157', 'test2', '2016-11-04 20:25:07', '106.00', '2016-11-04 20:26:51', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('10', '96', '1091', 'BK20161105092633175042', '1032', '13026335994', 'test2', '2016-11-05 09:26:33', '3.50', '2016-11-05 09:26:43', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('11', '95', '1092', 'BK20161105103155154915', '1032', '18271863726', 'test2', '2016-11-05 10:31:55', '100.50', '2016-11-05 10:32:06', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('12', '98', '1093', 'BK20161105110745702212', '1032', '18202717201', 'test2', '2016-11-05 11:07:45', '100.50', '2016-11-05 11:08:10', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('13', '98', '1095', 'BK20161105142429309197', '1032', '18202717201', 'test2', '2016-11-05 14:24:29', '100.50', '2016-11-05 14:25:00', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('14', '95', '1096', 'BK20161105152235794049', '1032', '18271863726', 'test2', '2016-11-05 15:22:35', '300.50', '2016-11-05 15:22:45', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('15', '95', '1097', 'BK20161105154203634837', '1032', '18271863726', 'test2', '2016-11-05 15:42:03', '300.50', '2016-11-05 15:42:54', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('16', '98', '1098', 'BK20161105154244830974', '1032', '18202717201', 'test2', '2016-11-05 15:42:44', '100.50', '2016-11-05 15:43:01', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('17', '98', '1099', 'BK20161105154420335739', '1032', '18202717201', 'test2', '2016-11-05 15:44:20', '100.50', '2016-11-05 15:44:33', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('18', '95', '1100', 'BK20161105154435761080', '1032', '18271863726', 'test2', '2016-11-05 15:44:35', '300.50', '2016-11-05 15:45:10', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('19', '96', '1101', 'BK20161105170609547858', '1032', '13026335994', 'test2', '2016-11-05 17:06:09', '4.00', '2016-11-05 17:06:18', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('20', '96', '1103', 'BK20161105171135116857', '1032', '13026335994', 'test2', '2016-11-05 17:11:36', '3.50', '2016-11-05 17:12:01', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('21', '95', '1104', 'BK20161105174148765785', '1032', '18271863726', 'test2', '2016-11-05 17:41:48', '200.50', '2016-11-05 17:42:03', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('22', '95', '1105', 'BK20161105174841748822', '1032', '18271863726', 'test2', '2016-11-05 17:48:41', '400.50', '2016-11-05 17:48:51', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');
INSERT INTO `zs_bk_user_reward_info` VALUES ('23', '95', '1106', 'BK20161107090831623503', '1032', '18271863726', 'test2', '2016-11-07 09:08:31', '100.50', '2016-11-07 09:08:41', 'upload/img/shop/f4174e3ce09a4143bf04a1e830c4eb12.jpg');

-- ----------------------------
-- Table structure for `zs_bk_user_speedc_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_speedc_info`;
CREATE TABLE `zs_bk_user_speedc_info` (
  `uscid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `usc_userId` int(11) NOT NULL COMMENT '用户ID',
  `usc_scid` int(4) NOT NULL COMMENT '加速卡ID',
  `usc_createdate` varchar(20) DEFAULT NULL COMMENT '创建时间',
  `usc_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `usc_state` varchar(2) DEFAULT '0' COMMENT '加速卡状态：0:未使用；1:使用',
  `usc_update` varchar(20) DEFAULT NULL COMMENT '使用时间',
  `usc_enddate` varchar(20) DEFAULT NULL COMMENT '有效结束时间',
  `usc_orderNo` varchar(50) DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`uscid`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_speedc_info
-- ----------------------------
INSERT INTO `zs_bk_user_speedc_info` VALUES ('229', '72', '1', '2016-11-01 10:16:40', null, '1', '2016-11-01 11:34:49', '2016-11-11 10:16:40', 'BK20161101111329127183');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('230', '73', '1', '2016-11-01 10:18:03', null, '0', null, '2016-11-11 10:18:03', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('232', '76', '1', '2016-11-01 11:05:18', null, '1', '2016-11-01 11:58:39', '2016-11-11 11:05:18', 'BK20161101114141873523');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('233', '72', '1', '2016-11-01 13:43:00', null, '1', '2016-11-01 15:08:17', '2016-11-11 13:43:00', 'BK20161101144221642968');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('236', '72', '1', '2016-11-01 15:40:41', null, '1', '2016-11-01 15:41:15', '2016-11-08 15:40:41', 'BK20161101153300704208');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('237', '72', '1', '2016-11-01 15:48:09', null, '1', '2016-11-01 15:48:13', '2016-11-08 15:48:09', 'BK20161101154740449326');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('238', '72', '1', '2016-11-01 15:51:13', null, '1', '2016-11-01 15:51:18', '2016-11-08 15:51:13', 'BK20161101154948743202');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('239', '72', '1', '2016-11-01 16:35:32', null, '1', '2016-11-01 16:36:06', '2016-11-08 16:35:32', 'BK20161101114405286437');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('240', '72', '1', '2016-11-01 16:35:35', null, '1', '2016-11-01 16:35:55', '2016-11-08 16:35:35', 'BK20161101161320542863');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('241', '72', '1', '2016-11-01 16:35:37', null, '1', '2016-11-01 16:35:46', '2016-11-08 16:35:37', 'BK20161101162059689542');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('242', '72', '1', '2016-11-01 16:43:19', null, '1', '2016-11-01 17:18:57', '2016-11-08 16:43:19', 'BK20161101170430748176');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('243', '72', '1', '2016-11-01 16:43:43', null, '1', '2016-11-01 16:44:22', '2016-11-08 16:43:43', 'BK20161101164248546896');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('244', '76', '1', '2016-11-01 17:02:53', null, '1', '2016-11-01 17:03:04', '2016-11-08 17:02:53', 'BK20161101115039487017');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('245', '76', '1', '2016-11-01 17:02:56', null, '0', null, '2016-11-08 17:02:56', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('246', '76', '1', '2016-11-01 17:04:56', null, '1', '2016-11-01 17:05:01', '2016-11-08 17:04:56', 'BK20161101170417368121');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('247', '72', '1', '2016-11-02 09:11:51', null, '1', '2016-11-02 09:11:57', '2016-11-09 09:11:51', 'BK20161101164329290338');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('248', '72', '1', '2016-11-02 09:14:10', null, '1', '2016-11-02 09:14:13', '2016-11-09 09:14:10', 'BK20161102091350688347');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('249', '76', '1', '2016-11-02 09:20:26', null, '1', '2016-11-02 09:30:19', '2016-11-09 09:20:26', 'BK20161102093003772042');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('250', '76', '1', '2016-11-02 09:23:05', null, '1', '2016-11-02 09:30:52', '2016-11-09 09:23:05', 'BK20161102093011318849');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('251', '76', '1', '2016-11-02 09:23:09', null, '1', '2016-11-02 09:23:52', '2016-11-09 09:23:09', 'BK20161102091813841317');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('252', '86', '1', '2016-11-02 09:35:25', null, '0', null, '2016-11-12 09:35:25', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('253', '72', '1', '2016-11-02 09:47:21', null, '1', '2016-11-02 10:25:42', '2016-11-09 09:47:21', 'BK20161102094609529874');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('254', '72', '2', '2016-11-02 09:47:46', null, '1', '2016-11-02 10:36:00', '2016-11-09 09:47:46', 'BK20161102103253815557');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('255', '72', '4', '2016-11-02 09:47:47', null, '1', '2016-11-02 14:03:54', '2016-11-09 09:47:47', 'BK20161102140333781868');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('256', '72', '4', '2016-11-02 09:47:50', null, '1', '2016-11-02 14:12:26', '2016-11-09 09:47:50', 'BK20161102140545605011');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('257', '76', '1', '2016-11-02 11:23:33', null, '1', '2016-11-02 13:42:06', '2016-11-09 11:23:33', 'BK20161102134122625187');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('258', '76', '2', '2016-11-02 11:23:36', null, '1', '2016-11-04 12:58:12', '2016-11-09 11:23:36', 'BK20161103214342139499');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('259', '72', '1', '2016-11-02 14:14:55', null, '1', '2016-11-02 14:15:00', '2016-11-09 14:14:55', 'BK20161102140326706085');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('260', '72', '1', '2016-11-02 14:45:13', null, '1', '2016-11-02 14:45:19', '2016-11-09 14:45:13', 'BK20161102144455544611');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('261', '72', '1', '2016-11-02 14:46:40', null, '1', '2016-11-02 14:46:44', '2016-11-09 14:46:40', 'BK20161102144623981754');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('262', '72', '1', '2016-11-02 14:58:44', null, '1', '2016-11-02 14:58:47', '2016-11-09 14:58:44', 'BK20161102145830788329');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('263', '72', '1', '2016-11-02 14:59:00', null, '1', '2016-11-02 14:59:03', '2016-11-09 14:59:00', 'BK20161102144752657798');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('264', '76', '1', '2016-11-03 14:42:21', null, '1', '2016-11-04 15:35:21', '2016-11-10 14:42:21', 'BK20161104135241331522');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('265', '76', '2', '2016-11-03 15:39:59', null, '1', '2016-11-03 21:44:11', '2016-11-10 15:39:59', 'BK20161103214342139499');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('266', '72', '4', '2016-11-03 16:56:46', null, '1', '2016-11-03 16:56:58', '2016-11-10 16:56:46', 'BK20161103165353553998');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('267', '72', '4', '2016-11-03 16:56:52', null, '1', '2016-11-03 16:56:58', '2016-11-10 16:56:52', 'BK20161103165353553998');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('268', '72', '4', '2016-11-03 16:58:31', null, '1', '2016-11-03 16:59:14', '2016-11-10 16:58:31', 'BK20161103165740636320');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('269', '72', '4', '2016-11-03 16:58:35', null, '1', '2016-11-03 16:59:14', '2016-11-10 16:58:35', 'BK20161103165740636320');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('270', '72', '4', '2016-11-03 16:58:36', null, '1', '2016-11-03 16:58:45', '2016-11-10 16:58:36', 'BK20161103165806830874');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('271', '72', '4', '2016-11-03 16:58:37', null, '1', '2016-11-03 16:58:45', '2016-11-10 16:58:37', 'BK20161103165806830874');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('272', '90', '1', '2016-11-04 09:19:37', null, '0', null, '2016-11-14 09:19:37', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('273', '92', '1', '2016-11-04 11:15:21', null, '0', null, '2016-11-14 11:15:21', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('274', '93', '1', '2016-11-04 14:55:12', null, '0', null, '2016-11-14 14:55:12', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('275', '94', '1', '2016-11-04 15:59:50', null, '0', null, '2016-11-14 15:59:50', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('276', '95', '1', '2016-11-04 16:07:40', null, '1', '2016-11-05 15:45:19', '2016-11-14 16:07:40', 'BK20161105154435761080');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('277', '96', '1', '2016-11-04 16:08:53', null, '1', '2016-11-04 17:04:53', '2016-11-14 16:08:53', 'BK20161104161450673761');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('278', '97', '1', '2016-11-04 16:11:20', null, '1', '2016-11-04 20:27:22', '2016-11-14 16:11:20', 'BK20161104202507499300');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('279', '96', '1', '2016-11-04 17:04:57', null, '1', '2016-11-04 17:05:06', '2016-11-11 17:04:57', 'BK20161104161144941021');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('280', '96', '2', '2016-11-04 17:04:58', null, '1', '2016-11-05 09:27:55', '2016-11-11 17:04:58', 'BK20161105092633175042');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('281', '96', '4', '2016-11-04 17:04:59', null, '0', null, '2016-11-11 17:04:59', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('282', '96', '4', '2016-11-04 17:05:01', null, '1', '2016-11-05 17:12:09', '2016-11-11 17:05:01', 'BK20161105170609547858');
INSERT INTO `zs_bk_user_speedc_info` VALUES ('283', '103', '1', '2016-11-04 21:37:17', null, '0', null, '2016-11-14 21:37:17', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('284', '96', '1', '2016-11-05 09:55:56', null, '0', null, '2016-11-12 09:55:56', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('285', '96', '2', '2016-11-05 09:55:57', null, '0', null, '2016-11-12 09:55:57', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('286', '96', '2', '2016-11-05 09:55:57', null, '0', null, '2016-11-12 09:55:57', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('287', '96', '2', '2016-11-05 09:55:58', null, '0', null, '2016-11-12 09:55:58', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('288', '96', '4', '2016-11-05 09:55:58', null, '0', null, '2016-11-12 09:55:58', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('289', '96', '2', '2016-11-05 14:39:22', null, '0', null, '2016-11-12 14:39:22', null);
INSERT INTO `zs_bk_user_speedc_info` VALUES ('290', '107', '1', '2016-11-07 09:25:31', null, '0', null, '2016-11-17 09:25:31', null);

-- ----------------------------
-- Table structure for `zs_bk_user_withdraw_info`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_user_withdraw_info`;
CREATE TABLE `zs_bk_user_withdraw_info` (
  `uwid` int(11) NOT NULL AUTO_INCREMENT,
  `uw_userId` int(11) DEFAULT NULL COMMENT '用户ID',
  `uw_createdate` varchar(20) NOT NULL COMMENT '创建时间',
  `uw_type` varchar(2) NOT NULL COMMENT '类型：1提现；2；消费奖励；3余额消费;4支付宝消费;0：提现手续费；5：奖励,6退款',
  `uw_remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `uw_money` float(10,2) DEFAULT NULL COMMENT '金额',
  `uw_orderNO` varchar(50) DEFAULT NULL COMMENT '提现单号',
  `uw_state` int(1) DEFAULT NULL COMMENT '状态：0：提现中；1提现失败；2：提现完成',
  PRIMARY KEY (`uwid`)
) ENGINE=InnoDB AUTO_INCREMENT=1034 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_user_withdraw_info
-- ----------------------------
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('990', '76', '2016-11-04 15:53:39', '1', '', '920.00', '20161104155339491022', '0');
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('991', '76', '2016-11-04 15:53:39', '0', '', '80.00', '20161104155339491022', '0');
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('992', '90', '2016-11-04 16:05:43', '3', null, '10.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('993', '95', '2016-11-04 16:09:40', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('994', '96', '2016-11-04 16:12:22', '3', null, '10005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('995', '97', '2016-11-04 16:13:22', '3', null, '2005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('996', '96', '2016-11-04 16:14:55', '3', null, '7005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('997', '97', '2016-11-04 16:15:42', '1', '', '92.00', '20161104161541572100', '2');
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('998', '97', '2016-11-04 16:15:42', '0', '', '8.00', '20161104161541572100', '2');
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('999', '98', '2016-11-04 17:05:33', '3', null, '5.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1000', '98', '2016-11-04 17:07:14', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1001', '98', '2016-11-04 17:08:48', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1002', '96', '2016-11-04 17:13:49', '5', null, '700.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1003', '98', '2016-11-04 17:14:35', '6', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1004', '96', '2016-11-04 17:14:47', '5', null, '1000.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1005', '97', '2016-11-04 20:25:15', '3', null, '1060.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1006', '97', '2016-11-04 20:27:26', '5', null, '106.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1007', '96', '2016-11-05 09:26:41', '3', null, '35.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1008', '96', '2016-11-05 09:28:00', '5', null, '3.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1009', '95', '2016-11-05 10:32:02', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1010', '98', '2016-11-05 11:08:00', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1011', '98', '2016-11-05 11:09:02', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1012', '98', '2016-11-05 14:24:48', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1013', '95', '2016-11-05 15:22:41', '3', null, '3005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1014', '95', '2016-11-05 15:42:08', '3', null, '3005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1015', '98', '2016-11-05 15:42:52', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1016', '98', '2016-11-05 15:44:27', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1017', '95', '2016-11-05 15:45:07', '3', null, '3005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1018', '95', '2016-11-05 15:45:23', '5', null, '300.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1019', '96', '2016-11-05 17:06:16', '3', null, '40.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1020', '96', '2016-11-05 17:06:46', '3', null, '5.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1021', '96', '2016-11-05 17:07:41', '6', null, '5.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1022', '96', '2016-11-05 17:11:42', '3', null, '35.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1023', '96', '2016-11-05 17:12:19', '5', null, '4.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1024', '96', '2016-11-05 17:12:56', '6', null, '35.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1025', '95', '2016-11-05 17:41:55', '3', null, '2005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1026', '95', '2016-11-05 17:47:25', '6', null, '1804.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1027', '95', '2016-11-05 17:48:47', '3', null, '4005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1028', '95', '2016-11-05 17:49:32', '6', null, '3604.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1029', '95', '2016-11-07 09:08:37', '3', null, '1005.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1030', '95', '2016-11-07 09:09:09', '6', null, '904.50', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1031', '96', '2016-11-07 09:13:52', '4', null, '5.00', null, null);
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1032', '95', '2016-11-07 09:22:30', '1', '', '92.00', '20161107092230741161', '0');
INSERT INTO `zs_bk_user_withdraw_info` VALUES ('1033', '95', '2016-11-07 09:22:30', '0', '', '8.00', '20161107092230741161', '0');

-- ----------------------------
-- Table structure for `zs_bk_version_config`
-- ----------------------------
DROP TABLE IF EXISTS `zs_bk_version_config`;
CREATE TABLE `zs_bk_version_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL COMMENT '版本',
  `version_name` varchar(50) DEFAULT NULL COMMENT '版本号',
  `version_url` varchar(50) DEFAULT NULL COMMENT '版本地址',
  `content` text COMMENT '内容',
  `state` tinyint(2) DEFAULT NULL COMMENT '状态:0失效,1有效',
  `createtime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zs_bk_version_config
-- ----------------------------

-- ----------------------------
-- Procedure structure for `bill_statistics`
-- ----------------------------
DROP PROCEDURE IF EXISTS `bill_statistics`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `bill_statistics`()
BEGIN
  declare order_total double; #订单总金额
  DECLARE user_yue DOUBLE;    #用户余额
  declare user_withraw double;#用户提现金额
  declare shop_money double;  #商户金额
  declare sys_money double;   #平台金额
  
  declare cancel_fee double;  #退款手续费
  declare withdraw_fee double;#提现手续费
  declare pool_money double;  #奖金池余额
  declare pool_profit double; #平台利润
  declare un_order_money double; #未完成订单*80%
  ########## 平台 = 支付订单总金额 - (用户余额 + 用户提现 + 商户)  
  #总订单金额
  SELECT sum(a.order_money) as money into order_total FROM zs_bk_order_info a WHERE a.order_pay_state=1;
  #用户余额 
  SELECT sum(a.user_money) as money into user_yue FROM zs_bk_user_info a WHERE 1=1;
  #用户提现  
  SELECT sum(a.uw_money) as money into user_withraw FROM zs_bk_user_withdraw_info a WHERE a.uw_type=1 and uw_state = 2;
  # 商户余额 =  完成订单的总金额 * 80% 
  SELECT sum(a.order_money)*0.8 into shop_money FROM zs_bk_order_info a WHERE a.order_state = 2;
  #平台金额
  set sys_money = order_total - user_yue - user_withraw - shop_money;
  
  ########## 平台金额 = 手续费 + (奖金池余额 + 平台利润 ) + (未完成订单*80%) 
  ########## 手续费 = 提现手续费 + 退款手续费 
  ########## 判断2个平台金额是否相等
  
  #退款手续费
  select sum(b.order_money)-sum(a.cancel_moeny) as money into cancel_fee 
      from zs_bk_cancel_order a 
      left join zs_bk_order_info b on a.order_no=b.order_no
      where a.cancel_state = 0;
  
  #提现手续费
  select sum(a.uw_money) as money into withdraw_fee
  from zs_bk_user_withdraw_info a
  where a.uw_type = 0 and a.uw_state = 2;
  
  #奖金池余额 与 平台利润
  select sum(a.bp_money) as bp_money,sum(a.bp_profit) as bp_profit
      into pool_money,pool_profit
  from zs_bk_prizepool_info a
  where 1 = 1;
  
  #未完成订单的*80%
  select sum(order_money)*0.8 into un_order_money
  from zs_bk_order_info a
  where a.order_pay_state = 1 and (a.order_state = 1 or a.order_state = 4);
  
  select order_total,user_yue,user_withraw,shop_money,sys_money,cancel_fee,withdraw_fee,pool_money,pool_profit,un_order_money;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `OrderPrizeProcedure`
-- ----------------------------
DROP PROCEDURE IF EXISTS `OrderPrizeProcedure`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OrderPrizeProcedure`(IN `my_userid` INT,IN `my_u_money` FLOAT,IN `my_order_No` VARCHAR(50))
BEGIN
	 
  DECLARE result VARCHAR(50) DEFAULT('ok') ;   #定义返回值
  DECLARE orderIsNum  INT DEFAULT 0; 					  #订单是否存在
  					
  DECLARE levelval INT DEFAULT 0;							 # 中奖等级
	DECLARE	orderPIsNum   INT DEFAULT  0;				 #是否抽奖
  DECLARE	orderPSUMNum   INT DEFAULT  0;			 #抽奖总数
  DECLARE	t_orderPIsNum   INT DEFAULT  0;			 #抽奖总数
  DECLARE	plevel   INT DEFAULT  0;			 #中奖ID 
  DECLARE  _t_error  INTEGER DEFAULT 0; 
  DECLARE  reward_money FLOAT DEFAULT 0;      #中奖金额
  DECLARE done INT; 
 
  DECLARE oid INT;
  DECLARE sid INT;
  DECLARE order_createdate VARCHAR(20);
  DECLARE shop_name VARCHAR(50);
  DECLARE user_code VARCHAR(20);
  DECLARE user_name VARCHAR(20);
  DECLARE shop_img VARCHAR(500);
  DECLARE order_money FLOAT;
  DECLARE level_gift_t  FLOAT DEFAULT  0.00;
 
 
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _t_error=1; #事务失败的时候返回值 
  #当游标执行时发生错的时候返回的代码标示
	#declare continue handler FOR SQLSTATE '02000' SET done = 1;    
  
  #用户信息
	SELECT x.user_code,x.user_name INTO  user_code,user_name   FROM zs_bk_user_info X WHERE x.userid=my_userid;
						
	#商户信息
	SELECT x.oid,x.order_createdate,x.order_money,y.shop_name,y.sid,
				 SUBSTRING(y.shop_images,1, IF( LOCATE(',',y.shop_images)-1=-1,
				 CHAR_LENGTH(y.shop_images),LOCATE(',',y.shop_images)-1 ) ) shop_img 
				 INTO oid,order_createdate,order_money,shop_name,sid,shop_img				 
				 FROM   zs_bk_order_info X LEFT JOIN zs_bk_shop_info Y ON (x.order_sid=y.sid) 
				 WHERE x.order_no=my_order_No;
   START TRANSACTION; #开始事务
	 SELECT COUNT(*) INTO orderIsNum FROM zs_bk_order_info X  WHERE x.order_no=my_order_No AND x.order_userId=my_userid AND x.order_money=my_u_money AND x.order_pay_state=1;
	 IF(orderIsNum>0) THEN  #订单存在
      SET result='订单存在';
			SELECT COUNT(*) INTO  orderPIsNum FROM  zs_bk_user_prize X  WHERE x.up_money =my_u_money  AND x.up_oNO=my_order_No AND x.up_userId=my_userid  FOR UPDATE; #中奖数 
			IF (orderPIsNum=0) THEN
				  SET result='可以抽奖';
					IF(my_u_money>0 AND  my_u_money<400)  THEN  #0~400时,可以参与1~6等奖的抽奖
						 SELECT COUNT(*) INTO orderPSUMNum  FROM  zs_bk_user_prize X  WHERE x.up_money<=400  FOR UPDATE;
						 SET orderPSUMNum=orderPSUMNum+1;
						 IF((orderPSUMNum/100)%2=1) THEN 
									  SET result='中2等奖';
										SET plevel=2;
						 ELSEIF ((orderPSUMNum/100)%2=0) THEN 
										SET result='中1等奖';
										SET plevel=1;
						 ELSE
										IF((orderPSUMNum%100)<=30) THEN 												
												SET result='中6等奖';
												SET plevel=6;
										ELSE 
												IF((orderPSUMNum%100)<=54) THEN 
															SET result='中5等奖';
															SET plevel=5;
												ELSE
															IF((orderPSUMNum%100)<=79) THEN											
																		 SET result='中4等奖';
																		 SET plevel=4;
															ELSE
																		 SET plevel=3;
																		 SET result='中3等奖';
															END IF;
												END IF;								 
									  END IF;
             END IF;
						 #SET result='0-400';
					ELSEIF (my_u_money>= 400 AND  my_u_money<1000)  THEN  #0~400时,可以参与1~6等奖的抽奖
						 SELECT COUNT(*) INTO orderPSUMNum  FROM  zs_bk_user_prize X  WHERE x.up_money>=400 AND x.up_money<1000  FOR UPDATE;
						 SET orderPSUMNum=orderPSUMNum+1;
						 IF(orderPSUMNum%200=0) THEN 
									SET plevel=3;
									SET result='中3等奖';
						 ELSE
									IF((orderPSUMNum%20)<14) THEN 
													SET plevel=6;
													SET result='中6等奖';
									ELSE
												 IF((orderPSUMNum%20)<18) THEN 
														SET plevel=5;
														SET result='中5等奖';
												 ELSE
														SET plevel=4;
														SET result='中4等奖';
												 END IF;
									END IF;
						END IF;		 
						 #SET result='400-1000';
				  ELSEIF (my_u_money>= 1000 AND  my_u_money<3000)   THEN #0~400时,可以参与1~6等奖的抽奖
							SELECT COUNT(*) INTO orderPSUMNum  FROM  zs_bk_user_prize X  WHERE x.up_money>=1000 AND x.up_money<3000  FOR UPDATE;
						  SET orderPSUMNum=orderPSUMNum+1;								
						  IF((orderPSUMNum%20)<12) THEN 
												SET plevel=6;
												SET result='中6等奖';
							ELSE
											 IF((orderPSUMNum%20)<19) THEN 
													SET plevel=5;
													SET result='中5等奖';
											 ELSE
													SET plevel=4;
													SET result='中4等奖';
											 END IF;
						 END IF;	
 
          ELSE
								SET plevel=6;
								SET result='六等奖';
					END IF;
				  #中奖金额 
					SELECT x.prizeg_gift_probability, IF(x.prizeg_gift_probability*my_u_money<1,0,x.prizeg_gift_probability*my_u_money) INTO level_gift_t,reward_money  
						FROM  zs_bk_prizegift_info X WHERE x.pgid=plevel;
					/*#更新中奖数据*/
					#1.新增中奖信息记录 zs_bk_user_prize    IGNORE 
					INSERT IGNORE INTO zs_bk_user_prize(up_userId,up_pgId,up_prizelevel,up_userName,up_userTel,up_userdate,up_oNO,up_money)
												VALUES(my_userid,plevel,plevel,user_name,user_code,SYSDATE(),my_order_No,my_u_money);
					COMMIT;						
					#2.根据订单号更新用户中奖进度表
					IF plevel = '6' THEN
					    UPDATE zs_bk_user_rate SET us_rate='0.95',us_state='0', up_pgId=plevel  WHERE us_oNO=my_order_No;
					ELSE 
					    UPDATE zs_bk_user_rate SET us_state='0', up_pgId=plevel  WHERE us_oNO=my_order_No;
					END IF;
					
					COMMIT;
					#3.新增订单中奖信息记录 zs_bk_user_reward_info
					INSERT IGNORE INTO zs_bk_user_reward_info(ur_userId,ur_orderId,ur_orderNo,ur_sid,ur_usertel,ur_shop_name,ur_reward_money,ur_shop_images,ur_reward_createdate,ur_user_consumeday)
											VALUES(my_userid,oid,my_order_No,sid,user_code,shop_name,reward_money,shop_img,SYSDATE(),order_createdate); 	
		  ELSE
					SET result='没机会抽奖';
					SET reward_money=0;
					SET level_gift_t=0;
			END IF;
   ELSE
			SET result='订单不存在或者没有支付';
			SET reward_money=0;
			SET level_gift_t=0;
	 END IF;
   IF _t_error = 1 THEN  
					ROLLBACK ;  
		 ELSE  
					COMMIT;  
	 END IF; 
   #SET my_result=CONCAT(result,';',orderIsNum,';',orderPIsNum,';',orderPSUMNum,';',_t_error)  ;
	 SELECT  reward_money ,level_gift_t;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `OrderPrizeProcedure2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `OrderPrizeProcedure2`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `OrderPrizeProcedure2`(IN `userid` INT,IN `u_money` FLOAT,IN `u_orderNO` VARCHAR(50))
BEGIN
	/*系统共设6个等级的奖金：
		1:100%立即到账;2:100%奖励;3:50%奖励;4:30%奖励;5:20%奖励;6:10%立即到账
		系统最高级规则：
		1、用户客单价在0~400时：可以参与1~6等奖的抽奖
		2、400~1000时：可以参与3~6等奖的抽奖
		3、1000~3000时：可以参与4~6等奖的抽奖
		4、大于3000时：可以参与6等奖的抽奖
		抽奖的发放循环规则：
		0-400
		系统根据订单来对用户的奖金进行运算，每次循环周期：
		-6（30）-5（24）-4（25）-3（20）-2（1）
		-6（30）-5（24）-4（25）-3（20）-1（1）
		400-1000
		6（14） 5（4） 4（2） 10轮后   第200个用户的时候给3等奖   400 一样给
		1000-3000
		6（12） 5（7） 4（1）  */
  DECLARE result VARCHAR(50) DEFAULT('ok') ;   #定义返回值
  DECLARE orderIsNum ,no_p_products INT DEFAULT 0; 					 #订单是否存在
  DECLARE levelval INT DEFAULT 0;							 # 中奖等级
	DECLARE	money  FLOAT DEFAULT  0.00;					 #中奖金额
	DECLARE	orderPIsNum   INT DEFAULT  0;				 #是否抽奖
  DECLARE	orderPSUMNum   INT DEFAULT  0;			 #抽奖总数
  DECLARE	t_orderPIsNum   INT DEFAULT  0;			 #抽奖总数
  DECLARE	plevel   INT DEFAULT  0;			 #中奖ID 
  DECLARE  _t_error  INTEGER DEFAULT 0; 
  DECLARE  reward_money FLOAT;      #中奖金额
  DECLARE done INT; 
 
  DECLARE oid INT;
  DECLARE sid INT;
  DECLARE order_createdate VARCHAR(20);
  DECLARE shop_name VARCHAR(50);
  DECLARE user_code VARCHAR(20);
  DECLARE user_name VARCHAR(20);
  DECLARE shop_img VARCHAR(500);
  DECLARE order_money FLOAT;
  DECLARE level_gift_t  FLOAT DEFAULT  0.00;
 
  #创建游标
 /*	 DECLARE cur_prize CURSOR FOR
			select x.oid,x.order_createdate,x.order_money,y.shop_name,y.sid,
				SUBSTRING(y.shop_images,1, IF( LOCATE(',',y.shop_images)-1=-1,
				CHAR_LENGTH(y.shop_images),LOCATE(',',y.shop_images)-1 ) ) shop_img,
				z.user_code,z.user_name
				from  
				zs_bk_order_info x LEFT JOIN zs_bk_shop_info y on (x.order_sid=y.sid) 
				LEFT JOIN zs_bk_user_info z  on (x.order_userId=z.userid) where x.order_no=u_orderNO;
      
       select x.order_createdate 
				from  
				zs_bk_order_info x  where x.order_no=u_orderNO;*/
  DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _t_error=1; #事务失败的时候返回值 
  #当游标执行时发生错的时候返回的代码标示
	#declare continue handler FOR SQLSTATE '02000' SET done = 1;    
  
  #用户信息
	SELECT x.user_code,x.user_name INTO  user_code,user_name   FROM zs_bk_user_info X WHERE x.userid=userid;
						
	#商户信息
	SELECT x.oid,x.order_createdate,x.order_money,y.shop_name,y.sid,
				 SUBSTRING(y.shop_images,1, IF( LOCATE(',',y.shop_images)-1=-1,
				 CHAR_LENGTH(y.shop_images),LOCATE(',',y.shop_images)-1 ) ) shop_img 
				 INTO oid,order_createdate,order_money,shop_name,sid,shop_img				 
				 FROM   zs_bk_order_info X LEFT JOIN zs_bk_shop_info Y ON (x.order_sid=y.sid) 
				 WHERE x.order_no=u_orderNO;
   START TRANSACTION; #开始事务
	 SET orderIsNum= (SELECT COUNT(*) FROM zs_bk_order_info X WHERE x.order_no=u_orderNO AND x.order_userId=userid AND x.order_money=u_money AND x.order_pay_state=1);
		IF(orderIsNum>0) THEN  #订单存在
			 SET result='订单存在 ';
		ELSE #订单不存在
			SET result='订单不存在或者订单没有支付';
			SET reward_money=0;
		END IF;	
   
    /*
   END LOOP  ;
   #until done end repeat;   #结束循环
   CLOSE cur_prize; #关闭游标  
   
	IF _t_error = 1 THEN  
					ROLLBACK ;  
		 ELSE  
					COMMIT;  
		END IF;  */
COMMIT;
#SELECT
		#result;
  #SET   myresutlStr=CONCAT(levelval,',',reward_money);
  #SELECT a.prizeg_gift_probability INTO level_gift_t FROM zs_bk_prizegift_info a WHERE a.level=plevel;
  #SELECT _t_error;
  SELECT a.prizeg_gift_probability INTO level_gift_t FROM zs_bk_prizegift_info a WHERE a.level=plevel;
  #SELECT level_gift_t,reward_money,result,orderPIsNum,t_orderPIsNum;
	SELECT COUNT(*)  FROM  zs_bk_user_prize X  WHERE x.up_money =u_money  AND x.up_oNO=u_orderNO AND x.up_userId=userid for UPDATE; #中奖数 
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `shop_order`
-- ----------------------------
DROP PROCEDURE IF EXISTS `shop_order`;
DELIMITER ;;
CREATE DEFINER=`collectbao`@`%` PROCEDURE `shop_order`(IN `shop_id` varchar(50))
BEGIN
	#Routine body goes here...

DECLARE order_total VARCHAR(10);#订单总数量
DECLARE order_total_day VARCHAR(10);#每日订单总数量
DECLARE order_money VARCHAR(10);#到目前时间总收入
DECLARE order_money_day VARCHAR(10);#店铺订单当天已经到账总金额
DECLARE order_total_spending VARCHAR(10);#订单今日已消费数量
DECLARE order_total_Notspending VARCHAR(10);#订单今日未消费数量
DECLARE order_total_appointment VARCHAR(10);#预约今日单总数量
DECLARE order_total_Cancel VARCHAR(10);#用户今日取消订单总数
#查询今日总订单数量
SELECT IFNULL(count(oid),0) INTO order_total_day FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND CURDATE() = DATE(a.order_createdate);
#查询订单总数 
SELECT IFNULL(count(oid),0) INTO order_total FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id;
#店铺订单当天已经到账总金额
SELECT IFNULL(sum(order_money*0.8),0) INTO order_money FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND a.order_state=2;
#店铺订单当天已经到账总金额
SELECT IFNULL(sum(order_money*0.8),0) INTO order_money_day FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND CURDATE() = DATE(a.order_createdate)AND a.order_state=2;
#订单今日已消费数量
SELECT IFNULL(count(oid),0) INTO order_total_spending FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND a.order_state=2 AND CURDATE() = DATE(a.order_createdate);
#订单今日未消费数量
SELECT IFNULL(count(oid),0) INTO order_total_Notspending FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND a.order_state=1 AND CURDATE() = DATE(a.order_createdate);
#预约今日单总数量
SELECT IFNULL(count(oid),0) INTO order_total_appointment FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND a.order_state=1 AND a.order_type=0 AND CURDATE() = DATE(a.order_createdate);
#用户今日取消订单总数
SELECT IFNULL(count(oid),0) INTO order_total_Cancel FROM zs_bk_order_info AS a WHERE a.order_sid=shop_id AND a.order_state=5 AND a.order_type=0 AND CURDATE() = DATE(a.order_createdate);


SELECT order_total,order_total_day,order_money,order_money_day,order_total_spending,order_total_appointment,order_total_Notspending,order_total_Cancel;

END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `aaaa`
-- ----------------------------
DROP FUNCTION IF EXISTS `aaaa`;
DELIMITER ;;
CREATE DEFINER=`baike`@`%` FUNCTION `aaaa`(`my_userid` INT,`my_u_money` float,`my_order_No` VARCHAR(50)) RETURNS varchar(500) CHARSET utf8
BEGIN
	#Routine body goes here...
  DECLARE result VARCHAR(50) DEFAULT('ok') ;   #定义返回值
	DECLARE	orderPIsNum   INT DEFAULT  0;				 #是否抽奖
  DECLARE _userid INT;
	DECLARE _money FLOAT;
	DECLARE _orderNo VARCHAR(50); 
  SET _userid=my_userid;
  SET _money=my_u_money;
  SET _orderNo=my_order_No;
  BEGIN
		set orderPIsNum=( SELECT  count(*)  FROM  zs_bk_user_prize X  WHERE x.up_money =my_u_money  AND x.up_oNO=my_order_No  AND x.up_userId=my_userid );
  end;
	#SELECT count(*) into orderPIsNum  FROM  zs_bk_user_prize X  WHERE x.up_money =0.01  AND x.up_oNO='BK20160924174145805508' AND x.up_userId=39 ;
  RETURN  CONCAT(orderPIsNum);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `bbbb`
-- ----------------------------
DROP FUNCTION IF EXISTS `bbbb`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `bbbb`(`m_u` int,`m_m` varchar(20),`m_No` varchar(50)) RETURNS varchar(50) CHARSET utf8
BEGIN
#Routine body goes here...
  DECLARE result VARCHAR(50) DEFAULT('ok') ;   #定义返回值
	DECLARE	orderPIsNum   INT DEFAULT  0;				 #是否抽奖
  DECLARE _userid INT;
	DECLARE _money FLOAT;
	DECLARE _orderNo VARCHAR(50); 
  SET _userid=m_u;
  SET _money=m_m;
  SET _orderNo=m_No;
  BEGIN
		set orderPIsNum=( SELECT  count(*)  FROM   zs_bk_user_prize  x WHERE x.up_userId=m_u  and up_oNO=m_No  and up_money=m_m  );
  end;
	#SELECT count(*) into orderPIsNum  FROM  zs_bk_user_prize X  WHERE x.up_money =0.01  AND x.up_oNO='BK20160924174145805508' AND x.up_userId=39 ;
  RETURN  CONCAT(orderPIsNum,';',m_u,';',m_m,';',m_No);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `cccc`
-- ----------------------------
DROP FUNCTION IF EXISTS `cccc`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `cccc`(`m_u` int,`m_m` float,`m_No` varchar(50)) RETURNS int(10)
BEGIN
	#Routine body goes here...
  #SELECT COUNT(*) FROM zs_bk_order_info X WHERE x.order_no=my_order_No AND x.order_userId=my_userid AND x.order_money=my_u_money AND x.order_pay_state=1
	#RETURN 0;
  #Routine body goes here...
  DECLARE result VARCHAR(50) DEFAULT('ok') ;   #定义返回值
	DECLARE	orderPIsNum   INT DEFAULT  0;				 #是否有订单
  BEGIN
		set orderPIsNum=( SELECT  count(*)  FROM  zs_bk_order_info X  WHERE x.order_money =m_m  AND x.order_no=m_No  AND x.order_userId=m_u AND x.order_pay_state=1 );
  end;
	#SELECT count(*) into orderPIsNum  FROM  zs_bk_user_prize X  WHERE x.up_money =0.01  AND x.up_oNO='BK20160924174145805508' AND x.up_userId=39 ;
  RETURN  CONCAT(orderPIsNum);
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `settlement_day`
-- ----------------------------
DROP EVENT IF EXISTS `settlement_day`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `settlement_day` ON SCHEDULE EVERY 1 DAY STARTS '2016-09-28 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN


END
;;
DELIMITER ;
