-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.25 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para pront-med
CREATE DATABASE IF NOT EXISTS `pront-med` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pront-med`;

-- Copiando estrutura para tabela pront-med.api_detail
CREATE TABLE IF NOT EXISTS `api_detail` (
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
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='Programação da API';

-- Copiando dados para a tabela pront-med.api_detail: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `api_detail` DISABLE KEYS */;
INSERT INTO `api_detail` (`id`, `source_id`, `method`, `api_name`, `api_url`, `detail`, `audit_time`, `audit_id`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 1, 1, 'Obtenha um único SKU', '/v0/stock', '#### Descrição:\n\n- Interface\n#### Cabecalho：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### versão da interface:\n\n|Número da versão|Desenvolvedor|Data do desenvolvimento|Data da revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Hao Daquan  |2018-01-15 |  2018-01-15 |', 0, 1, 3, 1, 1, 1507617867, 1516284409),
	(2, 1, 3, 'Atualizar interface de inventário', '/v0/stock/:id', '#### 更新库存简要描述：\n\n- 更新库存接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 1, 3, 1, 1, 1507619939, 1516284492),
	(3, 2, 1, '获取订单列表接口', '/v0/order', '#### 获取订单列表接口\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1507699351, 1516286722),
	(4, 3, 2, 'nova interface de commodities', '/v0/product', '#### novo商品接口\n\n- novo商品接口接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515762214, 1516286707),
	(5, 4, 1, '获取交易总额', '/v0/trade', '#### 获取交易总额\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface:\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763734, 1516286689),
	(6, 5, 5, 'interface de avaliação de exclusão', '/v0/evaluate/:id', '#### interface de avaliação de exclusão:\n\n- Interface de login do usuário\n#### Cabeçalho da solicitação:\n\n|Nome do parâmetro|Requerido|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763795, 1516286674),
	(7, 6, 1, 'Obtenha detalhes de logística', '/v0/delivery', '#### Obtenha detalhes de logística\n\n- Interface de login do usuário\n#### Cabeçalho da solicitação:\n\n|Nome do parâmetro|Obrigatório|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |sim |string |Tipo de solicitação: application/json   |\n|Content-MD5 |sim  |string | Solicitar assinatura de conteúdo |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515763945, 1516286639),
	(8, 6, 3, '更新物流信息', '/v0/delivery', '#### 更新物流信息：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**Retorna em caso de erro: **\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### exemplo de chamada:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface: \n\n|Número da versão|Desenvolvedor|Data de desenvolvimento|Data de revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Hao Daquan  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515764025, 1516286625),
	(9, 3, 1, 'Obter lista de produtos', '/product', '#### Uma breve descrição:\n\n                    - Interface de login do usuário\n\n                    #### Versão da interface:\n\n                    |Número da versão|Desenvolvedor|Data de desenvolvimento|Data de revisão|\n                    |:----    |:---|:----- |-----   |\n                    |2.1.0 |秦亮  |2017-03-20 |  xxxx-xx-xx |\n\n                    #### 请求URL:\n\n                    - http://xx.com/api/login\n\n                    #### Método de solicitação:\n\n                    - GET\n                    - POST\n\n                    #### 请求头：\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |Content-Type |是  |string |请求类型： application/json   |\n                    |Content-MD5 |是  |string | 请求内容签名    |\n\n\n                    #### 请求参数:\n\n                    |参数名|是否必须|类型|说明|\n                    |:----    |:---|:----- |-----   |\n                    |username |是  |string |用户名   |\n                    |password |是  |string | 密码    |\n\n                    #### 返回示例:\n\n                    **正确时返回:**\n\n                    ```\n                    {\n                        "errcode": 0,\n                        "data": {\n                            "uid": "1",\n                            "account": "admin",\n                            "nickname": "Minho",\n                            "group_level": 0 ,\n                            "create_time": "1436864169",\n                            "last_login_time": "0",\n                        }\n                    }\n                    ```\n\n                    **错误时返回:**\n\n\n                    ```\n                    {\n                        "errcode": 500,\n                        "errmsg": "invalid appid"\n                    }\n                    ```\n\n                    #### 返回参数说明:\n\n                    |参数名|类型|说明|\n                    |:-----  |:-----|-----                           |\n                    |group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n                    #### Observação:\n\n                    - 更多返回错误代码请看首页的错误代码描述', 0, 0, 4, 1, 1, 1515937531, 1516286613),
	(10, 3, 5, 'excluir商品接口', '/v0/product', '#### excluir商品接口：\n\n- 用户登录接口\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1515981318, 1516286600),
	(11, 4, 4, 'alterar交易状态', '/v0/delivery', '#### alterar交易状态\n\n- 用户登录接口\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|示例值\n|:----    |:---|:----- |-----   |-----   |\n|username |是  |string |用户名   | george518\n|password |是  |string | 密码    | george518\n\n#### 返回参数:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### 调用示例:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- 更多返回错误代码请看首页的错误代码描述\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |郝大全  |2018-01-15 |  2018-01-15 |', 0, 0, 3, 1, 1, 1516003820, 1516377141);
/*!40000 ALTER TABLE `api_detail` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.api_public
CREATE TABLE IF NOT EXISTS `api_public` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_public_name` varchar(100) NOT NULL DEFAULT '0' COMMENT 'nome do documento público',
  `sort` int(11) unsigned NOT NULL DEFAULT '99' COMMENT '排序，越小越往前',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`api_public_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela pública';

-- Copiando dados para a tabela pront-med.api_public: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `api_public` DISABLE KEYS */;
INSERT INTO `api_public` (`id`, `api_public_name`, `sort`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 'Introdução à interface', 1, '#### Introdução à interface\n\n- Esta é uma plataforma de interface de teste\n\n#### ler objeto\n - para desenvolvedores', 1, 1, 1, 1516071841, 1516282117),
	(2, 'Aviso de acesso', 2, '#### key e obter o segredo:\n\n- Entre em contato diretamente com o pessoal da empresa para solicitar\n\n#### Parâmetros públicos\n|Nome do parâmetro|Descrição|\n|:------- |:----- |\n|time |Timestamp quando a interface é chamada, ou seja, o timestamp atual (timestamp: current O tempo em segundos a partir da época (1º de janeiro de 1970), ou seja, unix-timestamp, use o timestamp com precisão de segundos.|\n|app-key|O identificador exclusivo do sistema de comerciante de terceiros obtido acima|  n|sign|Resultado da assinatura do parâmetro de entrada, veja a próxima seção para o método de assinatura|\n\n#### Formato de retorno\n```\n{\n success:true/false,\n data :\n error_code: \n error_msg:\n}\n```', 1, 1, 1, 1516080573, 1516283006),
	(3, 'descrição de retorno', 3, ' #### Algoritmo de criptografia\n\n- Use o endereço de URL configurado pelo usuário para substituir o caminho do URL e, em seguida, use o método de assinatura de assinatura para calcular a subseção e obter o resultado de assinatura correto\n n#### Retorna o resultado\n n|Nome do parâmetro|Tipo|Descrição do valor|\n|:---- |:----- |: ----- |\n|sucesso |Boolean | Resultado da execução da interface; true indica execução bem-sucedida ; Se for false, significa que a execução falhou|\n|error_msg |String |Descrição da informação do erro|\n|error_code|String|Cód de erro, se houver algum código de erro específico, por favor siga estritamente o código de erro fornecido|\n|data|String| return result|', 1, 1, 1, 1516282746, 1516282746);
/*!40000 ALTER TABLE `api_public` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.api_source
CREATE TABLE IF NOT EXISTS `api_source` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组ID',
  `source_name` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Nome',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态：1-正常，0-excluir',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人ID',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `audit_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '审核人时间',
  PRIMARY KEY (`id`),
  KEY `idx_group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='tabela principal de API';

-- Copiando dados para a tabela pront-med.api_source: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `api_source` DISABLE KEYS */;
INSERT INTO `api_source` (`id`, `group_id`, `source_name`, `status`, `audit_id`, `create_id`, `update_id`, `create_time`, `update_time`, `audit_time`) VALUES
	(1, 2, 'em estoque', 1, 0, 1, 1, 1507616276, 1516283236, 0),
	(2, 2, 'Ordem', 1, 0, 1, 1, 1507616329, 1516283124, 0),
	(3, 2, 'mercadoria', 1, 0, 1, 1, 1507616394, 1516283140, 0),
	(4, 1, 'troca', 1, 0, 1, 1, 1507616421, 1516283245, 0),
	(5, 1, 'Avalie', 1, 0, 1, 1, 1510122234, 1516283256, 0),
	(6, 3, 'logística', 1, 0, 1, 1, 1515575836, 1516286650, 0),
	(7, 3, 'pedido', 0, 0, 1, 1, 1515914737, 1516281455, 0);
/*!40000 ALTER TABLE `api_source` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.atendimento
CREATE TABLE IF NOT EXISTS `atendimento` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `paciente_id` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `conteudo` text CHARACTER SET utf8mb4 COMMENT 'descrição do atendimento',
  `cor_id` int(11) NOT NULL DEFAULT '0',
  `etiqueta_id` int(11) NOT NULL DEFAULT '0',
  `estado` tinyint(4) DEFAULT '1',
  `criador_id` int(11) NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `alterador_id` int(11) NOT NULL DEFAULT '0' COMMENT 'alterador ID',
  `criado_em` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `alterado_em` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_nota` (`paciente_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.atendimento: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `atendimento` DISABLE KEYS */;
INSERT INTO `atendimento` (`id`, `paciente_id`, `nome`, `conteudo`, `cor_id`, `etiqueta_id`, `estado`, `criador_id`, `alterador_id`, `criado_em`, `alterado_em`) VALUES
	(1, 2, 'Teste UM', '<h1>Aqui um <b>pequeno</b> teste ...</h1>', 5, 1, 1, 1, 1, 1652831195, 1653606409),
	(2, 3, 'Teste DOIS', '<p>Teste dois, </p><p><strong>primeira </strong>nota do atendimento</p>', 3, 2, 1, 1, 1, 1652831195, 1654890428),
	(3, 2, 'Teste TRES', '<p>terceiro <strong>Teste </strong>&nbsp;aqui</p>', 2, 1, 1, 0, 0, 1652911973, 1654883940),
	(4, 2, 'Teste Quatro', '<p>quarto <strong>atendimento</strong></p><p>.</p>', 3, 3, 1, 0, 0, 1652831220, 1654734407),
	(7, 2, 'Teste SEIS', '<p>Aqui <strong>66666&nbsp; </strong>alterado</p>', 7, 1, 1, 0, 0, 1652998281, 1654897547),
	(10, 2, 'Novo Atendimento', 'aq', 3, 3, 0, 0, 0, 1653009202, 1653009242),
	(12, 3, 'Cota Racial', '<h1>Datafolha: <strong>Metade </strong>dos brasileiros é a favor das cotas raciais em universidades; <strong>34%</strong> são contra</h1><p><br></p><h2>Pesquisa mostra que apoio é maior entre mais jovens, escolarizados e com maior renda. Aprovação também cresce entre pretos, pardos e pais com filhos em escolas particulares. Pesquisa ouviu 2.090 pessoas a partir de 16 anos em 130 municípios.</h2><p>Por g1</p><p>12/06/2022 11h10&nbsp;&nbsp;Atualizado&nbsp;há 8 horas</p><p><br></p><p><img src="https://s2.glbimg.com/cZLH3bfkHXBFj0ehZZm27qPvVKo=/0x0:950x600/1008x0/smart/filters:strip_icc()/s.glbimg.com/jo/g1/f/original/2012/04/21/cotas.jpg" alt="A Universidade de Brasília (UnB) foi a primeira do pais a adotar o sistema de cotas raciais — Foto: UnB Agência"></p><p>A Universidade de Brasília (UnB) foi a primeira do pais a adotar o sistema de cotas raciais — Foto: UnB Agência</p><p class="ql-align-center"><br></p><p>Dados do último levantamento do instituto Datafolha, divulgado neste domingo (12) pelo jornal "Folha de S.Paulo", apontam que&nbsp;50% da população brasileira é a favor das cotas raciais em universidades públicas.</p><p>Entre os entrevistados,&nbsp;34% se posicionaram contra. Outros&nbsp;3% se mostraram indiferentes&nbsp;e&nbsp;12% não souberam responder.</p><p>A pesquisa ouviu 2.090 pessoas a partir de 16 anos em 130 municípios, entre 8 e 14 de março deste ano. A margem de erro é de dois pontos percentuais para mais ou para menos. Segundo a "Folha de S.Paulo", a pesquisa foi feita em parceria com o Cesop-Unicamp sob a coordenação da Ação Educativa e do Cenpec.</p><p class="ql-align-center"><br></p><p>Em geral, o apoio às cotas é maior entre os mais jovens, escolarizados e com maior renda. A&nbsp;concordância também é superior entre a população preta (53%) e parda (52%) do que entre brancos (50%).</p><p>A aprovação passa para 60% entre pessoas com filhos que estudam em escolas particulares, que não são beneficiados pelo mecanismo. Entre os pais de filhos em escolas públicas, há a maior falta de opinião sobre o tema: 11% desse grupo dizem não saber opinar sobre a questão, contra 3% no outro grupo.</p><p>A pesquisa Datafolha também fez perguntas sobre a abordagem da discriminação racial nas escolas e respeito às crenças religiosas. A maioria dos entrevistados (81,4%) concorda totalmente que a discriminação racial deve ser discutida nas escolas. O respeito a todo tipo de crença e prática religiosa na escola pública é apoiado por 93,7%.</p><h2><strong>Lei de 2012</strong></h2><p>A Lei de Cotas foi sancionada em 2012. A partir dela, todas as universidades federais do Brasil passaram a adotar a ação afirmativa de forma escalonada até chegarem, em 2016, à reserva de 50% das vagas para alunos que cursaram todo o ensino médio em escola pública.</p><p>A legislação determina que o preenchimento dessas vagas siga a mesma proporção da população de pretos, pardos, indígenas e pessoas com deficiência do estado onde fica instituição de ensino, seguindo os dados do censo mais recente do Instituto Brasileiro de Geografia e Estatística (IBGE).</p><p class="ql-align-center"><br></p><p>A própria lei prevê que ela passe por revisão até agosto deste ano, quando o programa completa dez anos.&nbsp;<a href="https://g1.globo.com/politica/noticia/2022/01/29/revisao-da-lei-de-cotas-em-meio-a-campanha-eleitoral-e-risco-de-retrocesso-receiam-parlamentares.ghtml" rel="noopener noreferrer" target="_blank" style="color: rgb(196, 23, 12);">Parlamentares defensores da medida têm receio de que o debate em meio à campanha eleitoral provoque "retrocesso"</a>. Eles defendem o adiamento da revisão.</p><p><a href="https://g1.globo.com/politica/eleicoes/2018/noticia/2018/10/24/bolsonaro-diz-ser-contra-cotas-e-que-politica-de-combate-ao-preconceito-e-coitadismo.ghtml" rel="noopener noreferrer" target="_blank" style="color: rgb(196, 23, 12);">O presidente Jair Bolsonaro (PL) já criticou a política</a>, mas até agora não houve movimentações em seu governo para alterá-la.</p><p>A pesquisa Datafolha mostra que a&nbsp;aprovação às cotas é maior entre pessoas que consideram o governo Bolsonaro péssimo (57%) do que entre aqueles que avaliam seu desempenho como ótimo (31%).</p><p><br></p>', 7, 1, 1, 0, 0, 1653009810, 1655074140),
	(16, 4, 'Primeiro atendimento aqui', '<p>Este é o <strong>primeiro </strong>atendimento do Cláudio...</p>', 3, 2, 1, 0, 0, 1653237151, 1654902460),
	(18, 2, 'Receita', '1 cp ao dia', 3, 2, 0, 0, 0, 1653248549, 0),
	(19, 3, 'Primeiro Atnedimento', '<p>A pandemia do coronavírus reconfigurou diversos mecanismos de nossa sociedade. Para evitar aglomerações, é necessário que as pessoas que têm essa opção fiquem em casa. E, nesse sentido, o comércio de serviços essenciais e as unidades de saúde precisaram adaptar sua realidade para garantir a segurança de todos.</p><p><strong>Conheça o&nbsp;</strong><a href="https://bit.ly/39ubTrs" rel="noopener noreferrer" target="_blank" style="background-color: transparent; color: var(--color-primary);"><strong>Summit Saúde</strong></a><strong>, um evento que reúne as maiores autoridades do Brasil nas áreas médica e hospitalar.</strong></p><p>Por exemplo, muitas unidades de atendimento aos pacientes passaram a investir na tecnologia para seguir com a realização de consultas e não deixar prejuízos à população. Um dos modelos de atendimento médico em destaque atualmente é a telemedicina.</p><p>Entretanto, a prática ainda é cercada de polêmica. Vale lembrar que, para que os atendimentos acontecessem de forma remota, foi aprovado o&nbsp;<a href="https://www.camara.leg.br/proposicoesWeb/fichadetramitacao?idProposicao=2239462" rel="noopener noreferrer" target="_blank" style="background-color: transparent; color: var(--color-primary);">Projeto de Lei nº 696/2020</a>&nbsp;em caráter emergencial, em março de 2020.</p>', 2, 2, 1, 0, 0, 1653254162, 1655071105),
	(20, 4, 'Segundo Atend', '22222222', 1, 1, 1, 0, 0, 1653262356, 0),
	(21, 4, 'Terceiro Atend', '', 5, 2, 1, 0, 0, 1653262407, 1653746418),
	(22, 2, 'SETE', '77777', 1, 2, 0, 0, 0, 1653262897, 0),
	(23, 6, 'Atendimento Inicial', 'Paciente com queixas de cólicas.', 2, 2, 1, 0, 0, 1653345501, 1653345600),
	(24, 6, 'Retorno', 'retornando para ...', 5, 2, 0, 0, 0, 1653345703, 0),
	(25, 6, 'Terceiro Atend', '33333333333333333', 2, 1, 0, 0, 0, 1653346674, 1653346734),
	(26, 2, 'atend de Hoje', '<p>Anotações de hoje.</p>', 4, 1, 1, 0, 0, 1653347638, 1655395078),
	(27, 6, 'Quart atend0', '4444444', 3, 2, 0, 0, 0, 1653350158, 1653350176),
	(28, 6, 'segundo atendimento', 'aaaaa222222', 3, 1, 1, 0, 0, 1653350273, 0),
	(29, 6, 'Terceiro Atend', '33333', 1, 2, 1, 0, 0, 1653350440, 0),
	(30, 7, 'primeiro atend', 'bla bla vdfdgd&nbsp; dgdgdgd <b>dgdgdg</b>&nbsp; <u>gdgdgdg</u><div><u><br></u></div><div><u><br></u></div>', 2, 0, 1, 0, 0, 1653749838, 0),
	(31, 7, 'Retorn', 'retorno do paciente com ...', 2, 0, 1, 0, 0, 1653749939, 0),
	(32, 5, 'Primeiro', '<p>A paciente chega com queixas...</p>', 4, 0, 1, 0, 0, 1654297673, 1655068044),
	(33, 2, 'novo comparecimento', '<p><span class="ql-size-small ql-font-monospace">O paciente </span></p><p><br></p><p><span class="ql-size-small ql-font-monospace"> com ....</span></p>', 7, 0, 1, 0, 0, 1654297825, 1655395028);
/*!40000 ALTER TABLE `atendimento` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.campo
CREATE TABLE IF NOT EXISTS `campo` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `modelo_id` int(11) DEFAULT '0',
  `nome` varchar(50) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `resposta` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `template_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.campo: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `campo` DISABLE KEYS */;
INSERT INTO `campo` (`id`, `modelo_id`, `nome`, `descricao`, `resposta`) VALUES
	(1, 2, 'medicamento', 'descrição do medicamento', '1. lbuprofeno 6500mg _____________________ 15 comprimidos'),
	(3, 2, 'local', NULL, NULL);
/*!40000 ALTER TABLE `campo` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.cor
CREATE TABLE IF NOT EXISTS `cor` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cor` varchar(6) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `cor_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.cor: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` (`id`, `nome`, `cor`, `estado`) VALUES
	(1, 'Amarelo', 'dfdc9a', 1),
	(2, 'Verde', '7edd80', 1),
	(3, 'Azul', '9aa8df', 1),
	(4, 'Amarelo claro', 'f9f7b9', 1),
	(5, 'Verde Claro', 'ccf5cf', 0),
	(6, 'Rosa', 'eec9e1', 0),
	(7, 'Verde Pscina', 'a5dbdf', 1),
	(8, 'Cinza Claro', 'f5f5f5', 1);
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.etiqueta
CREATE TABLE IF NOT EXISTS `etiqueta` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `cor_id` int(11) DEFAULT '0',
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `etiqueta_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.etiqueta: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
INSERT INTO `etiqueta` (`id`, `nome`, `cor_id`, `estado`) VALUES
	(1, 'Consulta', 2, 1),
	(2, 'Retorno', 1, 1);
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.etiqueta_nota
CREATE TABLE IF NOT EXISTS `etiqueta_nota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nota_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nota_id` (`nota_id`) USING BTREE,
  KEY `etiqueta_id` (`etiqueta_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.etiqueta_nota: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `etiqueta_nota` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta_nota` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.modelo
CREATE TABLE IF NOT EXISTS `modelo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL DEFAULT '0' COMMENT 'Id',
  `detalhe` text NOT NULL COMMENT 'layout do modelo',
  `estado` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT 'estado，1-ativo，0-excluído',
  `criador_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID do criador',
  `alterador_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'ID de quem alterou',
  `criado_em` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `alterado_em` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_main_id` (`nome`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de modelos';

-- Copiando dados para a tabela pront-med.modelo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` (`id`, `nome`, `detalhe`, `estado`, `criador_id`, `atualizador_id`, `criado_em`, `alterado_em`) VALUES
	(1, 'receita', 'Receita médica', 1, 1, 1, 0, 0);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.nota
CREATE TABLE IF NOT EXISTS `nota` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) DEFAULT NULL,
  `tipo_nota` tinyint(4) DEFAULT '1',
  `conteudo` text,
  `atendimento_id` int(11) DEFAULT NULL,
  `cor_id` int(11) DEFAULT '0',
  `etiqueta_id` int(11) DEFAULT '0',
  `criado_em` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `alterado_em` int(11) unsigned NOT NULL DEFAULT '0',
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_tipo_nota` (`tipo_nota`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.nota: ~22 rows (aproximadamente)
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` (`id`, `nome`, `tipo_nota`, `conteudo`, `atendimento_id`, `cor_id`, `etiqueta_id`, `criado_em`, `alterado_em`, `estado`) VALUES
	(1, 'Primeira consulta', 1, '<p><span class="ql-font-serif">A primeira consulta, aqui podemos </span><strong class="ql-font-serif">relatar </strong><span class="ql-font-serif">todos os </span>procedimentos<span class="ql-font-serif">....</span></p>', 3, 3, 1, 1652831220, 1655467721, 1),
	(2, 'Retorno', 1, '<p>Teste</p>', 3, 1, 1, 1652831220, 1654817222, 1),
	(3, 'Receita', 1, '<h2><span class="ql-font-monospace ql-size-large">Receita </span><span class="ql-font-monospace">do </span><strong class="ql-font-monospace">quarto</strong><span class="ql-font-monospace"> atendimento</span></h2>', 4, 7, 3, 1653251078, 1654884154, 1),
	(4, 'Exame', 1, '<p>&nbsp;Exame 1</p>', 4, 3, 2, 1653251424, 1654884137, 1),
	(5, 'NOTA', 1, 'novz NOTA', 7, 1, 1, 1653252586, 0, 0),
	(6, 'Anaminese', 1, '<h4>1. Identificação do paciente:</h4><p>A <strong>identificação </strong>é o primeiro passo para a construção de uma anamnese, como o nome já diz, é a identificação do paciente, ou seja, seu nome, idade e a data de nascimento, o peso, altura etc.</p><p>Se você já conta com algum <a href="https://www.feegowclinic.com.br/qual-o-melhor-software-medico-para-a-minha-clinica-blog/" rel="noopener noreferrer" target="_blank">sistema médico automatizado</a>, essas informações serão preenchidas automaticamente direto do cadastro do paciente.</p><h4>2. Queixa principal (QP):&nbsp;</h4><p>A <strong>Queixa Principal (QP)</strong> é o momento para perguntar ao paciente o motivo dele ter procurado ajuda médica, isso significa que o médico precisa extrair do paciente o <strong>motivo principal </strong>da sua presença no consultório.&nbsp;</p><p>Você pode usar a pergunta mais clássica: “como posso te ajudar?” ou “o que você está sentindo?”, além de poder personalizá-las de acordo com as suas necessidades.</p><p>Vale lembrar que, nesse processo, você registra a queixa do paciente com as mesmas palavras que ele usou, ou seja, nada de termos técnicos, apenas <strong>transcreva o que o paciente disse</strong>.</p><h3><br></h3><h4>3. Histórico de doença atual (HDA):</h4><p>Depois de anotar a <strong>queixa principal</strong> do paciente, este é o momento de registrá-la usando os termos técnicos da sua área, pois o <strong>histórico de doença atual</strong> <strong>(HDA)</strong> é <strong>a parte mais importante da sua anamnese</strong>.</p><p>Assim, você descreve a doença do paciente, garantindo que nada se perca, portanto, tenha atenção a tudo o que ele disser no consultório.&nbsp;</p><ul><li><strong>Cronologia</strong>: quando foi o início? Como começou?</li><li><strong>Localização corporal</strong>: qual é a origem do relato? E o grau de profundidade?</li><li><strong>Qualidade</strong>: quais são as sensações? O aspecto físico do fenômeno?</li><li><strong>Quantidade</strong>: com que frequência ocorre os sintomas? Qual a duração?</li><li><strong>Circunstâncias</strong>: existe alguma condição externa que possa influenciar?&nbsp;</li><li><strong>Fatores agravantes ou atenuantes</strong>: existe alguma situação que possa desencadear esses sintomas? (atividades, elementos, drogas etc.).</li><li><strong>Manifestações associadas:</strong> há algum sintoma ou informação que você julga importante associar a etiologia da queixa principal? (por exemplo, capacidade de trabalho, perda de peso, febre etc).</li></ul><p>Afinal, <strong>a anamnese é a base para um diagnóstico rápido e assertivo</strong> para que o paciente inicie o tratamento com muito mais rapidez e eficiência.</p><p>Uma dica: lembre-se de que a <strong>HDA deverá ser registrada em ordem cronológica</strong>, isto é, você precisa registrar desde o momento que começou os primeiros sintomas, mas, não se esqueça de descrever a doença, quanto mais detalhes, melhor!</p><h4>4. História Patológica Pregressa (HPP):&nbsp;</h4><p>A <strong>História Patológica Pregressa (HPP)</strong> do paciente também é um item que deve constar na sua anamnese. Logo, reunir dados sobre o histórico de saúde do paciente é essencial para fazer uma boa anamnese.&nbsp;</p><p>Por exemplo, se o paciente é hipertenso e/ou diabético, se faz uso de algum medicamento de uso continuado, como o anticoncepcional ou antidepressivos. Como também se ele possui algum hábito (fumo, álcool, sono, hábitos alimentares).&nbsp;</p><h4>5. Alergias:</h4><p>Este item não pode faltar na sua anamnese, pois, dependendo do tipo de alergia, há grande influência no uso de medicamentos, afetando diretamente o tratamento do paciente.</p><h4>6. Hábitos de vida&nbsp;</h4><p>Os hábitos de vida também devem constar em uma boa anamnese. O tabagismo, o alcoolismo e o sedentarismo são hábitos que podem podem influenciar no surgimento de determinadas doenças. Portanto, não podem faltar!</p><h4>7. Histórico Familiar</h4><p>Como você já deve saber, muitas doenças são associadas a carga genética, por isso, entender o histórico familiar do paciente contribui para a construção de uma boa anamnese.</p><p>Sendo assim, esta etapa é o momento de saber quais doenças os familiares do seu paciente têm ou já tiveram.</p><h4>Como é feita a anamnese?</h4><p>Esse é aquele momento que você conversa com o seu paciente e entende as razões pelas quais ele decidiu procurar a sua ajuda.</p><p>O médico, no entanto, deve ser capaz de fazer uma anamnese que seja abrangente, refletindo sobre o impacto das questões e sobre a qualidade da relação com o paciente.</p><h5><strong>Análise de parâmetros clínicos:</strong></h5><p>Os parâmetros clínicos são obtidos geralmente na triagem, ou seja, antes da consulta, e auxiliam o médico a compreender melhor a queixa do paciente.&nbsp;</p><p>Por isso, fique atento a etapa de: : inspeção, palpação, percussão e ausculta.</p><p>A seguir explicamos o detalhe de cada uma delas.&nbsp;</p><ol><li>Inspeção: Ao olhar para o paciente identifique quaisquer mudanças que podem indicar ou sugerir patologias.</li><li>Palpação: Com o tato, você vai identificar alterações no paciente.</li><li>Percussão: Para identificar alterações por meio de sons, faça o uso de pequenos “golpes”, visto que cada estrutura do corpo emite um som próprio.</li><li>Ausculta: esta etapa se assemelha a percussão, no entanto, é utilizado um<a href="https://www.feegowclinic.com.br/gestao-de-equipamentos-hospitalares-blog/" rel="noopener noreferrer" target="_blank"> dispositivo médico</a> para isso, como o estetoscópio, por exemplo.</li></ol><p>Ao conseguir esses dados, é imprescindível investigar o histórico clínico do paciente. Nesse sentido, é importante questionar tudo o que seja relevante para o caso clínico apresentado.&nbsp;</p><h5><strong>Investigação de histórico:</strong></h5><p>Esse é o momento ideal para questionar o seu paciente sobre <a href="https://www.feegowclinic.com.br/prescricao-medica-blog/" rel="noopener noreferrer" target="_blank">o uso de medicamentos</a>, hábitos de vida, e até mesmo produtos utilizados que foram, ou não prescritos.</p><p>Assim, você identifica se o paciente costuma aderir ao tratamento, se algum medicamento de uso controlado pode interferir no tratamento e assim por diante.</p><p>Não se esqueça, ainda, do histórico familiar do paciente, é extremamente importante para a análise clínica.&nbsp;</p><h5><strong>Interpretação verbal e não verbal do paciente</strong></h5><p>Por muitas vezes você vai se deparar com um paciente que descreve seus sintomas, mas que, se analisarmos seu comportamento, contradiz o seu relato.</p><p>Sendo assim, a linguagem não verbal é interpretada por gestos e atitudes do paciente. Portanto, avalie se o paciente desvia o olhar enquanto fala, ou se está muito na defensiva, pois pode ser um sinal de que algo não está bem!</p><h5><strong>Conversa com o paciente:</strong></h5><p>É o momento ideal para você explicar detalhadamente ao seu paciente porque solicitou determinado exame, como também sanar todas as dúvidas que ele apresente.</p><p>Vale lembrar aqui que não é muito recomendado deixar que o seu paciente saia do consultório com dúvidas, pois isso pode impactar negativamente a aderência ao tratamento.&nbsp;</p><h5><strong>Orientação e diagnóstico:</strong></h5><p>Esta etapa vem logo após a realização de exames. Nesse momento, o médico já reuniu as informações necessárias para chegar ao diagnóstico do paciente.&nbsp;</p><p>Por meio do diagnóstico correto, o médico está pronto para orientar o paciente sobre a melhor conduta terapêutica, capaz de aliviar o sofrimento do paciente. Por isso, deve ser bem explicado para o mais interessado: o próprio paciente.</p><p>Essa prática coloca o paciente como <a href="https://www.feegowclinic.com.br/cuidado-centrado-no-paciente-blog/" rel="noopener noreferrer" target="_blank">protagonista do seu processo de cura</a> e humaniza o atendimento em saúde.&nbsp;</p><h5>Elaboração do roteiro de anamnese</h5><p>Além disso, use o modelo de roteiro de anamnese criado pela Escola Superior de Ciências da Saúde (ESCS) para deixar a entrevista com o paciente mais confortável e humana.&nbsp;</p><p>Decidiu-se incluir no roteiro de anamnese da ESCS temas relativos a <strong>perspectivas do paciente</strong>:&nbsp;</p><p>(a) repercussões da doença sobre a vida, família e trabalho;&nbsp;</p><p>(b) experiências semelhantes vivenciadas pelo paciente ou por pessoas próximas;</p><p>(c) conselhos recebidos para lidar com a doença;</p><p>(d) medidas tomadas pelo paciente para lidar com a doença;</p><p>(e) principais preocupações atuais;</p><p>(f) a que atribui a doença (causas);</p><p>(g) como se sente com relação à doença;</p><p>(h) percepções sobre o tratamento: dificuldades e benefícios;</p><p>(i) percepções sobre o médico, a equipe de saúde e o atendimento;</p><h6 style="text-align: justify;">(j) dúvidas ou assuntos que o paciente julgar relevantes.</h6>', 19, 7, 1, 1653254479, 1654901669, 1),
	(7, 'Novo Atend', 1, '<p><strong>Nova</strong> Nota</p>', 7, 2, 1, 1653262058, 1654891037, 1),
	(8, 'Nota Um', 1, '<p><strong>Minha Lista</strong></p><p><br></p><ul><li>Um</li><li>Dois</li><li>Tres</li></ul>', 20, 2, 2, 1653262376, 1654883320, 1),
	(9, 'Dois', 1, '<p><span style="background-color: rgb(255, 194, 102);">Segunda nota</span></p>', 20, 3, 1, 1653262394, 1654883383, 1),
	(10, 'N7', 1, 'Nota 777', 22, 2, 1, 1653262914, 1653262920, 0),
	(11, 'Nota NOVA', 1, 'Mais uma Nota', 23, 3, 2, 1653346001, 0, 1),
	(12, 'nota 3', 1, '<p class="ql-align-center">Esta é a terceira <strong>nota</strong> do teste UM</p><p class="ql-align-center"><span class="ql-font-monospace">segunda linha..</span>.</p><p class="ql-align-center"><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p class="ql-align-center"><u>                          José </u><strong><u>Alves </u></strong><u>de Gouveia                                   </u></p>', 1, 1, 2, 1653347607, 1654891210, 1),
	(13, 'Nota de hoje', 1, '<p>Hoje estamos anotando nova queixas.</p><p><br></p><p><br></p><p><br></p>', 26, 3, 1, 1653347761, 1654819962, 1),
	(14, 'segunda nota', 1, '22222', 23, 1, 2, 1653350236, 1653350254, 1),
	(16, 'terceira nota', 1, '333333', 23, 3, 1, 1653350414, 0, 1),
	(17, 'primeira nota do terceiro', 1, '11111', 29, 4, 1, 1653350461, 0, 1),
	(18, 'Exames', 1, '<h2 style="text-align: justify;"><span class="ql-size-small">Lista de afazeres:</span></h2><ol><li>um</li><li>dois</li><li>tres</li></ol>', 19, 4, 0, 1653748317, 1655387877, 1),
	(19, 'Receita', 1, '<h3 style=""><br></h3><p>1 - xxxxsxsx&nbsp; ----&nbsp; &nbsp; 1 cx</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><h3><strong>José Alves de Gouveia</strong></h3><p><br></p>', 19, 1, 0, 1653748758, 1655070979, 1),
	(20, 'Exames', 1, 'Solicito Exames:jdhdhfhf fjhff<div><br></div>', 30, 5, 0, 1653749872, 0, 1),
	(21, 'Atestado', 1, 'Atesto para os', 30, 2, 0, 1653749919, 0, 1),
	(22, 'Receita', 1, '1 xxx x xx x x x x x <b>xxxxx&nbsp; </b>1pc', 32, 2, 0, 1654297710, 1654357617, 1),
	(23, 'Nota 1', 1, '<p>1111111111111111111111111111111111111111</p>', 33, 8, 0, 1654889549, 1654889690, 1);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) CHARACTER SET latin1 NOT NULL,
  `email` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `telefone` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `logradoro` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `numero` varchar(9) CHARACTER SET latin1 DEFAULT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `municipio` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `uf` varchar(2) CHARACTER SET latin1 DEFAULT NULL,
  `cep` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `sexo` char(1) DEFAULT 'M',
  `nascimento` int(11) NOT NULL DEFAULT '0',
  `altura` int(11) NOT NULL DEFAULT '0',
  `peso` decimal(3,1) DEFAULT NULL,
  `imagem` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `criado_em` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da criação',
  `alterado_em` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'hora da alteração',
  `no_selecionado` int(11) unsigned NOT NULL DEFAULT '0',
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Copiando dados para a tabela pront-med.paciente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` (`id`, `nome`, `email`, `telefone`, `logradoro`, `numero`, `bairro`, `municipio`, `uf`, `cep`, `sexo`, `nascimento`, `altura`, `peso`, `imagem`, `criado_em`, `alterado_em`, `no_selecionado`, `estado`) VALUES
	(1, 'Marly Souza Sá de Gouveia', 'marlysouzagouveia@gmail.com', '79988375232', '', '', '', '', 'SE', '', 'F', -133822800, 0, 0.0, '', 1651529124, 1655051676, 1, 1),
	(2, 'Bernard de Sá Gouveia', '', '', '', '', '', 'Aracaju', 'SE', '', 'M', 531370800, 184, 96.0, '', 1651529153, 1655052554, 12, 1),
	(3, 'José Alves de Gouveia', 'gouveia32@gmail.com', '79988015232', '', '', '', 'Aracaju', 'SE', '49050-566', 'M', -275586000, 168, 73.0, '', 1651586698, 1655049801, 6, 1),
	(4, 'Cláudio da Silva', '', '88787897979', '', '', '', '', '--', '', NULL, 0, 0, 0.0, '', 1651882627, 1651882627, 6, 1),
	(5, 'Joaquina da Silva', '', '', '', '', '', '', '--', '', NULL, 0, 0, 0.0, '', 1653255332, 1653255332, 2, 1),
	(6, 'Luiz Gonzaga Jr', '', '', '', '', '', '', '--', '', NULL, 0, 165, 72.0, '', 1653345447, 1653346856, 8, 1),
	(7, 'Maria de Jesus Campos', '', '', '', '', '', '', 'SE', '', NULL, 0, 100, 25.0, '', 1653749758, 1653749758, 5, 1);
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.set_code
CREATE TABLE IF NOT EXISTS `set_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '0' COMMENT '状态码',
  `desc` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Observação',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de agrupamento de ambiente\r\n\r\n';

-- Copiando dados para a tabela pront-med.set_code: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `set_code` DISABLE KEYS */;
INSERT INTO `set_code` (`id`, `code`, `desc`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, '200', 'sucesso', 'solicitação bem-sucedida', 1, 0, 0, 1506328003, 1506328037),
	(2, '300', 'erro de retorno', 'Falha na solicitação', 1, 0, 0, 1506328023, 1506328023),
	(3, '302', 'solicitação bem-sucedida', 'erro', 0, 0, 0, 1506328070, 1506334951);
/*!40000 ALTER TABLE `set_code` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.set_env
CREATE TABLE IF NOT EXISTS `set_env` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `env_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'Nome',
  `env_host` varchar(255) NOT NULL DEFAULT '0' COMMENT '环境host',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Observação',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_env_name` (`env_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de agrupamento de ambiente\r\n\r\n';

-- Copiando dados para a tabela pront-med.set_env: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `set_env` DISABLE KEYS */;
INSERT INTO `set_env` (`id`, `env_name`, `env_host`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 'endereço de teste', 'http://test.haodaquan.com', 'endereço de teste', 1, 0, 1, 1506316614, 1516283029),
	(2, 'Endereço de teste 3', 'http://127.0.0.1:8083', 'Endereço de teste 3', 0, 0, 0, 1506316696, 1506316850),
	(3, 'Ambiente formal', 'http://api.haodaquan.com', 'Este também é um teste', 1, 1, 1, 1515140110, 1516281840);
/*!40000 ALTER TABLE `set_env` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.set_group
CREATE TABLE IF NOT EXISTS `set_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '组名',
  `detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '说明',
  `env_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '环境ID，1,2',
  `code_ids` varchar(200) NOT NULL COMMENT '状态码id 1,2',
  `api_public_ids` varchar(200) NOT NULL COMMENT '公共文档ids 1,2',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态：1-正常，0-excluir',
  `create_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `update_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_create_id` (`create_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela pront-med.set_group: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `set_group` DISABLE KEYS */;
INSERT INTO `set_group` (`id`, `group_name`, `detail`, `env_ids`, `code_ids`, `api_public_ids`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 'Prontuário', 'Aqui você gerencia os protuários dos pacientes', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237536, 1516283091),
	(2, 'Agenda', 'Controle os Agendamentos dos pacientes', '1,3', '1,2', '1,2,3', 1, 0, 1, 1506237621, 1516283080),
	(3, 'Relatórios', 'Acompanhe as estatísticas de atendimentos', '1,3', '1,2', '1,2,3', 1, 1, 1, 1516281298, 1516371024);
/*!40000 ALTER TABLE `set_group` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.set_template
CREATE TABLE IF NOT EXISTS `set_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '模板ID',
  `detail` text NOT NULL COMMENT '详情',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态，1-正常，0-excluir',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  PRIMARY KEY (`id`),
  KEY `idx_main_id` (`template_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de modelos de API';

-- Copiando dados para a tabela pront-med.set_template: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `set_template` DISABLE KEYS */;
INSERT INTO `set_template` (`id`, `template_name`, `detail`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 'Modelo Geral', '#### Resumo:\n\n- login:\n#### cabeçalho:\n\n|Nome do parâmetro|Requerido|Tipo|Descrição|\n|:----    |:---|:----- |-----   |\n|Content-Type |Sim  |string |Tipo de solicitação: application/json   |\n|Content-MD5 |Sim  |string | Solicitar assinatura de conteúdo    |\n\n\n#### parâmetros de solicitação:\n\n|Nome do parâmetro|Obrigatório|Tipo|Descrição|Exemplo de valor\n|:----    |:---|:----- |-----   |-----   |\n|username |Sim  |string |nome do usuário   | george518\n|password |sim  |string | senha    | gouveia\n\n#### parâmetro de retorno:\n\n|nome do parâmetro|tipo|descrição|\n|:-----  |:-----|-----                           |\n|group_level |int   |ID do grupo de usuários, 1: superadministrador; 2: usuário comum|\n\n#### Exemplo de retorno:\n\n**Retorna quando correto:**\n\n```\n{\n"status": 200,\n"message": "Success",\n"data": {\n    "uid": "1",\n    "account": "admin",\n    "nickname": "Minho",\n    "group_level": 0 ,\n    "create_time": "1436864169",\n    "last_login_time": "0",\n}\n}\n```\n\n**retorno com erro:**\n\n\n```\n{\n"status": 300,\n"message": "invalid username"\n"data":{\n    \n}\n}\n```\n\n#### exemplo de chamada:\n\n```\n\n<?php\n    echo "Hello world";\n```\n#### Observação:\n\n- Para obter mais códigos de erro de retorno, consulte a descrição do código de erro na página inicial\n\n#### Versão da interface:\n\n|Número da versão|Desenvolvedor|Data do desenvolvimento|Data da revisão|\n|:----    |:---|:----- |-----   |\n|2.1.0 |Jag  |2018-01-15 |  2018-01-15 |', 1, 1, 1, 1516085341, 1655404456),
	(2, 'Receita', '#### Receita\n\n###### paciente: {{.paciente}}\n------------', 1, 1, 1, 1655404685, 1655405365);
/*!40000 ALTER TABLE `set_template` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.uc_admin
CREATE TABLE IF NOT EXISTS `uc_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `login_name` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `real_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'nome real',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '角色id字符串，如：2,3,4',
  `phone` varchar(20) NOT NULL DEFAULT '0' COMMENT 'número do celular',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `salt` char(10) NOT NULL DEFAULT '' COMMENT '密码盐',
  `last_login` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` char(15) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，1-正常 0禁用',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar者ID',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tempo de criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_name` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de administrador';

-- Copiando dados para a tabela pront-med.uc_admin: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `uc_admin` DISABLE KEYS */;
INSERT INTO `uc_admin` (`id`, `login_name`, `real_name`, `password`, `role_ids`, `phone`, `email`, `salt`, `last_login`, `last_ip`, `status`, `create_id`, `update_id`, `create_time`, `update_time`) VALUES
	(1, 'admin', 'ADM', 'f5c0e12896495f2bc8c73ddcf67c70a7', '0', '988015232', 'adm@pf.com', 'wqbi', 1655477555, '127.0.0.1', 1, 0, 1, 0, 1651578559),
	(2, 'gouveia', 'José', 'f5c0e12896495f2bc8c73ddcf67c70a7', '1', '988015232', 'gouveia32@gmail.com', 'wqbi', 1651770905, '[::1]', 1, 0, 2, 0, 1651532455);
/*!40000 ALTER TABLE `uc_admin` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.uc_auth
CREATE TABLE IF NOT EXISTS `uc_auth` (
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
  `create_time` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'hora da criação',
  `update_time` int(11) unsigned NOT NULL DEFAULT '1' COMMENT 'hora da alteração',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=951 DEFAULT CHARSET=utf8mb4 COMMENT='Fator de autoridade';

-- Copiando dados para a tabela pront-med.uc_auth: ~71 rows (aproximadamente)
/*!40000 ALTER TABLE `uc_auth` DISABLE KEYS */;
INSERT INTO `uc_auth` (`id`, `pid`, `auth_name`, `auth_url`, `sort`, `icon`, `is_show`, `user_id`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES
	(1, 0, 'Todas', '/', 1, '', 0, 1, 1, 1, 1, 1505620970, 1505620970),
	(10, 1, 'Início', '/', 1, 'fa-newspaper-o', 1, 0, 0, 0, 1, 1, 1),
	(20, 1, 'Agenda', '/', 2, 'fa-calendar', 1, 0, 0, 0, 1, 1, 1),
	(30, 1, 'Cadastro', '/', 3, 'fa-object-ungroup', 1, 0, 0, 0, 1, 1, 1),
	(40, 1, 'Configurar', '/', 4, 'fa-cog', 1, 0, 0, 0, 1, 1, 1),
	(41, 40, 'Perfil do Usuário', '/user/edit', 999, 'fa-edit', 1, 0, 0, 0, 1, 1, 1),
	(50, 0, 'importar Receita', '/import/receita', 999, 'ja', 0, 0, 0, 0, 1, 1, 1),
	(101, 10, 'Atendimento', '/atendimento/list', 999, 'fa-handshake-o ', 1, 0, 0, 0, 1, 1, 1),
	(102, 101, 'Novo Atend', '/atendimento/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(103, 101, 'Altera Atend', '/atendimento/atendimento', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(104, 101, 'Get Node', '/atendimento/getnode', 999, 'fa', 1, 0, 0, 0, 1, 1, 1),
	(105, 101, 'Adic Paciente', '/atendimento/addpaciente', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(106, 101, 'Alt Paciente', '/atendimento/editpaciente', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(301, 30, 'Paciente', '/paciente/list', 999, 'fa-address-card-o', 1, 0, 0, 0, 1, 1, 1),
	(302, 301, 'Novo Paciente', '/paciente/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(303, 301, 'Altera Paciente', '/paciente/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(304, 30, 'Usuário', '/admin/list', 999, 'fa-user', 1, 0, 0, 0, 1, 1, 1),
	(305, 304, 'Novo Usuário', '/admin/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(306, 304, 'Alterar Usuário', '/admin/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(307, 30, 'Cor', '/cor/list', 999, 'fa-paint-brush ', 1, 0, 0, 0, 1, 1, 1),
	(308, 307, 'Nova Cor', '/cor/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(309, 307, 'Alterar Cor', '/cor/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(310, 30, 'Etiqueta', '/etiqueta/list', 999, 'fa-tag', 1, 0, 0, 0, 1, 1, 1),
	(311, 310, 'Nova Etiqueta', '/etiqueta/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(312, 310, 'Alterar Etiqueta', '/etiqueta/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(501, 40, 'Permissões', '/auth/list', 999, 'fa-check', 1, 0, 0, 0, 1, 1, 1),
	(502, 501, 'Nova Permissão', '/auth/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(503, 501, 'Alterar Permissão', '/auth/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(601, 0, 'Imprimir Nota', '/print/nota', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(602, 0, 'Imprimir Atendimento', '/print/atendimento', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(701, 30, 'Modelo', '/modelo/list', 999, 'fa', 1, 0, 0, 0, 1, 1, 1),
	(702, 30, 'Novo Modelo', '/modelo/add', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(703, 0, 'Alterar Modelo', '/modelo/edit', 999, 'fa', 0, 0, 0, 0, 1, 1, 1),
	(904, 2, 'Ger.Regras', '/role/list', 2, 'fa-user-circle-o', 0, 1, 0, 1, 1, 0, 1505621852),
	(907, 3, 'excluir', '/admin/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621756, 1505621756),
	(908, 4, 'novo', '/role/add', 1, '', 1, 1, 0, 1, 1, 0, 1505698716),
	(909, 4, 'alterar', '/role/edit', 2, '', 0, 1, 1, 1, 1, 1505621912, 1505621912),
	(910, 4, 'excluir', '/role/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505621951, 1505621951),
	(914, 11, 'excluir', '/auth/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1505622111, 1505622111),
	(916, 1, 'Ger. da API', '/', 1, 'fa-cubes', 0, 0, 0, 0, 1, 0, 1506125698),
	(917, 16, 'API', '/api/list', 1, 'fa-link', 0, 1, 1, 1, 1, 1505622447, 1505622447),
	(919, 20, 'documentação pública', '/apipublic/list', 3, 'fa-files-o', 0, 1, 0, 1, 1, 0, 1516155852),
	(920, 1, 'Conf Básica', '/', 2, 'fa-cogs', 0, 1, 1, 1, 1, 1505622601, 1505622601),
	(921, 20, 'Conf de Grupo', '/group/list', 1, 'fa-object-ungroup', 0, 1, 1, 1, 1, 1505622645, 1505622645),
	(922, 20, 'Conf de Ambiente', '/env/list', 2, 'fa-tree', 0, 1, 1, 1, 1, 1505622681, 1505622681),
	(923, 20, 'Conf de Código', '/code/list', 3, 'fa-code', 0, 1, 1, 1, 1, 1505622728, 1505622728),
	(924, 15, 'Alterar Usu', '/user/edit', 1, 'fa-edit', 1, 1, 0, 1, 1, 0, 1506057468),
	(925, 21, 'novo', '/group/add', 1, 'n', 0, 1, 0, 1, 1, 0, 1513324170),
	(926, 21, 'alterar', '/group/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506237920, 1506237920),
	(927, 21, 'excluir', '/group/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506237948, 1506237948),
	(928, 22, 'novo', '/env/add', 1, 'fa', 0, 0, 0, 0, 1, 1506316506, 1506316506),
	(929, 22, 'alterar', '/env/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506316532, 1506316532),
	(930, 22, 'excluir', '/env/ajaxdel', 3, 'fa', 0, 0, 0, 0, 1, 1506316567, 1506316567),
	(931, 23, 'novo', '/code/add', 1, 'fa', 0, 0, 0, 0, 1, 1506327812, 1506327812),
	(932, 23, 'alterar', '/code/edit', 2, 'fa', 0, 0, 0, 0, 1, 1506327831, 1506327831),
	(933, 23, 'excluir', '/code/ajadel', 3, 'fa', 0, 0, 0, 0, 1, 1506327857, 1506327857),
	(934, 17, 'novo', '/api/add', 1, 'fa-link', 0, 1, 0, 1, 1, 0, 1515984869),
	(935, 17, 'alterar', '/api/edit', 2, 'fa-link', 0, 1, 0, 1, 1, 0, 1515984880),
	(936, 17, 'excluir', '/api/ajaxdel', 3, 'fa-link', 1, 1, 0, 1, 1, 0, 1515984893),
	(937, 17, 'detalhes', '/api/detail', 4, '', 0, 1, 0, 1, 1, 0, 1515984908),
	(938, 17, 'altera', '/api/ajaxchangestatus', 5, '', 0, 1, 0, 1, 1, 0, 1516000160),
	(939, 16, 'Recursos da API', '/apisource/list', 1, 'fa-skyatlas', 0, 1, 0, 1, 1, 0, 1515984925),
	(940, 39, 'novo', '/apisource/add', 1, '', 0, 1, 0, 1, 1, 0, 1515905034),
	(941, 39, 'alterar', '/apisource/edit', 2, '', 0, 1, 0, 1, 1, 0, 1515905044),
	(942, 39, 'excluir', '/apisource/ajaxdel', 3, '', 0, 1, 0, 1, 1, 0, 1515905055),
	(943, 17, 'auditar', '/api/audit', 6, '', 0, 1, 1, 1, 1, 1516000189, 1516000189),
	(944, 19, 'novo', '/apipublic/add', 1, '', 0, 1, 1, 1, 1, 1516067809, 1516067809),
	(945, 19, 'alterar', '/apipublic/edit', 2, '', 0, 1, 1, 1, 1, 1516067841, 1516067841),
	(946, 19, 'excluir', '/apipublic/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516067881, 1516067881),
	(947, 20, 'Conf. Modelo', '/template/list', 4, 'fa-file-text', 0, 1, 1, 1, 1, 1516083233, 1516083233),
	(948, 47, 'novo', '/template/add', 1, '', 0, 1, 1, 1, 1, 1516083262, 1516083262),
	(949, 47, 'alterar', '/template/edit', 2, '', 0, 1, 1, 1, 1, 1516083296, 1516083296),
	(950, 47, 'excluir', '/template/ajaxdel', 3, '', 0, 1, 1, 1, 1, 1516083335, 1516083335);
/*!40000 ALTER TABLE `uc_auth` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.uc_role
CREATE TABLE IF NOT EXISTS `uc_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Nome da regra',
  `detail` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Observação',
  `create_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `update_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态1-正常，0-excluir',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'alterar',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tabela de Regras';

-- Copiando dados para a tabela pront-med.uc_role: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `uc_role` DISABLE KEYS */;
INSERT INTO `uc_role` (`id`, `role_name`, `detail`, `create_id`, `update_id`, `status`, `create_time`, `update_time`) VALUES
	(1, 'Adim do sistema', 'Tem todas as permissões', 0, 2, 1, 1505874156, 1505874156),
	(2, 'Usuário', 'Permissões para uso normal', 0, 0, 1, 1506124114, 1506124114);
/*!40000 ALTER TABLE `uc_role` ENABLE KEYS */;

-- Copiando estrutura para tabela pront-med.uc_role_auth
CREATE TABLE IF NOT EXISTS `uc_role_auth` (
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限ID',
  PRIMARY KEY (`role_id`,`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tabela de relacionamento de permissão e função';

-- Copiando dados para a tabela pront-med.uc_role_auth: ~13 rows (aproximadamente)
/*!40000 ALTER TABLE `uc_role_auth` DISABLE KEYS */;
INSERT INTO `uc_role_auth` (`role_id`, `auth_id`) VALUES
	(1, 10),
	(1, 20),
	(1, 40),
	(1, 41),
	(1, 101),
	(1, 102),
	(2, 10),
	(2, 20),
	(2, 30),
	(2, 31),
	(2, 32),
	(2, 33),
	(2, 34);
/*!40000 ALTER TABLE `uc_role_auth` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
