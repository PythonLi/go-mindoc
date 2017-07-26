-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: mindoc_db
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `md_attachment`
--

DROP TABLE IF EXISTS `md_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_attachment` (
  `attachment_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL DEFAULT '0',
  `document_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_path` varchar(2000) NOT NULL DEFAULT '',
  `file_size` double NOT NULL DEFAULT '0',
  `http_path` varchar(2000) NOT NULL DEFAULT '',
  `file_ext` varchar(50) NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `create_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_attachment`
--

LOCK TABLES `md_attachment` WRITE;
/*!40000 ALTER TABLE `md_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `md_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_books`
--

DROP TABLE IF EXISTS `md_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_books` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(500) NOT NULL DEFAULT '',
  `identify` varchar(100) NOT NULL DEFAULT '',
  `order_index` int(11) NOT NULL DEFAULT '0',
  `description` varchar(2000) NOT NULL DEFAULT '',
  `label` varchar(500) NOT NULL DEFAULT '',
  `privately_owned` int(11) NOT NULL DEFAULT '0',
  `private_token` varchar(500) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(50) NOT NULL DEFAULT '',
  `doc_count` int(11) NOT NULL DEFAULT '0',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  `cover` varchar(1000) NOT NULL DEFAULT '',
  `theme` varchar(255) NOT NULL DEFAULT 'default',
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `modify_time` datetime DEFAULT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `identify` (`identify`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_books`
--

LOCK TABLES `md_books` WRITE;
/*!40000 ALTER TABLE `md_books` DISABLE KEYS */;
INSERT INTO `md_books` VALUES (1,'大数据组技术文档','mindoc',0,'拟作为技术文档编辑使用。','技术文档',0,'',0,'markdown',2,'closed',0,'/static/images/jianke.jpg','default','2017-07-23 21:11:01',1,'2017-07-25 14:21:00',1500815460);
/*!40000 ALTER TABLE `md_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_document_history`
--

DROP TABLE IF EXISTS `md_document_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_document_history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(255) NOT NULL DEFAULT '',
  `action_name` varchar(255) NOT NULL DEFAULT '',
  `document_id` int(11) NOT NULL DEFAULT '0',
  `document_name` varchar(500) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `markdown` longtext,
  `content` longtext,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `modify_time` datetime NOT NULL,
  `modify_at` int(11) NOT NULL DEFAULT '0',
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`history_id`),
  KEY `md_document_history_document_id` (`document_id`),
  KEY `md_document_history_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_document_history`
--

LOCK TABLES `md_document_history` WRITE;
/*!40000 ALTER TABLE `md_document_history` DISABLE KEYS */;
INSERT INTO `md_document_history` VALUES (1,'modify','修改文档',1,'空白文档',0,'','',1,'2017-07-23 21:15:59',1,1500815759),(2,'modify','修改文档',1,'空白文档',0,'测试','<p>测试</p>\n',1,'2017-07-23 21:28:39',1,1500816519),(3,'modify','修改文档',3,'API测试文档',1,'','',1,'2017-07-23 21:29:27',1,1500816567),(4,'modify','修改文档',3,'API测试文档',1,'## v3/user/get_info\n\nWhat\'s New?\n2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。\n1 功能说明\n获取登录用户的信息，包括昵称、头像、性别等信息。\n本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。\n例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 \n\n注意：\n1. 本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。\n如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。\n目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 \n2. 本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。\n2 接口调用说明\n2.1	URL\nhttp://[域名]/v3/user/get_info \n\n正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。\n2.2	格式\njson\n2.3	HTTP请求方式\nGET, POST\n2.4	IP限制\nTRUE\n2.5	输入参数说明\n各个参数请进行URL 编码，编码时请遵守 RFC 1738\n（1）公共参数\n发送请求时必须传入公共参数，详见公共参数说明。\n（2）私有参数\n|   参数名称|是否必须   |类型   |  描述 |\n| :------------ | :------------ | :------------ | :------------ |\n| charset	  |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。\n默认值为utf-8，其他非法取值也认为是utf-8。  |\n| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：\n1：需要获取游戏昵称和性别；\n2：需要获取蓝钻等级；\n3：需要获取昵称和蓝钻等级；\n4：需要获取照片秀标志。|','<h2 id=\"h2-v3-user-get_info\"><a name=\"v3/user/get_info\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>v3/user/get_info</h2><p>What’s New?<br>2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。<br>1 功能说明<br>获取登录用户的信息，包括昵称、头像、性别等信息。<br>本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。<br>例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 </p>\n<p>注意：</p>\n<ol>\n<li>本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。<br>如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。<br>目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 </li><li>本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。<br>2 接口调用说明<br>2.1    URL<br><a href=\"http://[域名]/v3/user/get_info\">http://[域名]/v3/user/get_info</a> </li></ol>\n<p>正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。<br>2.2    格式<br>json<br>2.3    HTTP请求方式<br>GET, POST<br>2.4    IP限制<br>TRUE<br>2.5    输入参数说明<br>各个参数请进行URL 编码，编码时请遵守 RFC 1738<br>（1）公共参数<br>发送请求时必须传入公共参数，详见公共参数说明。<br>（2）私有参数<br>|   参数名称|是否必须   |类型   |  描述 |<br>| :—————— | :—————— | :—————— | :—————— |<br>| charset      |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。<br>默认值为utf-8，其他非法取值也认为是utf-8。  |<br>| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：<br>1：需要获取游戏昵称和性别；<br>2：需要获取蓝钻等级；<br>3：需要获取昵称和蓝钻等级；<br>4：需要获取照片秀标志。|</p>\n',1,'2017-07-23 21:33:57',1,1500816837),(5,'modify','修改文档',1,'Api 文档列表',0,'## v3/user/get_info\n\nWhat\'s New?\n2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。\n1 功能说明\n获取登录用户的信息，包括昵称、头像、性别等信息。\n本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。\n例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 \n\n注意：\n1. 本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。\n如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。\n目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 \n2. 本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。\n2 接口调用说明\n2.1	URL\nhttp://[域名]/v3/user/get_info \n\n正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。\n2.2	格式\njson\n2.3	HTTP请求方式\nGET, POST\n2.4	IP限制\nTRUE\n2.5	输入参数说明\n各个参数请进行URL 编码，编码时请遵守 RFC 1738\n（1）公共参数\n发送请求时必须传入公共参数，详见公共参数说明。\n（2）私有参数\n|   参数名称|是否必须   |类型   |  描述 |\n| :------------ | :------------ | :------------ | :------------ |\n| charset	  |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。\n默认值为utf-8，其他非法取值也认为是utf-8。  |\n| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：\n1：需要获取游戏昵称和性别；\n2：需要获取蓝钻等级；\n3：需要获取昵称和蓝钻等级；\n4：需要获取照片秀标志。|','<h2 id=\"h2-v3-user-get_info\"><a name=\"v3/user/get_info\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>v3/user/get_info</h2><p>What’s New?<br>2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。<br>1 功能说明<br>获取登录用户的信息，包括昵称、头像、性别等信息。<br>本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。<br>例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 </p>\n<p>注意：</p>\n<ol>\n<li>本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。<br>如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。<br>目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 </li><li>本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。<br>2 接口调用说明<br>2.1    URL<br><a href=\"http://[域名]/v3/user/get_info\">http://[域名]/v3/user/get_info</a> </li></ol>\n<p>正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。<br>2.2    格式<br>json<br>2.3    HTTP请求方式<br>GET, POST<br>2.4    IP限制<br>TRUE<br>2.5    输入参数说明<br>各个参数请进行URL 编码，编码时请遵守 RFC 1738<br>（1）公共参数<br>发送请求时必须传入公共参数，详见公共参数说明。<br>（2）私有参数<br>|   参数名称|是否必须   |类型   |  描述 |<br>| :—————— | :—————— | :—————— | :—————— |<br>| charset      |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。<br>默认值为utf-8，其他非法取值也认为是utf-8。  |<br>| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：<br>1：需要获取游戏昵称和性别；<br>2：需要获取蓝钻等级；<br>3：需要获取昵称和蓝钻等级；<br>4：需要获取照片秀标志。|</p>\n',1,'2017-07-23 21:38:25',1,1500817104),(6,'modify','修改文档',3,'API测试文档',1,'## v3/user/get_info\n\nWhat\'s New?\n2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。\n1 功能说明\n获取登录用户的信息，包括昵称、头像、性别等信息。\n本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。\n例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 \n\n注意：\n1. 本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。\n如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。\n目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 \n2. 本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。\n2 接口调用说明\n2.1	URL\nhttp://[域名]/v3/user/get_info \n\n正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。\n2.2	格式\njson\n2.3	HTTP请求方式\nGET, POST\n2.4	IP限制\nTRUE\n2.5	输入参数说明\n各个参数请进行URL 编码，编码时请遵守 RFC 1738\n（1）公共参数\n发送请求时必须传入公共参数，详见公共参数说明。\n（2）私有参数\n|   参数名称|是否必须   |类型   |  描述 |\n| :------------ | :------------ | :------------ | :------------ |\n| charset	  |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。\n默认值为utf-8，其他非法取值也认为是utf-8。  |\n| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：\n1：需要获取游戏昵称和性别；\n2：需要获取蓝钻等级；\n3：需要获取昵称和蓝钻等级；\n4：需要获取照片秀标志。|\n\n2.6	请求示例\n```json\nhttp://openapi.tencentyun.com/v3/user/get_info?\nopenid=B624064BA065E01CB73F835017FE96FA&\nopenkey=5F154D7D2751AEDC8527269006F290F70297B7E54667536C&\nappid=2&\nsig=VrN%2BTn5J%2Fg4IIo0egUdxq6%2B0otk%3D&\npf=qzone&\nformat=json&\nuserip=112.90.139.30\n```','<h2 id=\"h2-v3-user-get_info\"><a name=\"v3/user/get_info\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>v3/user/get_info</h2><p>What’s New?<br>2012年12月07日，本接口新增返回参数“is_yellow_high_vip”，用于判断用户是否为豪华版黄钻用户。<br>1 功能说明<br>获取登录用户的信息，包括昵称、头像、性别等信息。<br>本接口是全平台通用的，即发送请求后，可根据请求中传入的“pf”平台参数返回对应平台的用户信息，详见返回字段说明。<br>例如：如果传入的pf为qzone，则返回的是其QQ空间的昵称和头像。 </p>\n<p>注意：</p>\n<ol>\n<li>本接口返回的各种VIP（例如黄钻等）信息是经过缓存的，有一定的延时。<br>如果需要VIP信息特别准确的场景（例如黄钻每日礼包场景中，非黄钻用户开通黄钻后，返回应用应该立即可领取礼包），请调用专门的VIP实时信息获取接口。<br>目前为黄钻提供专门的黄钻实时信息获取接口：v3/user/is_vip，其它VIP实时信息获取接口为：v3/user/total_vip_info。 </li><li>本接口只返回用户基本个人资料。对于其它更丰富的用户个人资料，出于保护用户隐私的考虑，目前尚不开放。<br>2 接口调用说明<br>2.1    URL<br><a href=\"http://[域名]/v3/user/get_info\">http://[域名]/v3/user/get_info</a> </li></ol>\n<p>正式环境域名或测试环境IP详见：API3.0文档#请求URL说明。<br>2.2    格式<br>json<br>2.3    HTTP请求方式<br>GET, POST<br>2.4    IP限制<br>TRUE<br>2.5    输入参数说明<br>各个参数请进行URL 编码，编码时请遵守 RFC 1738<br>（1）公共参数<br>发送请求时必须传入公共参数，详见公共参数说明。<br>（2）私有参数<br>|   参数名称|是否必须   |类型   |  描述 |<br>| :—————— | :—————— | :—————— | :—————— |<br>| charset      |   |  string | 指定请求及响应的字符集，取值为gbk或utf-8（只有pf=qqgame或pf=3366时，可以输入该参数）。<br>默认值为utf-8，其他非法取值也认为是utf-8。  |<br>| flag  |   |  unsigned int |   pf=qqgame时，必须输入该参数，指定需要获取QQGame中的哪些信息：<br>1：需要获取游戏昵称和性别；<br>2：需要获取蓝钻等级；<br>3：需要获取昵称和蓝钻等级；<br>4：需要获取照片秀标志。|</p>\n<p>2.6    请求示例</p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code class=\"lang-json\"><span class=\"pln\">http</span><span class=\"pun\">://</span><span class=\"pln\">openapi</span><span class=\"pun\">.</span><span class=\"pln\">tencentyun</span><span class=\"pun\">.</span><span class=\"pln\">com</span><span class=\"pun\">/</span><span class=\"pln\">v3</span><span class=\"pun\">/</span><span class=\"pln\">user</span><span class=\"pun\">/</span><span class=\"pln\">get_info</span><span class=\"pun\">?</span></code></li><li class=\"L1\"><code class=\"lang-json\"><span class=\"pln\">openid</span><span class=\"pun\">=</span><span class=\"pln\">B624064BA065E01CB73F835017FE96FA</span><span class=\"pun\">&amp;</span></code></li><li class=\"L2\"><code class=\"lang-json\"><span class=\"pln\">openkey</span><span class=\"pun\">=</span><span class=\"lit\">5F154D7D2751AEDC8527269006F290F70297B7E54667536C</span><span class=\"pun\">&amp;</span></code></li><li class=\"L3\"><code class=\"lang-json\"><span class=\"pln\">appid</span><span class=\"pun\">=</span><span class=\"lit\">2</span><span class=\"pun\">&amp;</span></code></li><li class=\"L4\"><code class=\"lang-json\"><span class=\"pln\">sig</span><span class=\"pun\">=</span><span class=\"typ\">VrN</span><span class=\"pun\">%</span><span class=\"lit\">2BTn5J</span><span class=\"pun\">%</span><span class=\"lit\">2Fg4IIo0egUdxq6</span><span class=\"pun\">%</span><span class=\"lit\">2B0otk</span><span class=\"pun\">%</span><span class=\"lit\">3D</span><span class=\"pun\">&amp;</span></code></li><li class=\"L5\"><code class=\"lang-json\"><span class=\"pln\">pf</span><span class=\"pun\">=</span><span class=\"pln\">qzone</span><span class=\"pun\">&amp;</span></code></li><li class=\"L6\"><code class=\"lang-json\"><span class=\"pln\">format</span><span class=\"pun\">=</span><span class=\"pln\">json</span><span class=\"pun\">&amp;</span></code></li><li class=\"L7\"><code class=\"lang-json\"><span class=\"pln\">userip</span><span class=\"pun\">=</span><span class=\"lit\">112.90</span><span class=\"pun\">.</span><span class=\"lit\">139.30</span></code></li></ol></pre>\n',1,'2017-07-23 21:44:03',1,1500817443),(7,'modify','修改文档',3,'API测试文档',1,'#### 简要描述：\n\n- 用户登录接口\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |秦亮  |2017-03-20 |  xxxx-xx-xx |\n\n#### 请求URL:\n\n- http://xx.com/api/login\n\n#### 请求方式：\n\n- GET\n- POST\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|username |是  |string |用户名   |\n|password |是  |string | 密码    |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n    \"errcode\": 0,\n    \"data\": {\n        \"uid\": \"1\",\n        \"account\": \"admin\",\n        \"nickname\": \"Minho\",\n        \"group_level\": 0 ,\n        \"create_time\": \"1436864169\",\n        \"last_login_time\": \"0\",\n    }\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n    \"errcode\": 500,\n    \"errmsg\": \"invalid appid\"\n}\n```\n\n#### 返回参数说明:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述','<h4 id=\"h4--\"><a name=\"简要描述：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>简要描述：</h4><ul>\n<li>用户登录接口</li></ul>\n<h4 id=\"h4--\"><a name=\"接口版本：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>接口版本：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">版本号</th>\n<th style=\"text-align:left\">制定人</th>\n<th style=\"text-align:left\">制定日期</th>\n<th>修订日期</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">2.1.0</td>\n<td style=\"text-align:left\">秦亮</td>\n<td style=\"text-align:left\">2017-03-20</td>\n<td>xxxx-xx-xx</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--url-\"><a name=\"请求URL:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求URL:</h4><ul>\n<li><a href=\"http://xx.com/api/login\">http://xx.com/api/login</a></li></ul>\n<h4 id=\"h4--\"><a name=\"请求方式：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求方式：</h4><ul>\n<li>GET</li><li>POST</li></ul>\n<h4 id=\"h4--\"><a name=\"请求头：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求头：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">Content-Type</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求类型： application/json</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">Content-MD5</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求内容签名</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"请求参数:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求参数:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">username</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>用户名</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">password</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>密码</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"返回示例:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回示例:</h4><p><strong>正确时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"errcode\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"data\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L3\"><code><span class=\"pln\">        </span><span class=\"str\">\"uid\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"1\"</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">        </span><span class=\"str\">\"account\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"admin\"</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">        </span><span class=\"str\">\"nickname\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"Minho\"</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">        </span><span class=\"str\">\"group_level\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pln\"> </span><span class=\"pun\">,</span></code></li><li class=\"L7\"><code><span class=\"pln\">        </span><span class=\"str\">\"create_time\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"1436864169\"</span><span class=\"pun\">,</span></code></li><li class=\"L8\"><code><span class=\"pln\">        </span><span class=\"str\">\"last_login_time\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"0\"</span><span class=\"pun\">,</span></code></li><li class=\"L9\"><code><span class=\"pln\">    </span><span class=\"pun\">}</span></code></li><li class=\"L0\"><code><span class=\"pun\">}</span></code></li></ol></pre><p><strong>错误时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"errcode\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">500</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"errmsg\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"invalid appid\"</span></code></li><li class=\"L3\"><code><span class=\"pun\">}</span></code></li></ol></pre><h4 id=\"h4--\"><a name=\"返回参数说明:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回参数说明:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">group_level</td>\n<td style=\"text-align:left\">int</td>\n<td>用户组id，1：超级管理员；2：普通用户</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"备注:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>备注:</h4><ul>\n<li>更多返回错误代码请看首页的错误代码描述</li></ul>\n',1,'2017-07-23 22:44:15',1,1500821055),(8,'modify','修改文档',3,'订单操作日志按日读取接口',1,'#### 简要描述：\n\n- 用户登录接口\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|2.1.0 |lili  |2017-07-20 |  xxxx-xx-xx |\n\n#### 请求URL:\n\n- http://xx.com/api/login\n\n#### 请求方式：\n\n- GET\n- POST\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json   |\n|Content-MD5 |是  |string | 请求内容签名    |\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|username |是  |string |用户名   |\n|password |是  |string | 密码    |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n    \"errcode\": 0,\n    \"data\": {\n        \"uid\": \"1\",\n        \"account\": \"admin\",\n        \"nickname\": \"Minho\",\n        \"group_level\": 0 ,\n        \"create_time\": \"1436864169\",\n        \"last_login_time\": \"0\",\n    }\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n    \"errcode\": 500,\n    \"errmsg\": \"invalid appid\"\n}\n```\n\n#### 返回参数说明:\n\n|参数名|类型|说明|\n|:-----  |:-----|-----                           |\n|group_level |int   |用户组id，1：超级管理员；2：普通用户  |\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述','<h4 id=\"h4--\"><a name=\"简要描述：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>简要描述：</h4><ul>\n<li>用户登录接口</li></ul>\n<h4 id=\"h4--\"><a name=\"接口版本：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>接口版本：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">版本号</th>\n<th style=\"text-align:left\">制定人</th>\n<th style=\"text-align:left\">制定日期</th>\n<th>修订日期</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">2.1.0</td>\n<td style=\"text-align:left\">lili</td>\n<td style=\"text-align:left\">2017-07-20</td>\n<td>xxxx-xx-xx</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--url-\"><a name=\"请求URL:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求URL:</h4><ul>\n<li><a href=\"http://xx.com/api/login\">http://xx.com/api/login</a></li></ul>\n<h4 id=\"h4--\"><a name=\"请求方式：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求方式：</h4><ul>\n<li>GET</li><li>POST</li></ul>\n<h4 id=\"h4--\"><a name=\"请求头：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求头：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">Content-Type</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求类型： application/json</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">Content-MD5</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求内容签名</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"请求参数:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求参数:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">username</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>用户名</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">password</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>密码</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"返回示例:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回示例:</h4><p><strong>正确时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"errcode\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"data\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"pun\">{</span></code></li><li class=\"L3\"><code><span class=\"pln\">        </span><span class=\"str\">\"uid\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"1\"</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">        </span><span class=\"str\">\"account\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"admin\"</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">        </span><span class=\"str\">\"nickname\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"Minho\"</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">        </span><span class=\"str\">\"group_level\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pln\"> </span><span class=\"pun\">,</span></code></li><li class=\"L7\"><code><span class=\"pln\">        </span><span class=\"str\">\"create_time\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"1436864169\"</span><span class=\"pun\">,</span></code></li><li class=\"L8\"><code><span class=\"pln\">        </span><span class=\"str\">\"last_login_time\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"0\"</span><span class=\"pun\">,</span></code></li><li class=\"L9\"><code><span class=\"pln\">    </span><span class=\"pun\">}</span></code></li><li class=\"L0\"><code><span class=\"pun\">}</span></code></li></ol></pre><p><strong>错误时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"errcode\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">500</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"errmsg\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"invalid appid\"</span></code></li><li class=\"L3\"><code><span class=\"pun\">}</span></code></li></ol></pre><h4 id=\"h4--\"><a name=\"返回参数说明:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回参数说明:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">group_level</td>\n<td style=\"text-align:left\">int</td>\n<td>用户组id，1：超级管理员；2：普通用户</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"备注:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>备注:</h4><ul>\n<li>更多返回错误代码请看首页的错误代码描述</li></ul>\n',1,'2017-07-25 17:18:13',1,1500974293);
/*!40000 ALTER TABLE `md_document_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_documents`
--

DROP TABLE IF EXISTS `md_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_documents` (
  `document_id` int(11) NOT NULL AUTO_INCREMENT,
  `document_name` varchar(500) NOT NULL DEFAULT '',
  `identify` varchar(100) DEFAULT 'null',
  `book_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order_sort` int(11) NOT NULL DEFAULT '0',
  `markdown` longtext,
  `release` longtext,
  `content` longtext,
  `create_time` datetime NOT NULL,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `modify_time` datetime NOT NULL,
  `modify_at` int(11) NOT NULL DEFAULT '0',
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`document_id`),
  KEY `md_documents_identify` (`identify`),
  KEY `md_documents_book_id` (`book_id`),
  KEY `md_documents_parent_id` (`parent_id`),
  KEY `md_documents_order_sort` (`order_sort`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_documents`
--

LOCK TABLES `md_documents` WRITE;
/*!40000 ALTER TABLE `md_documents` DISABLE KEYS */;
INSERT INTO `md_documents` VALUES (1,'Api 文档列表','',1,0,0,'','','','2017-07-23 21:11:01',1,'2017-07-23 21:38:25',0,1500817104),(3,'订单操作日志按日读取接口','orders_log_day',1,1,0,'#### 简要描述：\n\n- 订单操作日志按日读取接口\n\n#### 接口版本：\n\n|版本号|制定人|制定日期|修订日期|\n|:----    |:---|:----- |-----   |\n|1.1.1 |Lily  |2017-07-25 |  xxxx-xx-xx |\n\n#### 请求URL:\n\n- http://172.17.240.6:8888/v1/orders/day\n\n#### 支持格式\n\n- JSON\n\n#### HTTP请求方式：\n\n- GET\n\n#### 请求头：\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|Content-Type |是  |string |请求类型： application/json，text/html|\n\n\n#### 请求参数:\n\n|参数名|是否必须|类型|说明|\n|:----    |:---|:----- |-----   |\n|since |否  |string |起始日期   |\n|util |否  |string | 终止日期    |\n\n#### 返回示例:\n\n**正确时返回:**\n\n```\n{\n    \"data\": [\n        {\n            \"unconfirmed\": 3206,\n            \"returned\": 59,\n            \"rejected\": 268,\n            \"GMV\": \"\",\n            \"date\": \"2015-05-26\",\n            \"sls\": 14138\n        },\n        {\n            \"unconfirmed\": 3067,\n            \"returned\": 71,\n            \"rejected\": 240,\n            \"GMV\": \"\",\n            \"date\": \"2015-05-25\",\n            \"sls\": 14165\n        }\n}\n```\n\n**错误时返回:**\n\n\n```\n{\n    \"status\": 406,\n    \"msg\": \"NOT ACCEPTABLE\"\n}\n```\n\n#### 返回字段说明:\n\n|返回值字段|字段类型|字段说明|\n|:-----  |:-----|-----                           |\n|date |string  |订单操作日期  |\n|sls |int   |日确认销售金额  |\n|GMV |int   |日订单流水  |\n|rejected |int   |日拒收金额  |\n|returned |int   |日退货金额  |\n|unconfirmed |int  |日待确认金额  |\n\n#### 备注:\n\n- 更多返回错误代码请看首页的错误代码描述','<h4 id=\"h4--\"><a name=\"简要描述：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>简要描述：</h4><ul>\n<li>订单操作日志按日读取接口</li></ul>\n<h4 id=\"h4--\"><a name=\"接口版本：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>接口版本：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">版本号</th>\n<th style=\"text-align:left\">制定人</th>\n<th style=\"text-align:left\">制定日期</th>\n<th>修订日期</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">1.1.1</td>\n<td style=\"text-align:left\">Lily</td>\n<td style=\"text-align:left\">2017-07-25</td>\n<td>xxxx-xx-xx</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--url-\"><a name=\"请求URL:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求URL:</h4><ul>\n<li><a href=\"http://172.17.240.6:8888/v1/orders/day\">http://172.17.240.6:8888/v1/orders/day</a></li></ul>\n<h4 id=\"h4-u652Fu6301u683Cu5F0F\"><a name=\"支持格式\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>支持格式</h4><ul>\n<li>JSON</li></ul>\n<h4 id=\"h4-http-\"><a name=\"HTTP请求方式：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>HTTP请求方式：</h4><ul>\n<li>GET</li></ul>\n<h4 id=\"h4--\"><a name=\"请求头：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求头：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">Content-Type</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求类型： application/json，text/html</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"请求参数:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求参数:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">since</td>\n<td style=\"text-align:left\">否</td>\n<td style=\"text-align:left\">string</td>\n<td>起始日期</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">util</td>\n<td style=\"text-align:left\">否</td>\n<td style=\"text-align:left\">string</td>\n<td>终止日期</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"返回示例:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回示例:</h4><p><strong>正确时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"data\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"pun\">[</span></code></li><li class=\"L2\"><code><span class=\"pln\">        </span><span class=\"pun\">{</span></code></li><li class=\"L3\"><code><span class=\"pln\">            </span><span class=\"str\">\"unconfirmed\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">3206</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">            </span><span class=\"str\">\"returned\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">59</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">            </span><span class=\"str\">\"rejected\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">268</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">            </span><span class=\"str\">\"GMV\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"\"</span><span class=\"pun\">,</span></code></li><li class=\"L7\"><code><span class=\"pln\">            </span><span class=\"str\">\"date\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"2015-05-26\"</span><span class=\"pun\">,</span></code></li><li class=\"L8\"><code><span class=\"pln\">            </span><span class=\"str\">\"sls\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">14138</span></code></li><li class=\"L9\"><code><span class=\"pln\">        </span><span class=\"pun\">},</span></code></li><li class=\"L0\"><code><span class=\"pln\">        </span><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">            </span><span class=\"str\">\"unconfirmed\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">3067</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">            </span><span class=\"str\">\"returned\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">71</span><span class=\"pun\">,</span></code></li><li class=\"L3\"><code><span class=\"pln\">            </span><span class=\"str\">\"rejected\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">240</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">            </span><span class=\"str\">\"GMV\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"\"</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">            </span><span class=\"str\">\"date\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"2015-05-25\"</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">            </span><span class=\"str\">\"sls\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">14165</span></code></li><li class=\"L7\"><code><span class=\"pln\">        </span><span class=\"pun\">}</span></code></li><li class=\"L8\"><code><span class=\"pun\">}</span></code></li></ol></pre><p><strong>错误时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"status\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">406</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"msg\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"NOT ACCEPTABLE\"</span></code></li><li class=\"L3\"><code><span class=\"pun\">}</span></code></li></ol></pre><h4 id=\"h4--\"><a name=\"返回字段说明:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回字段说明:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">返回值字段</th>\n<th style=\"text-align:left\">字段类型</th>\n<th>字段说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">date</td>\n<td style=\"text-align:left\">string</td>\n<td>订单操作日期</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">sls</td>\n<td style=\"text-align:left\">int</td>\n<td>日确认销售金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">GMV</td>\n<td style=\"text-align:left\">int</td>\n<td>日订单流水</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">rejected</td>\n<td style=\"text-align:left\">int</td>\n<td>日拒收金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">returned</td>\n<td style=\"text-align:left\">int</td>\n<td>日退货金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">unconfirmed</td>\n<td style=\"text-align:left\">int</td>\n<td>日待确认金额</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"备注:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>备注:</h4><ul>\n<li>更多返回错误代码请看首页的错误代码描述</li></ul>\n','<h4 id=\"h4--\"><a name=\"简要描述：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>简要描述：</h4><ul>\n<li>订单操作日志按日读取接口</li></ul>\n<h4 id=\"h4--\"><a name=\"接口版本：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>接口版本：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">版本号</th>\n<th style=\"text-align:left\">制定人</th>\n<th style=\"text-align:left\">制定日期</th>\n<th>修订日期</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">1.1.1</td>\n<td style=\"text-align:left\">Lily</td>\n<td style=\"text-align:left\">2017-07-25</td>\n<td>xxxx-xx-xx</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--url-\"><a name=\"请求URL:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求URL:</h4><ul>\n<li><a href=\"http://172.17.240.6:8888/v1/orders/day\">http://172.17.240.6:8888/v1/orders/day</a></li></ul>\n<h4 id=\"h4-u652Fu6301u683Cu5F0F\"><a name=\"支持格式\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>支持格式</h4><ul>\n<li>JSON</li></ul>\n<h4 id=\"h4-http-\"><a name=\"HTTP请求方式：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>HTTP请求方式：</h4><ul>\n<li>GET</li></ul>\n<h4 id=\"h4--\"><a name=\"请求头：\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求头：</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">Content-Type</td>\n<td style=\"text-align:left\">是</td>\n<td style=\"text-align:left\">string</td>\n<td>请求类型： application/json，text/html</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"请求参数:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>请求参数:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">参数名</th>\n<th style=\"text-align:left\">是否必须</th>\n<th style=\"text-align:left\">类型</th>\n<th>说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">since</td>\n<td style=\"text-align:left\">否</td>\n<td style=\"text-align:left\">string</td>\n<td>起始日期</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">util</td>\n<td style=\"text-align:left\">否</td>\n<td style=\"text-align:left\">string</td>\n<td>终止日期</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"返回示例:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回示例:</h4><p><strong>正确时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"data\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"pun\">[</span></code></li><li class=\"L2\"><code><span class=\"pln\">        </span><span class=\"pun\">{</span></code></li><li class=\"L3\"><code><span class=\"pln\">            </span><span class=\"str\">\"unconfirmed\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">3206</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">            </span><span class=\"str\">\"returned\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">59</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">            </span><span class=\"str\">\"rejected\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">268</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">            </span><span class=\"str\">\"GMV\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"\"</span><span class=\"pun\">,</span></code></li><li class=\"L7\"><code><span class=\"pln\">            </span><span class=\"str\">\"date\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"2015-05-26\"</span><span class=\"pun\">,</span></code></li><li class=\"L8\"><code><span class=\"pln\">            </span><span class=\"str\">\"sls\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">14138</span></code></li><li class=\"L9\"><code><span class=\"pln\">        </span><span class=\"pun\">},</span></code></li><li class=\"L0\"><code><span class=\"pln\">        </span><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">            </span><span class=\"str\">\"unconfirmed\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">3067</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">            </span><span class=\"str\">\"returned\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">71</span><span class=\"pun\">,</span></code></li><li class=\"L3\"><code><span class=\"pln\">            </span><span class=\"str\">\"rejected\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">240</span><span class=\"pun\">,</span></code></li><li class=\"L4\"><code><span class=\"pln\">            </span><span class=\"str\">\"GMV\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"\"</span><span class=\"pun\">,</span></code></li><li class=\"L5\"><code><span class=\"pln\">            </span><span class=\"str\">\"date\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"2015-05-25\"</span><span class=\"pun\">,</span></code></li><li class=\"L6\"><code><span class=\"pln\">            </span><span class=\"str\">\"sls\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">14165</span></code></li><li class=\"L7\"><code><span class=\"pln\">        </span><span class=\"pun\">}</span></code></li><li class=\"L8\"><code><span class=\"pun\">}</span></code></li></ol></pre><p><strong>错误时返回:</strong></p>\n<pre class=\"prettyprint linenums prettyprinted\"><ol class=\"linenums\"><li class=\"L0\"><code><span class=\"pun\">{</span></code></li><li class=\"L1\"><code><span class=\"pln\">    </span><span class=\"str\">\"status\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">406</span><span class=\"pun\">,</span></code></li><li class=\"L2\"><code><span class=\"pln\">    </span><span class=\"str\">\"msg\"</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"str\">\"NOT ACCEPTABLE\"</span></code></li><li class=\"L3\"><code><span class=\"pun\">}</span></code></li></ol></pre><h4 id=\"h4--\"><a name=\"返回字段说明:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>返回字段说明:</h4><table>\n<thead>\n<tr>\n<th style=\"text-align:left\">返回值字段</th>\n<th style=\"text-align:left\">字段类型</th>\n<th>字段说明</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td style=\"text-align:left\">date</td>\n<td style=\"text-align:left\">string</td>\n<td>订单操作日期</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">sls</td>\n<td style=\"text-align:left\">int</td>\n<td>日确认销售金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">GMV</td>\n<td style=\"text-align:left\">int</td>\n<td>日订单流水</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">rejected</td>\n<td style=\"text-align:left\">int</td>\n<td>日拒收金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">returned</td>\n<td style=\"text-align:left\">int</td>\n<td>日退货金额</td>\n</tr>\n<tr>\n<td style=\"text-align:left\">unconfirmed</td>\n<td style=\"text-align:left\">int</td>\n<td>日待确认金额</td>\n</tr>\n</tbody>\n</table>\n<h4 id=\"h4--\"><a name=\"备注:\" class=\"reference-link\"></a><span class=\"header-link octicon octicon-link\"></span>备注:</h4><ul>\n<li>更多返回错误代码请看首页的错误代码描述</li></ul>\n','2017-07-23 21:29:14',1,'2017-07-25 17:18:13',0,1500974293);
/*!40000 ALTER TABLE `md_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_label`
--

DROP TABLE IF EXISTS `md_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(50) NOT NULL DEFAULT '',
  `book_number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_label`
--

LOCK TABLES `md_label` WRITE;
/*!40000 ALTER TABLE `md_label` DISABLE KEYS */;
INSERT INTO `md_label` VALUES (1,'技术文档',1);
/*!40000 ALTER TABLE `md_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_logs`
--

DROP TABLE IF EXISTS `md_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_logs` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `category` varchar(255) NOT NULL DEFAULT 'operate',
  `content` longtext NOT NULL,
  `original_data` longtext NOT NULL,
  `present_data` longtext NOT NULL,
  `create_time` datetime NOT NULL,
  `user_agent` varchar(500) NOT NULL DEFAULT '',
  `ip_address` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_logs`
--

LOCK TABLES `md_logs` WRITE;
/*!40000 ALTER TABLE `md_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `md_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_member_token`
--

DROP TABLE IF EXISTS `md_member_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_member_token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `is_valid` tinyint(1) NOT NULL DEFAULT '0',
  `valid_time` datetime DEFAULT NULL,
  `send_time` datetime NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `md_member_token_token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_member_token`
--

LOCK TABLES `md_member_token` WRITE;
/*!40000 ALTER TABLE `md_member_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `md_member_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_members`
--

DROP TABLE IF EXISTS `md_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_members` (
  `member_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(1000) NOT NULL DEFAULT '',
  `auth_method` varchar(50) NOT NULL DEFAULT 'local',
  `description` varchar(2000) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(255) DEFAULT 'null',
  `avatar` varchar(1000) NOT NULL DEFAULT '',
  `role` int(11) NOT NULL DEFAULT '1',
  `status` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL,
  `create_at` int(11) NOT NULL DEFAULT '0',
  `last_login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `account` (`account`),
  UNIQUE KEY `email` (`email`),
  KEY `md_members_role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_members`
--

LOCK TABLES `md_members` WRITE;
/*!40000 ALTER TABLE `md_members` DISABLE KEYS */;
INSERT INTO `md_members` VALUES (1,'admin','3h-UmajbL4lk-gLKqwyub0f2KIzgNG_oO19LpCG8OuYIsvh8dR0BLhpoGsE4rmDORiON$15$fc1bf64b50f5fa9630599bf67f9e2e44183c438ac378b882ad078c08$7dcd5ae30533c989c11e9d8c52c1b2fb279619493f47f66f9f71f37c7f56de46','local','','00liling11@sina.com','18520613361','/uploads/201707/avatar_14d3fa2f9abda358_small.jpg',0,0,'2017-07-23 21:11:01',0,'2017-07-25 19:59:21'),(2,'jianke','cyqBYPZZslp5bZSL1LO_9_A5zizy16soCldoorMs0rWk_m5IXOidOvpsD1arwzcwbPnjCbNnNsGq$5$399368cabf08c07e553f2a928d25a0ae8917dc4627535ec4105af227$0c4c5dc3d4afba6e15217bad80915c97e59b6d73177cd836b4886135209c8179','local','','liling@jianke.com','','/uploads/201707/avatar_14d3fa7aba958568_small.jpg',2,0,'2017-07-23 21:59:32',1,'2017-07-25 17:50:57');
/*!40000 ALTER TABLE `md_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_migrations`
--

DROP TABLE IF EXISTS `md_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_migrations` (
  `migration_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL DEFAULT '',
  `statements` longtext,
  `status` varchar(255) NOT NULL DEFAULT 'update',
  `create_time` datetime NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`migration_id`),
  UNIQUE KEY `version` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_migrations`
--

LOCK TABLES `md_migrations` WRITE;
/*!40000 ALTER TABLE `md_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `md_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_options`
--

DROP TABLE IF EXISTS `md_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_title` varchar(500) NOT NULL DEFAULT '',
  `option_name` varchar(80) NOT NULL DEFAULT '',
  `option_value` longtext,
  `remark` longtext,
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_options`
--

LOCK TABLES `md_options` WRITE;
/*!40000 ALTER TABLE `md_options` DISABLE KEYS */;
INSERT INTO `md_options` VALUES (1,'是否启用注册','ENABLED_REGISTER','false',''),(2,'是否启用文档历史','ENABLE_DOCUMENT_HISTORY','true',''),(3,'是否启用验证码','ENABLED_CAPTCHA','false',''),(4,'启用匿名访问','ENABLE_ANONYMOUS','false',''),(5,'站点名称','SITE_NAME','技术文档','');
/*!40000 ALTER TABLE `md_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `md_relationship`
--

DROP TABLE IF EXISTS `md_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `md_relationship` (
  `relationship_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL DEFAULT '0',
  `book_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `member_id` (`member_id`,`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `md_relationship`
--

LOCK TABLES `md_relationship` WRITE;
/*!40000 ALTER TABLE `md_relationship` DISABLE KEYS */;
INSERT INTO `md_relationship` VALUES (1,1,1,0);
/*!40000 ALTER TABLE `md_relationship` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-07-26 10:33:45
