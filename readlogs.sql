/*
 Navicat Premium Data Transfer

 Source Server         : readLogs
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : ppgo_api_admin

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 01/06/2019 19:31:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pp_api_detail
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_detail`;
CREATE TABLE `pp_api_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT '主表ID',
  `method` tinyint(1) NOT NULL DEFAULT '1' COMMENT '方法名称：1-GET 2-POST 3-PUT 4-PATCH 5-DELETE',
  `api_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '接口名称',
  `api_url` varchar(100) NOT NULL DEFAULT '0' COMMENT '接口地址',
  `detail` text COMMENT '返回结果，正确或错误',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核时间',
  `audit_id` int(11) NOT NULL DEFAULT '0' COMMENT '审核人',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：0-暂停使用，1-正在开发，2-正在审核，3-正常，4-未通过',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='API附表';

-- ----------------------------
-- Records of pp_api_detail
-- ----------------------------
BEGIN;
INSERT INTO `pp_api_detail` VALUES (1, 1, 1, '获取单个sku库存', '/v0/stock', '#### 简要描述：\n\n- 用户库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 1, 3, 1, 1, 1507617867, 1516284409);
INSERT INTO `pp_api_detail` VALUES (2, 1, 3, '更新库存接口', '/v0/stock/:id', '#### 更新库存简要描述：\n\n- 更新库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 1, 3, 1, 1, 1507619939, 1516284492);
INSERT INTO `pp_api_detail` VALUES (3, 2, 1, '获取订单列表接口', '/v0/order', '#### 获取订单列表接口\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1507699351, 1516286722);
INSERT INTO `pp_api_detail` VALUES (4, 3, 2, '新增商品接口', '/v0/product', '#### 新增商品接口\n\n- 新增商品接口接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515762214, 1516286707);
INSERT INTO `pp_api_detail` VALUES (5, 4, 1, '获取交易总额', '/v0/trade', '#### 获取交易总额\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763734, 1516286689);
INSERT INTO `pp_api_detail` VALUES (6, 5, 5, '删除评价接口', '/v0/evaluate/:id', '#### 删除评价接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763795, 1516286674);
INSERT INTO `pp_api_detail` VALUES (7, 6, 1, '获取物流详情', '/v0/delivery', '#### 获取物流详情\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763945, 1516286639);
INSERT INTO `pp_api_detail` VALUES (8, 6, 3, '更新物流信息', '/v0/delivery', '#### 更新物流信息：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515764025, 1516286625);
INSERT INTO `pp_api_detail` VALUES (9, 3, 1, '获取商品列表', '/product', '#### 简要描述：\n\n                    - 用户登录接口\n\n                    #### 接口版本：\n\n                    |版本号|制定人|制定日期|修订日期|\n                    |:----    |:---|:----- |-----   |\n                    |2.1.0 |秦亮  |2017-03-20 |  xxxx-xx-xx |\n\n                    #### 请求URL:\n\n                    - http://xx.com/api/login\n\n                    #### 请求方式：\n\n                    - GET\n                    - POST\n\n                    #### 请求头：\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |Content-Type |是  |string |请求类型： application/json   |\n                    |Content-MD5 |是  |string | 请求内容签名    |\n\n\n                    #### 请求参数:\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |username |是  |string |用户名   |\n                    |password |是  |string | 密码    |\n\n                    #### 返回示例:\n\n                    **正确时返回:**\n\n                    ```\n                    {\n                        \"errcode\": 0,\n                        \"data\": {\n                            \"uid\": \"1\",\n                            \"account\": \"admin\",\n                            \"nickname\": \"Minho\",\n                            \"group_level\": 0 ,\n                            \"create_time\": \"1436864169\",\n                            \"last_login_time\": \"0\",\n                        }\n                    }\n                    ```\n\n                    **错误时返回:**\n\n\n                    ```\n                    {\n                        \"errcode\": 500,\n                        \"errmsg\": \"invalid appid\"\n                    }\n                    ```\n\n                    #### 返回参数说明:\n\n                    |参数名|类型|说明|\n                    |:-----  |:-----|-----                           |\n                    |group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n                    #### 备注:\n\n                    - 更多返回错误代码请看首页的错误代码描述', 0, 0, 4, 1, 1, 1515937531, 1516286613);
INSERT INTO `pp_api_detail` VALUES (10, 3, 5, '删除商品接口', '/v0/product', '#### 删除商品接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515981318, 1516286600);
INSERT INTO `pp_api_detail` VALUES (11, 4, 4, '修改交易状态', '/v0/delivery', '#### 修改交易状态\n\n- 用户登录接口\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1516003820, 1516377141);
COMMIT;

-- ----------------------------
-- Table structure for pp_api_public
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_public`;
CREATE TABLE `pp_api_public` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_public_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '公共文档名称',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '排序，越小越往前',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`api_public_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='API参数表';

-- ----------------------------
-- Records of pp_api_public
-- ----------------------------
BEGIN;
INSERT INTO `pp_api_public` VALUES (1, '平台接口简介', 1, '#### 平台接口简介\n\n- 这是一个测试接口平台\n\n#### 阅读对象\n - 给开发人员的看的', 1, 1, 1, 1516071841, 1516282117);
INSERT INTO `pp_api_public` VALUES (2, '接入须知', 2, '#### key 和secret获取：\n\n- 直接联系商务人员索取\n\n#### 公共参数\n|参数名|说明|\n|:-------   |:-----   |\n|time |接口调用时的时间戳，即当前时间戳（时间戳：当前距离Epoch（1970年1月1日) 以秒计算的时间，即unix-timestamp，请使用精确到秒的时间戳。|\n|app-key|上文获取的三方商家系统的唯一标示|\n|sign|输入参数的签名结果，签名方法见下节|\n\n#### 返回格式\n```\n{\n	success:true/false,\n	data:\n	error_code:\n	error_msg:\n}\n```', 1, 1, 1, 1516080573, 1516283006);
INSERT INTO `pp_api_public` VALUES (3, '回调说明', 3, '#### 加密算法\n\n- 使用用户配置的URL地址替换url路径，然后采用sign签名计算小节的方法，即可得到正确的签名结果\n\n#### 返回结果\n\n|参数名|类型|取值说明|\n|:----   |:-----  |: -----    |\n|success |Boolean |接口执行结果;为true表示执行成功; 为false表示执行失败  |\n|error_msg |String |错误信息描述|\n|error_code|String|错误码，如有具体涉及错误码请严格按照给到的错误码|\n|data|String|返回结果|', 1, 1, 1, 1516282746, 1516282746);
COMMIT;

-- ----------------------------
-- Table structure for pp_api_source
-- ----------------------------
DROP TABLE IF EXISTS `pp_api_source`;
CREATE TABLE `pp_api_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `source_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '接口名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-正常，0-删除',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='API主表';

-- ----------------------------
-- Records of pp_api_source
-- ----------------------------
BEGIN;
INSERT INTO `pp_api_source` VALUES (1, 2, '库存', 1, 0, 1, 1, 1507616276, 1516283236, 0);
INSERT INTO `pp_api_source` VALUES (2, 2, '订单', 1, 0, 1, 1, 1507616329, 1516283124, 0);
INSERT INTO `pp_api_source` VALUES (3, 2, '商品', 1, 0, 1, 1, 1507616394, 1516283140, 0);
INSERT INTO `pp_api_source` VALUES (4, 1, '交易', 1, 0, 1, 1, 1507616421, 1516283245, 0);
INSERT INTO `pp_api_source` VALUES (5, 1, '评价', 1, 0, 1, 1, 1510122234, 1516283256, 0);
INSERT INTO `pp_api_source` VALUES (6, 3, '物流', 1, 0, 1, 1, 1515575836, 1516286650, 0);
INSERT INTO `pp_api_source` VALUES (7, 3, '订单', 0, 0, 1, 1, 1515914737, 1516281455, 0);
COMMIT;

-- ----------------------------
-- Table structure for pp_set_code
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_code`;
CREATE TABLE `pp_set_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态码',
  `desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='环境分组表';

-- ----------------------------
-- Records of pp_set_code
-- ----------------------------
BEGIN;
INSERT INTO `pp_set_code` VALUES (1, '200', '返回成功', '请求成功', 1, 0, 0, 1506328003, 1506328037);
INSERT INTO `pp_set_code` VALUES (2, '300', '返回错误', '请求失败', 1, 0, 0, 1506328023, 1506328023);
INSERT INTO `pp_set_code` VALUES (3, '302', '请求成功', '错误', 0, 0, 0, 1506328070, 1506334951);
COMMIT;

-- ----------------------------
-- Table structure for pp_set_env
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_env`;
CREATE TABLE `pp_set_env` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) NOT NULL DEFAULT '' COMMENT '环境名称',
  `env_host` varchar(255) NOT NULL DEFAULT '0' COMMENT '环境host',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='环境分组表';

-- ----------------------------
-- Records of pp_set_env
-- ----------------------------
BEGIN;
INSERT INTO `pp_set_env` VALUES (1, '测试地址', 'http://test.haodaquan.com', '测试地址', 1, 0, 1, 1506316614, 1516283029);
INSERT INTO `pp_set_env` VALUES (2, '测试地址3', 'http://127.0.0.1:8083', '测试地址3', 0, 0, 0, 1506316696, 1506316850);
INSERT INTO `pp_set_env` VALUES (3, '正式环境', 'http://api.haodaquan.com', '这个也是测试内容', 1, 1, 1, 1515140110, 1516281840);
COMMIT;

-- ----------------------------
-- Table structure for pp_set_group
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_group`;
CREATE TABLE `pp_set_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '说明',
  `env_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '环境ID，1,2',
  `code_ids` varchar(200) NOT NULL COMMENT '状态码id 1,2',
  `api_public_ids` varchar(200) NOT NULL COMMENT '公共文档ids 1,2',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：1-正常，0-删除',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_create_id` (`create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of pp_set_group
-- ----------------------------
BEGIN;
INSERT INTO `pp_set_group` VALUES (1, '供应商', '这是供应商', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237536, 1516283091);
INSERT INTO `pp_set_group` VALUES (2, '大商户', '关于大商户的接口', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237621, 1516283080);
INSERT INTO `pp_set_group` VALUES (3, 'Top商户', '有关订单的接口', '1,3', '1,2', '1,2,3', 1, 1, 1, 1516281298, 1516371024);
COMMIT;

-- ----------------------------
-- Table structure for pp_set_template
-- ----------------------------
DROP TABLE IF EXISTS `pp_set_template`;
CREATE TABLE `pp_set_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='API参数表';

-- ----------------------------
-- Records of pp_set_template
-- ----------------------------
BEGIN;
INSERT INTO `pp_set_template` VALUES (1, '接口通用模板', '#### 简要描述：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 1, 1, 1, 1516085341, 1516281815);
INSERT INTO `pp_set_template` VALUES (2, '公共文档模板', '#### 这是标题\n\n- 这是内容这是一个AP管理的内容模板\n内容模板啊啊', 1, 1, 1, 1516085369, 1516281799);
COMMIT;

-- ----------------------------
-- Table structure for pp_uc_admin
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_admin`;
CREATE TABLE `pp_uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '真实姓名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of pp_uc_admin
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_admin` VALUES (1, 'admin', '超级管理员', '62a7e1bbe8b8fe25379775a222e33a28', '0', '13888888889', 'haodaquan2008@163.com', 'vd2s', 1559388655, '127.0.0.1', 1, 0, 1, 0, 1559388512);
INSERT INTO `pp_uc_admin` VALUES (2, 'george518', 'georgeHao', 'e5d77ebaffd5e4fe7164b31c6d7f1921', '1,2', '13811558899', '12@11.com', 'ONNy', 1506125048, '127.0.0.1', 1, 0, 0, 0, 1558613932);
INSERT INTO `pp_uc_admin` VALUES (3, 'haodaquan', '郝大全', 'e9fa9187e7497892c237433aee966cc1', '2,1', '13811559988', 'hao@123.com', '6fWE', 1505960085, '127.0.0.1', 0, 1, 0, 1505919245, 1558661108);
INSERT INTO `pp_uc_admin` VALUES (4, 'ceshizhanghao', '测试姓名', 'fa3fb5825c2e64bc764f29245dd1ec7a', '2', '13988009988', '232@124.com', 'i8Nf', 0, '', 1, 1, 0, 1506047337, 1513388111);
INSERT INTO `pp_uc_admin` VALUES (5, 'q', 'aa', '2adc688d87792ba5a35337d982f2163b', '', '12312341234', '1@q.com', 'cy45', 0, '', 1, 1, 1, 1558615000, 1558615000);
INSERT INTO `pp_uc_admin` VALUES (6, '', '', '9288f858d8381d3fe2a93791fc9f3b71', '', '', '', 'uR9L', 0, '', 1, 1, 1, 1558618304, 1558618304);
COMMIT;

-- ----------------------------
-- Table structure for pp_uc_auth
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_auth`;
CREATE TABLE `pp_uc_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级ID，0为顶级',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT '权限名称',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'URL地址',
  `sort` int(1) unsigned NOT NULL DEFAULT '999' COMMENT '排序，越小越前',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示，0-隐藏，1-显示',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '操作者ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改者ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='权限因子';

-- ----------------------------
-- Records of pp_uc_auth
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_auth` VALUES (1, 0, '所有权限', '/', 1, '', 0, 1, 1, 1, 1, 1505620970, 1505620970);
INSERT INTO `pp_uc_auth` VALUES (2, 1, '权限管理', '/', 999, 'fa-id-card', 1, 1, 0, 1, 1, 0, 1505622360);
INSERT INTO `pp_uc_auth` VALUES (3, 2, '管理员', '/admin/list', 1, 'fa-user-o', 1, 1, 1, 1, 1, 1505621186, 1505621186);
INSERT INTO `pp_uc_auth` VALUES (4, 2, '角色管理', '/role/list', 2, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1505621852);
INSERT INTO `pp_uc_auth` VALUES (5, 3, '新增', '/admin/add', 1, '', 0, 1, 0, 1, 1, 0, 1505621685);
INSERT INTO `pp_uc_auth` VALUES (6, 3, '修改', '/admin/edit', 2, '', 0, 1, 0, 1, 1, 0, 1505621697);
INSERT INTO `pp_uc_auth` VALUES (7, 3, '删除', '/admin/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621756, 1505621756);
INSERT INTO `pp_uc_auth` VALUES (8, 4, '新增', '/role/add', 1, '', 1, 1, 0, 1, 1, 0, 1505698716);
INSERT INTO `pp_uc_auth` VALUES (9, 4, '修改', '/role/edit', 2, '', 0, 1, 1, 1, 1, 1505621912, 1505621912);
INSERT INTO `pp_uc_auth` VALUES (10, 4, '删除', '/role/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621951, 1505621951);
INSERT INTO `pp_uc_auth` VALUES (11, 2, '权限因子', '/auth/list', 3, 'fa-list', 1, 1, 1, 1, 1, 1505621986, 1505621986);
INSERT INTO `pp_uc_auth` VALUES (12, 11, '新增', '/auth/add', 1, '', 0, 1, 1, 1, 1, 1505622009, 1505622009);
INSERT INTO `pp_uc_auth` VALUES (13, 11, '修改', '/auth/edit', 2, '', 0, 1, 1, 1, 1, 1505622047, 1505622047);
INSERT INTO `pp_uc_auth` VALUES (14, 11, '删除', '/auth/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505622111, 1505622111);
INSERT INTO `pp_uc_auth` VALUES (15, 1, '个人中心', 'profile/edit', 1001, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1506001114);
INSERT INTO `pp_uc_auth` VALUES (16, 1, 'API管理', '/', 1, 'fa-cubes', 0, 1, 0, 1, 1, 0, 1558613398);
INSERT INTO `pp_uc_auth` VALUES (17, 16, 'API接口', '/api/list', 1, 'fa-link', 1, 1, 1, 1, 1, 1505622447, 1505622447);
INSERT INTO `pp_uc_auth` VALUES (19, 20, '公共文档', '/apipublic/list', 3, 'fa-files-o', 1, 1, 0, 1, 1, 0, 1516155852);
INSERT INTO `pp_uc_auth` VALUES (20, 1, '基础设置', '/', 2, 'fa-cogs', 0, 1, 0, 1, 1, 0, 1558613070);
INSERT INTO `pp_uc_auth` VALUES (21, 20, '分组设置', '/group/list', 1, 'fa-object-ungroup', 1, 1, 1, 1, 1, 1505622645, 1505622645);
INSERT INTO `pp_uc_auth` VALUES (22, 20, '环境设置', '/env/list', 2, 'fa-tree', 1, 1, 1, 1, 1, 1505622681, 1505622681);
INSERT INTO `pp_uc_auth` VALUES (23, 20, '状态码设置', '/code/list', 3, 'fa-code', 1, 1, 1, 1, 1, 1505622728, 1505622728);
INSERT INTO `pp_uc_auth` VALUES (24, 15, '资料修改', '/user/edit', 1, 'fa-edit', 1, 1, 0, 1, 1, 0, 1506057468);
INSERT INTO `pp_uc_auth` VALUES (25, 21, '新增', '/group/add', 1, 'n', 0, 1, 0, 1, 1, 0, 1513324170);
INSERT INTO `pp_uc_auth` VALUES (26, 21, '修改', '/group/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506237920, 1506237920);
INSERT INTO `pp_uc_auth` VALUES (27, 21, '删除', '/group/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506237948, 1506237948);
INSERT INTO `pp_uc_auth` VALUES (28, 22, '新增', '/env/add', 1, 'fa', 0, 0, 0, 0, 1, 1506316506, 1506316506);
INSERT INTO `pp_uc_auth` VALUES (29, 22, '修改', '/env/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506316532, 1506316532);
INSERT INTO `pp_uc_auth` VALUES (30, 22, '删除', '/env/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506316567, 1506316567);
INSERT INTO `pp_uc_auth` VALUES (31, 23, '新增', '/code/add', 1, 'fa', 0, 0, 0, 0, 1, 1506327812, 1506327812);
INSERT INTO `pp_uc_auth` VALUES (32, 23, '修改', '/code/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506327831, 1506327831);
INSERT INTO `pp_uc_auth` VALUES (33, 23, '删除', '/code/ajadel', 3, 'fa', 0, 0, 0, 0, 1, 1506327857, 1506327857);
INSERT INTO `pp_uc_auth` VALUES (34, 17, '新增接口', '/api/add', 1, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984869);
INSERT INTO `pp_uc_auth` VALUES (35, 17, '修改接口', '/api/edit', 2, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984880);
INSERT INTO `pp_uc_auth` VALUES (36, 17, '删除接口', '/api/ajaxdel', 3, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984893);
INSERT INTO `pp_uc_auth` VALUES (37, 17, '查看接口', '/api/detail', 4, '', 0, 1, 0, 1, 1, 0, 1515984908);
INSERT INTO `pp_uc_auth` VALUES (38, 17, '批量审核接口', '/api/ajaxchangestatus', 5, '', 0, 1, 0, 1, 1, 0, 1516000160);
INSERT INTO `pp_uc_auth` VALUES (39, 16, 'API资源', '/apisource/list', 1, 'fa-skyatlas', 1, 1, 0, 1, 1, 0, 1515984925);
INSERT INTO `pp_uc_auth` VALUES (40, 39, '新增', '/apisource/add', 1, '', 0, 1, 0, 1, 1, 0, 1515905034);
INSERT INTO `pp_uc_auth` VALUES (41, 39, '修改', '/apisource/edit', 2, '', 0, 1, 0, 1, 1, 0, 1515905044);
INSERT INTO `pp_uc_auth` VALUES (42, 39, '删除', '/apisource/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1515905055);
INSERT INTO `pp_uc_auth` VALUES (43, 17, '审核页面', '/api/audit', 6, '', 0, 1, 1, 1, 1, 1516000189, 1516000189);
INSERT INTO `pp_uc_auth` VALUES (44, 19, '新增', '/apipublic/add', 1, '', 0, 1, 1, 1, 1, 1516067809, 1516067809);
INSERT INTO `pp_uc_auth` VALUES (45, 19, '修改', '/apipublic/edit', 2, '', 0, 1, 1, 1, 1, 1516067841, 1516067841);
INSERT INTO `pp_uc_auth` VALUES (46, 19, '删除', '/apipublic/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516067881, 1516067881);
INSERT INTO `pp_uc_auth` VALUES (47, 20, '模板设置', '/template/list', 4, 'fa-file-text', 1, 1, 1, 1, 1, 1516083233, 1516083233);
INSERT INTO `pp_uc_auth` VALUES (48, 47, '新增', '/template/add', 1, '', 0, 1, 1, 1, 1, 1516083262, 1516083262);
INSERT INTO `pp_uc_auth` VALUES (49, 47, '修改', '/template/edit', 2, '', 0, 1, 1, 1, 1, 1516083296, 1516083296);
INSERT INTO `pp_uc_auth` VALUES (50, 47, '删除', '/template/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516083335, 1516083335);
INSERT INTO `pp_uc_auth` VALUES (51, 17, '审核页面', '/api/audit', 6, '', 0, 1, 1, 1, 0, 1558612995, 1558612995);
INSERT INTO `pp_uc_auth` VALUES (52, 16, 'API接口', '/api/list1', 1, 'fa-link', 1, 1, 1, 1, 0, 1558613004, 1558613004);
INSERT INTO `pp_uc_auth` VALUES (53, 1, '主机管理', '/', 3, 'fa-id-card', 1, 1, 1, 1, 0, 1558613241, 1558613241);
INSERT INTO `pp_uc_auth` VALUES (54, 1, '主机管理', '/', 3, 'fa-server', 1, 1, 0, 1, 1, 0, 1558614550);
INSERT INTO `pp_uc_auth` VALUES (55, 1, '主机管理', '/', 3, 'fa fa-clipboard', 1, 1, 1, 1, 0, 1558613564, 1558613564);
INSERT INTO `pp_uc_auth` VALUES (56, 54, '主机列表', '/host/list', 3, 'fa-server', 1, 1, 0, 1, 1, 0, 1558614560);
INSERT INTO `pp_uc_auth` VALUES (57, 56, '修改', '/host/edit', 3, 'fa-server', 1, 1, 0, 1, 1, 0, 1558659292);
INSERT INTO `pp_uc_auth` VALUES (58, 56, '新增', '/host/add', 1, 'fa-server', 1, 1, 0, 1, 1, 0, 1558659342);
INSERT INTO `pp_uc_auth` VALUES (59, 56, '删除', '/host/del', 3, 'fa-server', 1, 1, 1, 1, 1, 1558659438, 1558659438);
INSERT INTO `pp_uc_auth` VALUES (60, 1, '服务管理', '/', 3, 'fa-server', 1, 1, 1, 1, 1, 1558773429, 1558773429);
INSERT INTO `pp_uc_auth` VALUES (61, 60, '服务列表', '/project/list', 1, '', 1, 1, 0, 1, 1, 0, 1558773842);
INSERT INTO `pp_uc_auth` VALUES (62, 61, '新增', '/project/add', 1, '', 1, 1, 0, 1, 1, 0, 1558773823);
INSERT INTO `pp_uc_auth` VALUES (63, 61, '修改', '/project/edit', 2, '', 1, 1, 0, 1, 1, 0, 1558773816);
INSERT INTO `pp_uc_auth` VALUES (64, 61, '删除', '/project/del', 3, '', 1, 1, 0, 1, 1, 0, 1558773809);
INSERT INTO `pp_uc_auth` VALUES (65, 61, '详情', '/project/detail', 2, '', 1, 1, 1, 1, 1, 1559386549, 1559386549);
INSERT INTO `pp_uc_auth` VALUES (66, 61, '获取日志', '/project/ajaxdetail', 2, '', 1, 1, 1, 1, 1, 1559386588, 1559386588);
COMMIT;

-- ----------------------------
-- Table structure for pp_uc_host
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_host`;
CREATE TABLE `pp_uc_host` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `host` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `password` varchar(40) NOT NULL,
  `status` tinyint(3) NOT NULL COMMENT '1开启 0关闭',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `update_id` int(11) NOT NULL,
  `create_id` int(11) NOT NULL,
  `conn_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '连接状态 1 正常连接 2连接失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pp_uc_project
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_project`;
CREATE TABLE `pp_uc_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL COMMENT '服务名称',
  `status` tinyint(3) NOT NULL COMMENT '1正常0禁用',
  `update_id` int(11) NOT NULL COMMENT '更新人员id',
  `create_id` int(11) NOT NULL COMMENT '创建人id',
  `create_time` int(255) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `path` varchar(255) NOT NULL COMMENT '日志路径',
  `host` varchar(255) NOT NULL COMMENT '主机id,分割',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for pp_uc_role
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role`;
CREATE TABLE `pp_uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT '角色名称',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改这ID',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-删除',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of pp_uc_role
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_role` VALUES (1, 'API管理员', '拥有API所有权限', 0, 2, 1, 1505874156, 1505874156);
INSERT INTO `pp_uc_role` VALUES (2, '系统管理员', '系统管理员', 0, 0, 1, 1506124114, 1506124114);
COMMIT;

-- ----------------------------
-- Table structure for pp_uc_role_auth
-- ----------------------------
DROP TABLE IF EXISTS `pp_uc_role_auth`;
CREATE TABLE `pp_uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='权限和角色关系表';

-- ----------------------------
-- Records of pp_uc_role_auth
-- ----------------------------
BEGIN;
INSERT INTO `pp_uc_role_auth` VALUES (1, 16);
INSERT INTO `pp_uc_role_auth` VALUES (1, 17);
INSERT INTO `pp_uc_role_auth` VALUES (1, 18);
INSERT INTO `pp_uc_role_auth` VALUES (1, 19);
INSERT INTO `pp_uc_role_auth` VALUES (2, 0);
INSERT INTO `pp_uc_role_auth` VALUES (2, 1);
INSERT INTO `pp_uc_role_auth` VALUES (2, 15);
INSERT INTO `pp_uc_role_auth` VALUES (2, 20);
INSERT INTO `pp_uc_role_auth` VALUES (2, 21);
INSERT INTO `pp_uc_role_auth` VALUES (2, 22);
INSERT INTO `pp_uc_role_auth` VALUES (2, 23);
INSERT INTO `pp_uc_role_auth` VALUES (2, 24);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
