/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Version : 50712
 Source Host           : localhost
 Source Database       : ppgo_api_admin

 Target Server Version : 50712
 File Encoding         : utf-8

 Date: 01/19/2018 23:57:42 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `api_detail`
-- ----------------------------
DROP TABLE IF EXISTS `api_detail`;
CREATE TABLE `api_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID da tabela principal',
  `method` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'nome do método:1-GET 2-POST 3-PUT 4-PATCH 5-DELETE',
  `api_name` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Nome',
  `api_url` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Endereço',
  `detail` text COMMENT 'retorna resultado, verdadeiro ou falso',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Tempo de revisão',
  `audit_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Revisor',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Status: 0 - suspenso, 1 - em desenvolvimento, 2 - em revisão, 3 - normal, 4 - com falha',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do alterar',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='Programação da API';

-- ----------------------------
--  Records of `api_detail`
-- ----------------------------
BEGIN;
INSERT INTO `api_detail` VALUES ('1', '1', '1', 'Obtenha um único SKU', '/v0/stock', '#### Descrição:\n\n- Interface\n#### Cabecalho：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### versão da interface:\n\n|Número da versão|Desenvolvedor|Data do desenvolvimento|Data da revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Hao Daquan  |2018-01-15 |  2018-01-15 |', '0', '1', '3', '1', '1', '1507617867', '1516284409'), 
    ('2', '1', '3', 'Atualizar interface de inventário', '/v0/stock/:id', '#### 更新库存简要描述：\n\n- 更新库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '1', '3', '1', '1', '1507619939', '1516284492'), 
    ('3', '2', '1', '获取订单列表接口', '/v0/order', '#### 获取订单列表接口\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1507699351', '1516286722'), 
    ('4', '3', '2', 'nova interface de commodities', '/v0/product', '#### novo商品接口\n\n- novo商品接口接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515762214', '1516286707'), 
    ('5', '4', '1', '获取交易总额', '/v0/trade', '#### 获取交易总额\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface:\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515763734', '1516286689'), 
    ('6', '5', '5', 'interface de avaliação de exclusão', '/v0/evaluate/:id', '#### interface de avaliação de exclusão:\n\n- Interface de login do usuário\n#### Cabeçalho da solicitação:\n\n|Nome do parâmetro|Requerido|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515763795', '1516286674'), 
    ('7', '6', '1', 'Obtenha detalhes de logística', '/v0/delivery', '#### Obtenha detalhes de logística\n\n- Interface de login do usuário\n#### Cabeçalho da solicitação:\n\n|Nome do parâmetro|Obrigatório|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |sim |string |Tipo de solicitação: application/json   |\n|Content-MD5 |sim  |string | Solicitar assinatura de conteúdo |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515763945', '1516286639'), 
    ('8', '6', '3', '更新物流信息', '/v0/delivery', '#### 更新物流信息：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**Retorna em caso de erro: **\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### exemplo de chamada:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface: \n\n|Número da versão|Desenvolvedor|Data de desenvolvimento|Data de revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Hao Daquan  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515764025', '1516286625'), 
    ('9', '3', '1', 'Obter lista de produtos', '/product', '#### Uma breve descrição:\n\n                    - Interface de login do usuário\n\n                    #### Versão da interface:\n\n                    |Número da versão|Desenvolvedor|Data de desenvolvimento|Data de revisão|\n                    |:----    |:---|:----- |-----   |\n                    |2.1.0 |秦亮  |2017-03-20 |  xxxx-xx-xx |\n\n                    #### 请求URL:\n\n                    - http://xx.com/api/login\n\n                    #### Método de solicitação:\n\n                    - GET\n                    - POST\n\n                    #### 请求头：\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |Content-Type |是  |string |请求类型： application/json   |\n                    |Content-MD5 |是  |string | 请求内容签名    |\n\n\n                    #### 请求参数:\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |username |是  |string |用户名   |\n                    |password |是  |string | 密码    |\n\n                    #### 返回示例:\n\n                    **正确时返回:**\n\n                    ```\n                    {\n                        \"errcode\": 0,\n                        \"data\": {\n                            \"uid\": \"1\",\n                            \"account\": \"admin\",\n                            \"nickname\": \"Minho\",\n                            \"group_level\": 0 ,\n                            \"create_time\": \"1436864169\",\n                            \"last_login_time\": \"0\",\n                        }\n                    }\n                    ```\n\n                    **错误时返回:**\n\n\n                    ```\n                    {\n                        \"errcode\": 500,\n                        \"errmsg\": \"invalid appid\"\n                    }\n                    ```\n\n                    #### 返回参数说明:\n\n                    |参数名|类型|说明|\n                    |:-----  |:-----|-----                           |\n                    |group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n                    #### Observação:\n\n                    - 更多返回错误代码请看首页的错误代码描述', '0', '0', '4', '1', '1', '1515937531', '1516286613'), 
    ('10', '3', '5', 'excluir商品接口', '/v0/product', '#### excluir商品接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1515981318', '1516286600'), 
    ('11', '4', '4', 'alterar交易状态', '/v0/delivery', '#### alterar交易状态\n\n- 用户登录接口\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', '0', '0', '3', '1', '1', '1516003820', '1516377141');
COMMIT;

-- ----------------------------
--  Table structure for `api_public`
-- ----------------------------
DROP TABLE IF EXISTS `api_public`;
CREATE TABLE `api_public` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_public_name` varchar(100) NOT NULL DEFAULT '0' COMMENT 'nome do documento público',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT 'Ordenar: crescente',
  `detail` text NOT NULL COMMENT 'Detales',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'estado, 1-normal, 0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`api_public_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de parâmetros da API';

-- ----------------------------
--  Records of `api_public`
-- ----------------------------
BEGIN;
INSERT INTO `api_public` VALUES ('1', 'Introdução à interface', '1', '#### Introdução à interface\n\n- Esta é uma plataforma de interface de teste\n\n#### ler objeto\n - para desenvolvedores', '1', '1', '1', '1516071841', '1516282117'), 
    ('2', 'Aviso de acesso', '2', '#### key e obter o segredo:\n\n- Entre em contato diretamente com o pessoal da empresa para solicitar\n\n#### Parâmetros públicos\n|Nome do parâmetro|Descrição|\n|:------- |:----- |\n|time |Timestamp quando a interface é chamada, ou seja, o timestamp atual (timestamp: current O tempo em segundos a partir da época (1º de janeiro de 1970), ou seja, unix-timestamp, use o timestamp com precisão de segundos.|\n|app-key|O identificador exclusivo do sistema de comerciante de terceiros obtido acima| \ n|sign|Resultado da assinatura do parâmetro de entrada, veja a próxima seção para o método de assinatura|\n\n#### Formato de retorno\n```\n{\n success:true/false,\n data :\n error_code: \n error_msg:\n}\n```', '1', '1', '1', '1516080573', '1516283006'), 
    ('3', 'descrição de retorno', '3', ' #### Algoritmo de criptografia\n\n- Use o endereço de URL configurado pelo usuário para substituir o caminho do URL e, em seguida, use o método de assinatura de assinatura para calcular a subseção e obter o resultado de assinatura correto\n\ n#### Retorna o resultado\n\ n|Nome do parâmetro|Tipo|Descrição do valor|\n|:---- |:----- |: ----- |\n|sucesso |Boolean | Resultado da execução da interface; true indica execução bem-sucedida ; Se for false, significa que a execução falhou|\n|error_msg |String |Descrição da informação do erro|\n|error_code|String|Cód de erro, se houver algum código de erro específico, por favor siga estritamente o código de erro fornecido|\n|data|String| return result|', '1', '1', '1', '1516282746', '1516282746');
COMMIT;

-- ----------------------------
--  Table structure for `api_source`
-- ----------------------------
DROP TABLE IF EXISTS `api_source`;
CREATE TABLE `api_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do grupo',
  `source_name` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Nome',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Status: 1-normal, 0-excluir',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do auditor',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da auditagem',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='tabela mestra de API';

-- ----------------------------
--  Records of `api_source`
-- ----------------------------
BEGIN;
INSERT INTO `api_source` VALUES ('1', '2', 'em estoque', '1', '0', '1', '1', '1507616276', '1516283236', '0'), 
    ('2', '2', 'Ordem', '1', '0', '1', '1', '1507616329', '1516283124', '0'), 
    ('3', '2', 'mercadoria', '1', '0', '1', '1', '1507616394', '1516283140', '0'), 
    ('4', '1', 'troca', '1', '0', '1', '1', '1507616421', '1516283245', '0'), 
    ('5', '1', 'Avalie', '1', '0', '1', '1', '1510122234', '1516283256', '0'), 
    ('6', '3', 'logística', '1', '0', '1', '1', '1515575836', '1516286650', '0'), 
    ('7', '3', 'pedido', '0', '0', '1', '1', '1515914737', '1516281455', '0');
COMMIT;

-- ----------------------------
--  Table structure for `set_code`
-- ----------------------------
DROP TABLE IF EXISTS `set_code`;
CREATE TABLE `set_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Código',
  `desc` varchar(255) NOT NULL DEFAULT '0' COMMENT 'descrição',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Observação',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'status: 1-normal, 0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de agrupamento de ambiente';

-- ----------------------------
--  Records of `set_code`
-- ----------------------------
BEGIN;
INSERT INTO `set_code` VALUES ('1', '200', 'sucesso', 'solicitação bem-sucedida', '1', '0', '0', '1506328003', '1506328037'), 
    ('2', '300', 'erro de retorno', 'Falha na solicitação', '1', '0', '0', '1506328023', '1506328023'), 
    ('3', '302', 'solicitação bem-sucedida', 'erro', '0', '0', '0', '1506328070', '1506334951');
COMMIT;

-- ----------------------------
--  Table structure for `set_env`
-- ----------------------------
DROP TABLE IF EXISTS `set_env`;
CREATE TABLE `set_env` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nome',
  `env_host` varchar(255) NOT NULL DEFAULT '0' COMMENT 'host do ambiente',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Observação',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT 'status: 1-normal, 0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de agrupamento de ambiente';

-- ----------------------------
--  Records of `set_env`
-- ----------------------------
BEGIN;
INSERT INTO `set_env` VALUES ('1', 'endereço de teste', 'http://test.haodaquan.com', 'endereço de teste', '1', '0', '1', '1506316614', '1516283029'), 
    ('2', 'Endereço de teste 3', 'http://127.0.0.1:8083', 'Endereço de teste 3', '0', '0', '0', '1506316696', '1506316850'), 
    ('3', 'Ambiente formal', 'http://api.haodaquan.com', 'Este também é um teste', '1', '1', '1', '1515140110', '1516281840');
COMMIT;

-- ----------------------------
--  Table structure for `set_group`
-- ----------------------------
DROP TABLE IF EXISTS `set_group`;
CREATE TABLE `set_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nome do grupo',
  `detail` varchar(1000) NOT NULL DEFAULT '' COMMENT 'Detalhes',
  `env_ids` varchar(255) NOT NULL DEFAULT '' COMMENT 'IDs do ambiente: 1,2',
  `code_ids` varchar(200) NOT NULL COMMENT 'IDs do código: 1,2',
  `api_public_ids` varchar(200) NOT NULL COMMENT 'IDs do api publico: 1,2',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'status: 1-normal, 0-excluir',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  PRIMARY KEY (`id`),
  KEY `idx_create_id` (`create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `set_group`
-- ----------------------------
BEGIN;
INSERT INTO `set_group` VALUES ('1', 'Prontuário', 'Aqui você gerencia os protuários dos pacientes', '1,3', '1,2', '1,2,3', '1', '0', '1', '1506237536', '1516283091'), 
    ('2', 'Agenda', 'Controle os Agendamentos dos pacientes', '1,3', '1,2', '1,2,3', '1', '0', '1', '1506237621', '1516283080'), 
	  ('3', 'Relatórios', 'Acompanhe as estatísticas de atendimentos', '1,3', '1,2', '1,2,3', '1', '1', '1', '1516281298', '1516371024');
COMMIT;

-- ----------------------------
--  Table structure for `set_template`
-- ----------------------------
DROP TABLE IF EXISTS `set_template`;
CREATE TABLE `set_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Nome do modelo',
  `detail` text NOT NULL COMMENT 'detalhes',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'status: 1-normal, 0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de parâmetros da API';

-- ----------------------------
--  Records of `set_template`
-- ----------------------------
BEGIN;
INSERT INTO `set_template` VALUES ('1', 'Modelo Geral', '#### Resumo:\n\n- login:\n#### cabeçalho:\n\n|Nome do parâmetro|Requerido|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |Sim  |string |Tipo de solicitação: application/json   |\n|Content-MD5 |Sim  |string | Solicitar assinatura de conteúdo    |\n\n\n#### parâmetros de solicitação:\n\n|Nome do parâmetro|Obrigatório|Tipo|Descrição|Exemplo de valor\n|:----    |:---|:----- |-----   |-----   |\n|username |Sim  |string |nome do usuário   | george518\n|password |sim  |string | senha    | gouveia\n\n#### parâmetro de retorno:\n\n|nome do parâmetro|tipo|descrição|\n|:-----  |:-----|-----                           |\n|group_level |int   |ID do grupo de usuários, 1: superadministrador; 2: usuário comum|\n\n#### Exemplo de retorno:\n\n**Retorna quando correto:**\n\n```\n{\n\"status\": 200,\n\"message\": \"Success\",\n\"data\": {\n    \"uid\": \"1\",\n    \"account\": \"admin\",\n    \"nickname\": \"Minho\",\n    \"group_level\": 0 ,\n    \"create_time\": \"1436864169\",\n    \"last_login_time\": \"0\",\n}\n}\n```\n\n**retorno com erro:**\n\n\n```\n{\n\"status\": 300,\n\"message\": \"invalid username\"\n\"data\":{\n    \n}\n}\n```\n\n#### exemplo de chamada:\n\n```\n\n<?php\n    echo \"Hello world\";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface:\n\n|Número da versão|Desenvolvedor|Data do desenvolvimento|Data da revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Jag  |2018-01-15 |  2018-01-15 |', '1', '1', '1', '1516085341', '1516281815');
COMMIT;

-- ----------------------------
--  Table structure for `uc_admin`
-- ----------------------------
DROP TABLE IF EXISTS `uc_admin`;
CREATE TABLE `uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT 'login',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'nome real',
  `password` char(32) NOT NULL DEFAULT '' COMMENT 'senha',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'IDs das regras: 1,2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT 'número do telefone',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT 'email',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT 'salt da senha',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT 'último login',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT 'último IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'status: 1-normal, 0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de administrador';

-- ----------------------------
--  Records of `uc_admin`
-- ----------------------------
BEGIN;
INSERT INTO `uc_admin` VALUES ('1', 'admin', 'jag', 'f5c0e12896495f2bc8c73ddcf67c70a7', '0', '13888888889', 'haodaquan2008@163.com', 'wqbi', '1515904905', '[', '1', '0', '0', '0', '1506128438'), 
    ('2', 'george518', 'georgeHao', 'e5d77ebaffd5e4fe7164b31c6d7f1921', '1,2', '13811558899', '12@11.com', 'ONNy', '1506125048', '127.0.0.1', '0', '0', '0', '0', '1515116737'), 
    ('3', 'haodaquan', 'Hao Daquan', 'e9fa9187e7497892c237433aee966cc1', '2,1', '13811559988', 'hao@123.com', '6fWE', '1505960085', '127.0.0.1', '1', '1', '0', '1505919245', '1513388240'), 
    ('4', 'ceshizhanghao', '测试姓名', 'fa3fb5825c2e64bc764f29245dd1ec7a', '2', '13988009988', '232@124.com', 'i8Nf', '0', '', '1', '1', '0', '1506047337', '1513388111');
COMMIT;

-- ----------------------------
--  Table structure for `uc_auth`
-- ----------------------------
DROP TABLE IF EXISTS `uc_auth`;
CREATE TABLE `uc_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID pai, 0 é o nível superior',
  `auth_name` varchar(64) NOT NULL DEFAULT '0' COMMENT 'nome da permissão',
  `auth_url` varchar(255) NOT NULL DEFAULT '0' COMMENT 'url da permissão',
  `sort` int(1) unsigned NOT NULL DEFAULT '999' COMMENT 'ordem, crecente',
  `icon` varchar(255) NOT NULL,
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'mostrar: 0-ocultar, 1-mostrar',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do usuário',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do alterador',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'status: 1-normal, 0-excluir',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COMMENT='Fator de autoridade';

-- ----------------------------
--  Records of `uc_auth`
-- ----------------------------
BEGIN;
INSERT INTO `uc_auth` VALUES (1, 0, 'Todas', '/', 1, '', 0, 1, 1, 1, 1, 1505620970, 1505620970);
INSERT INTO `uc_auth` VALUES (2, 1, 'Gestão de permissões', '/', 999, 'fa-id-card', 0, 1, 0, 1, 1, 0, 1505622360);
INSERT INTO `uc_auth` VALUES (3, 2, 'administrador', '/admin/list', 1, 'fa-user-o', 0, 1, 1, 1, 1, 1505621186, 1505621186);
INSERT INTO `uc_auth` VALUES (4, 2, 'Ger.Regras', '/role/list', 2, 'fa-user-circle-o', 0, 1, 0, 1, 1, 0, 1505621852);
INSERT INTO `uc_auth` VALUES (5, 3, 'novo', '/admin/add', 1, '', 0, 1, 0, 1, 1, 0, 1505621685);
INSERT INTO `uc_auth` VALUES (6, 3, 'alterar', '/admin/edit', 2, '', 0, 1, 0, 1, 1, 0, 1505621697);
INSERT INTO `uc_auth` VALUES (7, 3, 'excluir', '/admin/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621756, 1505621756);
INSERT INTO `uc_auth` VALUES (8, 4, 'novo', '/role/add', 1, '', 1, 1, 0, 1, 1, 0, 1505698716);
INSERT INTO `uc_auth` VALUES (9, 4, 'alterar', '/role/edit', 2, '', 0, 1, 1, 1, 1, 1505621912, 1505621912);
INSERT INTO `uc_auth` VALUES (10, 4, 'excluir', '/role/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621951, 1505621951);
INSERT INTO `uc_auth` VALUES (11, 2, 'Fator de Autoridade', '/auth/list', 3, 'fa-list', 1, 1, 1, 1, 1, 1505621986, 1505621986);
INSERT INTO `uc_auth` VALUES (12, 11, 'novo', '/auth/add', 1, '', 0, 1, 1, 1, 1, 1505622009, 1505622009);
INSERT INTO `uc_auth` VALUES (13, 11, 'alterar', '/auth/edit', 2, '', 0, 1, 1, 1, 1, 1505622047, 1505622047);
INSERT INTO `uc_auth` VALUES (14, 11, 'excluir', '/auth/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505622111, 1505622111);
INSERT INTO `uc_auth` VALUES (15, 1, 'Centro Pessoal', 'profile/edit', 1001, 'fa-user-circle-o', 1, 1, 0, 1, 1, 0, 1506001114);
INSERT INTO `uc_auth` VALUES (16, 1, 'Ger. da API', '/', 1, 'fa-cubes', 0, 0, 0, 0, 1, 0, 1506125698);
INSERT INTO `uc_auth` VALUES (17, 16, 'API', '/api/list', 1, 'fa-link', 0, 1, 1, 1, 1, 1505622447, 1505622447);
INSERT INTO `uc_auth` VALUES (19, 20, 'documentação pública', '/apipublic/list', 3, 'fa-files-o', 0, 1, 0, 1, 1, 0, 1516155852);
INSERT INTO `uc_auth` VALUES (20, 1, 'Conf Básica', '/', 2, 'fa-cogs', 0, 1, 1, 1, 1, 1505622601, 1505622601);
INSERT INTO `uc_auth` VALUES (21, 20, 'Conf de Grupo', '/group/list', 1, 'fa-object-ungroup', 0, 1, 1, 1, 1, 1505622645, 1505622645);
INSERT INTO `uc_auth` VALUES (22, 20, 'Conf de Ambiente', '/env/list', 2, 'fa-tree', 0, 1, 1, 1, 1, 1505622681, 1505622681);
INSERT INTO `uc_auth` VALUES (23, 20, 'Conf de Código', '/code/list', 3, 'fa-code', 0, 1, 1, 1, 1, 1505622728, 1505622728);
INSERT INTO `uc_auth` VALUES (24, 15, 'Alterar Usu', '/user/edit', 1, 'fa-edit', 1, 1, 0, 1, 1, 0, 1506057468);
INSERT INTO `uc_auth` VALUES (25, 21, 'novo', '/group/add', 1, 'n', 0, 1, 0, 1, 1, 0, 1513324170);
INSERT INTO `uc_auth` VALUES (26, 21, 'alterar', '/group/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506237920, 1506237920);
INSERT INTO `uc_auth` VALUES (27, 21, 'excluir', '/group/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506237948, 1506237948);
INSERT INTO `uc_auth` VALUES (28, 22, 'novo', '/env/add', 1, 'fa', 0, 0, 0, 0, 1, 1506316506, 1506316506);
INSERT INTO `uc_auth` VALUES (29, 22, 'alterar', '/env/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506316532, 1506316532);
INSERT INTO `uc_auth` VALUES (30, 22, 'excluir', '/env/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506316567, 1506316567);
INSERT INTO `uc_auth` VALUES (31, 23, 'novo', '/code/add', 1, 'fa', 0, 0, 0, 0, 1, 1506327812, 1506327812);
INSERT INTO `uc_auth` VALUES (32, 23, 'alterar', '/code/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506327831, 1506327831);
INSERT INTO `uc_auth` VALUES (33, 23, 'excluir', '/code/ajadel', 3, 'fa', 0, 0, 0, 0, 1, 1506327857, 1506327857);
INSERT INTO `uc_auth` VALUES (34, 17, 'novo', '/api/add', 1, 'fa-link', 0, 1, 0, 1, 1, 0, 1515984869);
INSERT INTO `uc_auth` VALUES (35, 17, 'alterar', '/api/edit', 2, 'fa-link', 0, 1, 0, 1, 1, 0, 1515984880);
INSERT INTO `uc_auth` VALUES (36, 17, 'excluir', '/api/ajaxdel', 3, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984893);
INSERT INTO `uc_auth` VALUES (37, 17, 'detalhes', '/api/detail', 4, '', 0, 1, 0, 1, 1, 0, 1515984908);
INSERT INTO `uc_auth` VALUES (38, 17, 'altera', '/api/ajaxchangestatus', 5, '', 0, 1, 0, 1, 1, 0, 1516000160);
INSERT INTO `uc_auth` VALUES (39, 16, 'Recursos da API', '/apisource/list', 1, 'fa-skyatlas', 0, 1, 0, 1, 1, 0, 1515984925);
INSERT INTO `uc_auth` VALUES (40, 39, 'novo', '/apisource/add', 1, '', 0, 1, 0, 1, 1, 0, 1515905034);
INSERT INTO `uc_auth` VALUES (41, 39, 'alterar', '/apisource/edit', 2, '', 0, 1, 0, 1, 1, 0, 1515905044);
INSERT INTO `uc_auth` VALUES (42, 39, 'excluir', '/apisource/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1515905055);
INSERT INTO `uc_auth` VALUES (43, 17, 'auditar', '/api/audit', 6, '', 0, 1, 1, 1, 1, 1516000189, 1516000189);
INSERT INTO `uc_auth` VALUES (44, 19, 'novo', '/apipublic/add', 1, '', 0, 1, 1, 1, 1, 1516067809, 1516067809);
INSERT INTO `uc_auth` VALUES (45, 19, 'alterar', '/apipublic/edit', 2, '', 0, 1, 1, 1, 1, 1516067841, 1516067841);
INSERT INTO `uc_auth` VALUES (46, 19, 'excluir', '/apipublic/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516067881, 1516067881);
INSERT INTO `uc_auth` VALUES (47, 20, 'Conf. Modelo', '/template/list', 4, 'fa-file-text', 0, 1, 1, 1, 1, 1516083233, 1516083233);
INSERT INTO `uc_auth` VALUES (48, 47, 'novo', '/template/add', 1, '', 0, 1, 1, 1, 1, 1516083262, 1516083262);
INSERT INTO `uc_auth` VALUES (49, 47, 'alterar', '/template/edit', 2, '', 0, 1, 1, 1, 1, 1516083296, 1516083296);
INSERT INTO `uc_auth` VALUES (50, 47, 'excluir', '/template/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516083335, 1516083335);
INSERT INTO `uc_auth` VALUES (51, 1, 'Cadastros', '/', 0, 'fa-object-ungroup', 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (52, 51, 'Paciente', '/paciente/list', 1, 'fa-user-circle-o', 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (53, 0, 'Novo Paciente', '/paciente/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (54, 0, 'Altera Paciente', '/paciente/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (55, 51, 'Nota', '/nota/list', 1, 'fa-skyatlas', 1, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (56, 0, 'Nova Nota', '/nota/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (57, 0, 'Altera Nota', '/nota/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (58, 51, 'Empregado', '/empregado/list', 1, 'fa-id-card', 0, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (59, 0, 'novo Empregado', '/empregado/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (60, 0, 'altera Empregado', '/empregado/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (61, 51, 'Linha', '/linha/list', 1, 'fa-file-text', 0, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (62, 0, 'novo Linha', '/linha/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (63, 0, 'altera Linha', '/linha/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (64, 51, 'Bordado', '/bordado/list', 1, 'fa-file-text', 0, 1, 1, 1, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (65, 0, 'novo Bordado', '/bordado/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` VALUES (66, 0, 'altera Bordado', '/bordado/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
COMMIT;

-- ----------------------------
--  Table structure for `uc_role`
-- ----------------------------
DROP TABLE IF EXISTS `uc_role`;
CREATE TABLE `uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Nome da regra',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'detalhes da regra',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do usuário que criou',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do usuário que atualizou',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'status: 1-ativo, 0-excluido',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da atualização',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='tabela de funções';

-- ----------------------------
--  Records of `uc_role`
-- ----------------------------
BEGIN;
INSERT INTO `uc_role` VALUES ('1', 'Administrador de API', 'Tenha todas as permissões da API', '0', '2', '1', '1505874156', '1505874156'), 
  ('2', 'Adm de Sistema', 'Adm de Sistema', '0', '0', '1', '1506124114', '1506124114');
COMMIT;

-- ----------------------------
--  Table structure for `uc_role_auth`
-- ----------------------------
DROP TABLE IF EXISTS `uc_role_auth`;
CREATE TABLE `uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID da regra',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID da autorização',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de relacionamento de permissão e função';

-- ----------------------------
--  Records of `uc_role_auth`
-- ----------------------------
BEGIN;
INSERT INTO `uc_role_auth` VALUES ('1', '16'), 
    ('1', '17'), 
    ('1', '18'), 
    ('1', '19'), 
    ('2', '0'), 
    ('2', '1'), 
    ('2', '15'), 
    ('2', '20'), 
    ('2', '21'), 
    ('2', '22'), 
    ('2', '23'), 
    ('2', '24');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `paciente`;

CREATE TABLE `paciente` (
	`id` INT(5) UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(120) NOT NULL COLLATE 'latin1_swedish_ci',
	`email` VARCHAR(60) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`telefone` VARCHAR(40) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`logradoro` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`numero` VARCHAR(9) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`bairro` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`municipio` VARCHAR(40) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`uf` VARCHAR(2) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`cep` VARCHAR(10) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`altura` INT(11) NOT NULL DEFAULT '0',
	`peso` DECIMAL(3,1) NULL DEFAULT NULL,
	`imagem` VARCHAR(60) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`criado_em` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'hora da criação',
	`alterado_em` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
	`no_selecionado` INT(11) NULL DEFAULT '0',
	`estado` TINYINT(4) NULL DEFAULT '1',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=8
;


DROP TABLE IF EXISTS `etiqueta`;

CREATE TABLE `etiqueta` (
	`id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `etiqueta_id` (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=41
;

DROP TABLE IF EXISTS `cor`;

CREATE TABLE `cor` (
	`id` TINYINT(3) UNSIGNED NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`cor` VARCHAR(6) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`estado` INT(11) NULL DEFAULT '1',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `cor_id` (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=44
;


DROP TABLE IF EXISTS `nota`;

CREATE TABLE `nota` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(40) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`tipo_nota` TINYINT(4) NULL DEFAULT '1',
	`conteudo` TEXT NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`atendimento_id` INT(11) NULL DEFAULT NULL,
	`cor_id` INT(11) NULL DEFAULT NULL,
	`criado_em` INT(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'hora da criação',
	`alterado_em` INT(11) UNSIGNED NOT NULL DEFAULT '0',
	`estado` TINYINT(4) NULL DEFAULT '1',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_tipo_nota` (`tipo_nota`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=3
;


DROP TABLE IF EXISTS `nota_etiqueta`;

CREATE TABLE `nota_etiqueta` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nota_id` INT(11) NOT NULL,
	`etiqueta_id` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `nota_id` (`nota_id`) USING BTREE,
	INDEX `etiqueta_id` (`etiqueta_id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=50228
;

DROP TABLE IF EXISTS `atendimento`;

CREATE TABLE `atendimento` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`paciente_id` INT(11) NULL DEFAULT NULL,
	`nome` VARCHAR(100) NULL DEFAULT NULL COLLATE 'latin1_swedish_ci',
	`cor_id` INT(11) NULL DEFAULT '1',
	`conteudo` TEXT NULL DEFAULT NULL COMMENT 'descrição do atendimento' COLLATE 'utf8mb4_general_ci',
	`estado` TINYINT(4) NULL DEFAULT '1',
	`criador_id` INT(11) NOT NULL DEFAULT '0' COMMENT 'ID do criador',
	`alterador_id` INT(11) NOT NULL DEFAULT '0' COMMENT 'alterador ID',
	`criado_em` INT(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
	`alterado_em` INT(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `idx_nota` (`paciente_id`) USING BTREE
)
COLLATE='latin1_swedish_ci'
ENGINE=InnoDB
ROW_FORMAT=DYNAMIC
AUTO_INCREMENT=11
;





INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (10, 1, 'Atendimento', '/', 1, 'fa-user-md', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (20, 1, 'Agenda', '/', 2, 'fa-calendar', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (30, 1, 'Cadastro', '/', 3, 'fa-object-ungroup', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (31, 30, 'Paciente', '/paciente/list', 999, 'fa-address-card-o', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (32, 31, 'Novo Paciente', '/paciente/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (33, 31, 'Altera Paciente', '/paciente/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (34, 30, 'Usuário', '/admin/list', 999, 'fa-user', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (35, 34, 'Novo Usuário', '/admin/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (36, 34, 'Alterar Usuário', '/admin/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (40, 1, 'Configurar', '/', 4, 'fa-cog', 1, 0, 0, 0, 1, 1, 1);
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES (41, 40, 'Perfil do Usuário', '/user/edit', 999, 'fa-edit', 1, 0, 0, 0, 1, 1, 1);
