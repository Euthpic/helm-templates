/*
 Navicat Premium Data Transfer

 Source Server         : iplas-ks2
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 192.168.3.251:3306
 Source Schema         : nacos_db

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 18/02/2021 16:29:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `c_use` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `effect` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `c_schema` text COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfo_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info';

-- ----------------------------
-- Records of config_info
-- ----------------------------
BEGIN;
INSERT INTO `config_info` VALUES (1, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true', '4dc1facb25e3eb555f8e9a0361d669fd', '2020-11-26 19:43:27', '2021-01-20 03:54:12', NULL, '172.17.0.1', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'cloud 基础的gateway的路由配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (4, 'cloud-admin-core-sentinel.json', 'cloud-infrastructure-sentinel', '[\n    {\n        \"resource\": \"/admin/testribbon\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', 'ddea211e9be3881a6293dce833789aee', '2020-11-27 00:52:18', '2020-11-27 03:37:04', NULL, '192.168.4.124', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'cloud-admin-core 流控配置', '', '', 'json', '');
INSERT INTO `config_info` VALUES (6, 'cloud-auth-gateway-sentinel.json', 'cloud-infrastructure-sentinel', '[\n    {\n        \"resource\": \"/gateway/testgateway\",\n        \"limitApp\": \"default\",\n        \"grade\": 1,\n        \"count\": 1,\n        \"strategy\": 0,\n        \"controlBehavior\": 0,\n        \"clusterMode\": false\n    }\n]', '951b67c887bce453ea14645606fc4d86', '2020-11-27 01:12:26', '2020-11-30 00:06:32', NULL, '192.168.4.124', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'cloud-auth-gateway 的流控配置', '', '', 'json', '');
INSERT INTO `config_info` VALUES (8, 'cloud-auth-gateway-sentinel-gw-flow.json', 'cloud-infrastructure-sentinel', '[]', 'd751713988987e9331980363e24189ce', '2020-11-27 02:36:40', '2020-11-27 02:36:40', NULL, '192.168.4.124', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', '', NULL, NULL, 'json', NULL);
INSERT INTO `config_info` VALUES (9, 'cloud-auth-gateway-sentinel-gw-api-group.json', 'cloud-infrastructure-sentinel', '[]', 'd751713988987e9331980363e24189ce', '2020-11-27 02:37:19', '2020-11-27 02:37:19', NULL, '192.168.4.124', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', NULL, NULL, NULL, 'json', NULL);
INSERT INTO `config_info` VALUES (12, 'tmk-api.yaml', 'tmk-group', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: oss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', 'fbc47b994af0d20abb40045a4f5797bf', '2020-12-17 01:57:54', '2021-01-14 23:48:18', NULL, '172.17.0.1', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'tmk api 模块的配置信息', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (13, 'resource-manager.yaml', 'tmk-group', 'resource-manager:\n    source-app:\n        oss: 1', '4d4a101a1dc3e32b109bbac553c3d19e', '2021-01-11 23:15:58', '2021-01-11 23:16:42', NULL, '172.17.0.1', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', '资源管理的配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (16, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true', '78b0e29c3fc1b3e7bfa099634b1ec814', '2021-01-19 01:46:15', '2021-02-01 00:29:22', NULL, '172.17.0.1', '', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc', 'cloud 基础的gateway的路由配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (17, 'tmk-api.yaml', 'tmk-group', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: oss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', 'fbc47b994af0d20abb40045a4f5797bf', '2021-01-19 01:46:59', '2021-01-19 01:46:59', NULL, '172.17.0.1', '', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc', 'tmk api 模块的配置信息', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (18, 'resource-manager.yaml', 'tmk-group', 'resource-manager:\n    source-app:\n        oss: 1', '4d4a101a1dc3e32b109bbac553c3d19e', '2021-01-19 01:47:26', '2021-01-19 01:47:26', NULL, '172.17.0.1', '', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc', '资源管理的配置', NULL, NULL, 'yaml', NULL);
INSERT INTO `config_info` VALUES (108, 'seata-server-config.properties', 'seata-group', 'transport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableClientBatchSendRequest=false\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\nservice.vgroupMapping.tmk_group=default\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nstore.mode=db\nstore.publicKey=\n#store.file.dir=file_store/data\n#store.file.maxBranchSessionSize=16384\n#store.file.maxGlobalSessionSize=512\n#store.file.fileWriteBufferCacheSize=16384\n#store.file.flushDiskMode=async\n#store.file.sessionReloadReadSize=100\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\nstore.db.url=jdbc:mysql://192.168.3.251:3306/seata_db?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&autoReconnect=true&useSSL=false&serverTimezone=Asia/Shanghai\nstore.db.user=test\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n#store.redis.mode=single\n#store.redis.single.host=127.0.0.1\n#store.redis.single.port=6379\n#store.redis.maxConn=10\n#store.redis.minConn=1\n#store.redis.maxTotal=100\n#store.redis.database=0\n#store.redis.password=\n#store.redis.queryLimit=100\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\nlog.exceptionRate=100\ntransport.serialization=seata\ntransport.compressor=none\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898', '50009979d65f35ebf035b122d6cc78a5', '2021-02-04 01:33:33', '2021-02-04 01:33:33', NULL, '172.18.0.1', '', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'seata server 配置文件', NULL, NULL, 'properties', NULL);
INSERT INTO `config_info` VALUES (109, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true', '78b0e29c3fc1b3e7bfa099634b1ec814', '2021-02-04 20:37:55', '2021-02-04 20:40:05', NULL, '172.17.0.9', '', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c', 'cloud 基础的gateway的路由配置', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (110, 'tmk-api.yaml', 'tmk-group', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: preoss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', '7b78c39e0c253506c9c8ac6bdc1450f7', '2021-02-04 20:38:47', '2021-02-05 04:31:14', NULL, '172.17.0.9', '', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c', 'tmk api 模块的配置信息', '', '', 'yaml', '');
INSERT INTO `config_info` VALUES (113, 'resource-manager.yaml', 'tmk-group', 'resource-manager:\n    source-app:\n        oss: 1', '4d4a101a1dc3e32b109bbac553c3d19e', '2021-02-04 20:41:03', '2021-02-04 20:41:03', NULL, '172.17.0.9', '', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c', '资源管理的配置', NULL, NULL, 'yaml', NULL);
COMMIT;

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfoaggr_datagrouptenantdatum` (`data_id`,`group_id`,`tenant_id`,`datum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='增加租户字段';

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) COLLATE utf8_bin DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfobeta_datagrouptenant` (`data_id`,`group_id`,`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_beta';

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text COLLATE utf8_bin COMMENT 'source user',
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_configinfotag_datagrouptenanttag` (`data_id`,`group_id`,`tenant_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_info_tag';

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation` (
  `id` bigint(20) NOT NULL COMMENT 'id',
  `tag_name` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `uk_configtagrelation_configidtag` (`id`,`tag_name`,`tag_type`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='config_tag_relation';

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='集群、各Group容量信息表';

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info` (
  `id` bigint(64) unsigned NOT NULL,
  `nid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `group_id` varchar(128) COLLATE utf8_bin NOT NULL,
  `app_name` varchar(128) COLLATE utf8_bin DEFAULT NULL COMMENT 'app_name',
  `content` longtext COLLATE utf8_bin NOT NULL,
  `md5` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text COLLATE utf8_bin,
  `src_ip` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `op_type` char(10) COLLATE utf8_bin DEFAULT NULL,
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`nid`),
  KEY `idx_gmt_create` (`gmt_create`),
  KEY `idx_gmt_modified` (`gmt_modified`),
  KEY `idx_did` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多租户改造';

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
BEGIN;
INSERT INTO `his_config_info` VALUES (1, 25, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true', '1b0093d4b1d78d40f2af0cad459d2125', '2021-01-20 17:51:39', '2021-01-20 03:51:38', NULL, '172.17.0.1', 'U', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (1, 26, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true', '4dc1facb25e3eb555f8e9a0361d669fd', '2021-01-20 17:54:12', '2021-01-20 03:54:12', NULL, '172.17.0.1', 'U', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (16, 27, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true', '1b0093d4b1d78d40f2af0cad459d2125', '2021-01-22 18:01:58', '2021-01-22 04:01:56', NULL, '172.17.0.1', 'U', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc');
INSERT INTO `his_config_info` VALUES (16, 28, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: true\n                            customSensitiveHeaders: true', '4dc1facb25e3eb555f8e9a0361d669fd', '2021-02-01 14:29:21', '2021-02-01 00:29:22', NULL, '172.17.0.1', 'U', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc');
INSERT INTO `his_config_info` VALUES (0, 29, 'transport.type', 'seata-group', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2021-02-04 15:25:55', '2021-02-04 01:25:56', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 30, 'transport.server', 'seata-group', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2021-02-04 15:25:56', '2021-02-04 01:25:56', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 31, 'transport.heartbeat', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:25:56', '2021-02-04 01:25:57', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 32, 'transport.enableClientBatchSendRequest', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:25:57', '2021-02-04 01:25:57', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 33, 'transport.threadFactory.bossThreadPrefix', 'seata-group', '', 'NettyBoss', '0f8db59a3b7f2823f38a70c308361836', '2021-02-04 15:25:57', '2021-02-04 01:25:57', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 34, 'transport.threadFactory.workerThreadPrefix', 'seata-group', '', 'NettyServerNIOWorker', 'a78ec7ef5d1631754c4e72ae8a3e9205', '2021-02-04 15:25:57', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 35, 'transport.threadFactory.serverExecutorThreadPrefix', 'seata-group', '', 'NettyServerBizHandler', '11a36309f3d9df84fa8b59cf071fa2da', '2021-02-04 15:25:57', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 36, 'transport.threadFactory.shareBossWorker', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:25:57', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 37, 'transport.threadFactory.clientSelectorThreadPrefix', 'seata-group', '', 'NettyClientSelector', 'cd7ec5a06541e75f5a7913752322c3af', '2021-02-04 15:25:58', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 38, 'transport.threadFactory.clientSelectorThreadSize', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:25:58', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 39, 'transport.threadFactory.clientWorkerThreadPrefix', 'seata-group', '', 'NettyClientWorkerThread', '61cf4e69a56354cf72f46dc86414a57e', '2021-02-04 15:25:58', '2021-02-04 01:25:58', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 40, 'transport.threadFactory.bossThreadSize', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:25:58', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 41, 'transport.threadFactory.workerThreadSize', 'seata-group', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-02-04 15:25:58', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 42, 'transport.shutdown.wait', 'seata-group', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2021-02-04 15:25:58', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 43, 'service.vgroupMapping.tmk_group', 'seata-group', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-02-04 15:25:59', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 44, 'service.default.grouplist', 'seata-group', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3', '2021-02-04 15:25:59', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 45, 'service.enableDegrade', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:25:59', '2021-02-04 01:25:59', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 46, 'service.disableGlobalTransaction', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:25:59', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 47, 'client.rm.asyncCommitBufferLimit', 'seata-group', '', '10000', 'b7a782741f667201b54880c925faec4b', '2021-02-04 15:25:59', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 48, 'client.rm.lock.retryInterval', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:25:59', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 49, 'client.rm.lock.retryTimes', 'seata-group', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-02-04 15:26:00', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 50, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:26:00', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 51, 'client.rm.reportRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:26:00', '2021-02-04 01:26:00', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 52, 'client.rm.tableMetaCheckEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:00', '2021-02-04 01:26:01', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 53, 'client.rm.tableMetaCheckerInterval', 'seata-group', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c', '2021-02-04 15:26:01', '2021-02-04 01:26:01', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 54, 'client.rm.sqlParserType', 'seata-group', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-02-04 15:26:01', '2021-02-04 01:26:01', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 55, 'client.rm.reportSuccessEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:01', '2021-02-04 01:26:02', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 56, 'client.rm.sagaBranchRegisterEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:01', '2021-02-04 01:26:02', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 57, 'client.tm.commitRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:26:02', '2021-02-04 01:26:02', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 58, 'client.tm.rollbackRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:26:02', '2021-02-04 01:26:02', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 59, 'client.tm.defaultGlobalTransactionTimeout', 'seata-group', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c', '2021-02-04 15:26:02', '2021-02-04 01:26:03', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 60, 'client.tm.degradeCheck', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:02', '2021-02-04 01:26:03', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 61, 'client.tm.degradeCheckAllowTimes', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:26:03', '2021-02-04 01:26:03', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 62, 'client.tm.degradeCheckPeriod', 'seata-group', '', '2000', '08f90c1a417155361a5c4b8d297e0d78', '2021-02-04 15:26:03', '2021-02-04 01:26:03', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 63, 'store.mode', 'seata-group', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2021-02-04 15:26:03', '2021-02-04 01:26:03', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 64, 'store.file.dir', 'seata-group', '', 'file_store/data', '6a8dec07c44c33a8a9247cba5710bbb2', '2021-02-04 15:26:03', '2021-02-04 01:26:04', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 65, 'store.file.maxBranchSessionSize', 'seata-group', '', '16384', 'c76fe1d8e08462434d800487585be217', '2021-02-04 15:26:03', '2021-02-04 01:26:04', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 66, 'store.file.maxGlobalSessionSize', 'seata-group', '', '512', '10a7cdd970fe135cf4f7bb55c0e3b59f', '2021-02-04 15:26:04', '2021-02-04 01:26:04', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 67, 'store.file.fileWriteBufferCacheSize', 'seata-group', '', '16384', 'c76fe1d8e08462434d800487585be217', '2021-02-04 15:26:04', '2021-02-04 01:26:04', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 68, 'store.file.flushDiskMode', 'seata-group', '', 'async', '0df93e34273b367bb63bad28c94c78d5', '2021-02-04 15:26:04', '2021-02-04 01:26:04', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 69, 'store.file.sessionReloadReadSize', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:26:04', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 70, 'store.db.datasource', 'seata-group', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-02-04 15:26:04', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 71, 'store.db.dbType', 'seata-group', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-02-04 15:26:04', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 72, 'store.db.driverClassName', 'seata-group', '', 'com.mysql.jdbc.Driver', '683cf0c3a5a56cec94dfac94ca16d760', '2021-02-04 15:26:05', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 73, 'store.db.url', 'seata-group', '', 'jdbc:mysql://192.168.3.251:3306/seata_db?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&autoReconnect=true&useSSL=false&serverTimezone=Asia/Shanghai', '7ca06eaa0194590e52365c69dfae11c7', '2021-02-04 15:26:05', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 74, 'store.db.user', 'seata-group', '', 'test', '02bc6aa7f2b873ef2c3de51c4102691c', '2021-02-04 15:26:05', '2021-02-04 01:26:05', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 75, 'store.db.password', 'seata-group', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-02-04 15:26:05', '2021-02-04 01:26:06', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 76, 'store.db.minConn', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:26:05', '2021-02-04 01:26:06', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 77, 'store.db.maxConn', 'seata-group', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-02-04 15:26:06', '2021-02-04 01:26:06', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 78, 'store.db.globalTable', 'seata-group', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-02-04 15:26:06', '2021-02-04 01:26:06', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 79, 'store.db.branchTable', 'seata-group', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-02-04 15:26:06', '2021-02-04 01:26:06', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 80, 'store.db.queryLimit', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:26:07', '2021-02-04 01:26:07', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 81, 'store.db.lockTable', 'seata-group', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-02-04 15:26:07', '2021-02-04 01:26:07', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 82, 'store.db.maxWait', 'seata-group', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-02-04 15:26:07', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 83, 'store.redis.mode', 'seata-group', '', 'single', 'dd5c07036f2975ff4bce568b6511d3bc', '2021-02-04 15:26:07', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 84, 'store.redis.single.host', 'seata-group', '', '127.0.0.1', 'f528764d624db129b32c21fbca0cb8d6', '2021-02-04 15:26:07', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 85, 'store.redis.single.port', 'seata-group', '', '6379', '92c3b916311a5517d9290576e3ea37ad', '2021-02-04 15:26:08', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 86, 'store.redis.maxConn', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:26:08', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 87, 'store.redis.minConn', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:26:08', '2021-02-04 01:26:08', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 88, 'store.redis.maxTotal', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:26:08', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 89, 'store.redis.database', 'seata-group', '', '0', 'cfcd208495d565ef66e7dff9f98764da', '2021-02-04 15:26:08', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 90, 'store.redis.queryLimit', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:26:08', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 91, 'server.recovery.committingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:26:09', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 92, 'server.recovery.asynCommittingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:26:09', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 93, 'server.recovery.rollbackingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:26:09', '2021-02-04 01:26:09', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 94, 'server.recovery.timeoutRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:26:09', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 95, 'server.maxCommitRetryTimeout', 'seata-group', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88', '2021-02-04 15:26:09', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 96, 'server.maxRollbackRetryTimeout', 'seata-group', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88', '2021-02-04 15:26:09', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 97, 'server.rollbackRetryTimeoutUnlockEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:10', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 98, 'client.undo.dataValidation', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:26:10', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 99, 'client.undo.logSerialization', 'seata-group', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9', '2021-02-04 15:26:10', '2021-02-04 01:26:10', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 100, 'client.undo.onlyCareUpdateColumns', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:26:10', '2021-02-04 01:26:11', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 101, 'server.undo.logSaveDays', 'seata-group', '', '7', '8f14e45fceea167a5a36dedd4bea2543', '2021-02-04 15:26:11', '2021-02-04 01:26:11', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 102, 'server.undo.logDeletePeriod', 'seata-group', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346', '2021-02-04 15:26:11', '2021-02-04 01:26:11', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 103, 'client.undo.logTable', 'seata-group', '', 'undo_log', '2842d229c24afe9e61437135e8306614', '2021-02-04 15:26:11', '2021-02-04 01:26:11', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 104, 'client.undo.compress.enable', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:26:11', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 105, 'client.undo.compress.type', 'seata-group', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2', '2021-02-04 15:26:11', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 106, 'client.undo.compress.threshold', 'seata-group', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035', '2021-02-04 15:26:11', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 107, 'log.exceptionRate', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:26:12', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 108, 'transport.serialization', 'seata-group', '', 'seata', 'b943081c423b9a5416a706524ee05d40', '2021-02-04 15:26:12', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 109, 'transport.compressor', 'seata-group', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8', '2021-02-04 15:26:12', '2021-02-04 01:26:12', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 110, 'metrics.enabled', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:26:12', '2021-02-04 01:26:13', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 111, 'metrics.registryType', 'seata-group', '', 'compact', '7cf74ca49c304df8150205fc915cd465', '2021-02-04 15:26:12', '2021-02-04 01:26:13', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 112, 'metrics.exporterList', 'seata-group', '', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c', '2021-02-04 15:26:12', '2021-02-04 01:26:13', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 113, 'metrics.exporterPrometheusPort', 'seata-group', '', '9898', '7b9dc501afe4ee11c56a4831e20cee71', '2021-02-04 15:26:13', '2021-02-04 01:26:13', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (23, 114, 'transport.type', 'seata-group', '', 'TCP', 'b136ef5f6a01d816991fe3cf7a6ac763', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (24, 115, 'transport.server', 'seata-group', '', 'NIO', 'b6d9dfc0fb54277321cebc0fff55df2f', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (25, 116, 'transport.heartbeat', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (26, 117, 'transport.enableClientBatchSendRequest', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (27, 118, 'transport.threadFactory.bossThreadPrefix', 'seata-group', '', 'NettyBoss', '0f8db59a3b7f2823f38a70c308361836', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (28, 119, 'transport.threadFactory.workerThreadPrefix', 'seata-group', '', 'NettyServerNIOWorker', 'a78ec7ef5d1631754c4e72ae8a3e9205', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (29, 120, 'transport.threadFactory.serverExecutorThreadPrefix', 'seata-group', '', 'NettyServerBizHandler', '11a36309f3d9df84fa8b59cf071fa2da', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (30, 121, 'transport.threadFactory.shareBossWorker', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (31, 122, 'transport.threadFactory.clientSelectorThreadPrefix', 'seata-group', '', 'NettyClientSelector', 'cd7ec5a06541e75f5a7913752322c3af', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (32, 123, 'transport.threadFactory.clientSelectorThreadSize', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:30:17', '2021-02-04 01:30:17', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (33, 124, 'transport.threadFactory.clientWorkerThreadPrefix', 'seata-group', '', 'NettyClientWorkerThread', '61cf4e69a56354cf72f46dc86414a57e', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (34, 125, 'transport.threadFactory.bossThreadSize', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (35, 126, 'transport.threadFactory.workerThreadSize', 'seata-group', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (36, 127, 'transport.shutdown.wait', 'seata-group', '', '3', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (37, 128, 'service.vgroupMapping.tmk_group', 'seata-group', '', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (38, 129, 'service.default.grouplist', 'seata-group', '', '127.0.0.1:8091', 'c32ce0d3e264525dcdada751f98143a3', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (39, 130, 'service.enableDegrade', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (40, 131, 'service.disableGlobalTransaction', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (41, 132, 'client.rm.asyncCommitBufferLimit', 'seata-group', '', '10000', 'b7a782741f667201b54880c925faec4b', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (42, 133, 'client.rm.lock.retryInterval', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:30:21', '2021-02-04 01:30:22', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (43, 134, 'client.rm.lock.retryTimes', 'seata-group', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (44, 135, 'client.rm.lock.retryPolicyBranchRollbackOnConflict', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (45, 136, 'client.rm.reportRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (46, 137, 'client.rm.tableMetaCheckEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (47, 138, 'client.rm.tableMetaCheckerInterval', 'seata-group', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (48, 139, 'client.rm.sqlParserType', 'seata-group', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (49, 140, 'client.rm.reportSuccessEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (50, 141, 'client.rm.sagaBranchRegisterEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (51, 142, 'client.tm.commitRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (52, 143, 'client.tm.rollbackRetryCount', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:30:27', '2021-02-04 01:30:27', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (53, 144, 'client.tm.defaultGlobalTransactionTimeout', 'seata-group', '', '60000', '2b4226dd7ed6eb2d419b881f3ae9c97c', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (54, 145, 'client.tm.degradeCheck', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (55, 146, 'client.tm.degradeCheckAllowTimes', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (56, 147, 'client.tm.degradeCheckPeriod', 'seata-group', '', '2000', '08f90c1a417155361a5c4b8d297e0d78', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (57, 148, 'store.mode', 'seata-group', '', 'file', '8c7dd922ad47494fc02c388e12c00eac', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (58, 149, 'store.file.dir', 'seata-group', '', 'file_store/data', '6a8dec07c44c33a8a9247cba5710bbb2', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (59, 150, 'store.file.maxBranchSessionSize', 'seata-group', '', '16384', 'c76fe1d8e08462434d800487585be217', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (60, 151, 'store.file.maxGlobalSessionSize', 'seata-group', '', '512', '10a7cdd970fe135cf4f7bb55c0e3b59f', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (61, 152, 'store.file.fileWriteBufferCacheSize', 'seata-group', '', '16384', 'c76fe1d8e08462434d800487585be217', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (62, 153, 'store.file.flushDiskMode', 'seata-group', '', 'async', '0df93e34273b367bb63bad28c94c78d5', '2021-02-04 15:30:32', '2021-02-04 01:30:32', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (63, 154, 'store.file.sessionReloadReadSize', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:30:35', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (64, 155, 'store.db.datasource', 'seata-group', '', 'druid', '3d650fb8a5df01600281d48c47c9fa60', '2021-02-04 15:30:35', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (65, 156, 'store.db.dbType', 'seata-group', '', 'mysql', '81c3b080dad537de7e10e0987a4bf52e', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (66, 157, 'store.db.driverClassName', 'seata-group', '', 'com.mysql.jdbc.Driver', '683cf0c3a5a56cec94dfac94ca16d760', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (67, 158, 'store.db.url', 'seata-group', '', 'jdbc:mysql://192.168.3.251:3306/seata_db?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&autoReconnect=true&useSSL=false&serverTimezone=Asia/Shanghai', '7ca06eaa0194590e52365c69dfae11c7', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (68, 159, 'store.db.user', 'seata-group', '', 'test', '02bc6aa7f2b873ef2c3de51c4102691c', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (69, 160, 'store.db.password', 'seata-group', '', '123456', 'e10adc3949ba59abbe56e057f20f883e', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (70, 161, 'store.db.minConn', 'seata-group', '', '5', 'e4da3b7fbbce2345d7772b0674a318d5', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (71, 162, 'store.db.maxConn', 'seata-group', '', '30', '34173cb38f07f89ddbebc2ac9128303f', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (72, 163, 'store.db.globalTable', 'seata-group', '', 'global_table', '8b28fb6bb4c4f984df2709381f8eba2b', '2021-02-04 15:30:36', '2021-02-04 01:30:36', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (73, 164, 'store.db.branchTable', 'seata-group', '', 'branch_table', '54bcdac38cf62e103fe115bcf46a660c', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (74, 165, 'store.db.queryLimit', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (75, 166, 'store.db.lockTable', 'seata-group', '', 'lock_table', '55e0cae3b6dc6696b768db90098b8f2f', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (76, 167, 'store.db.maxWait', 'seata-group', '', '5000', 'a35fe7f7fe8217b4369a0af4244d1fca', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (77, 168, 'store.redis.mode', 'seata-group', '', 'single', 'dd5c07036f2975ff4bce568b6511d3bc', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (78, 169, 'store.redis.single.host', 'seata-group', '', '127.0.0.1', 'f528764d624db129b32c21fbca0cb8d6', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (79, 170, 'store.redis.single.port', 'seata-group', '', '6379', '92c3b916311a5517d9290576e3ea37ad', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (80, 171, 'store.redis.maxConn', 'seata-group', '', '10', 'd3d9446802a44259755d38e6d163e820', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (81, 172, 'store.redis.minConn', 'seata-group', '', '1', 'c4ca4238a0b923820dcc509a6f75849b', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (82, 173, 'store.redis.maxTotal', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:30:39', '2021-02-04 01:30:40', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (83, 174, 'store.redis.database', 'seata-group', '', '0', 'cfcd208495d565ef66e7dff9f98764da', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (84, 175, 'store.redis.queryLimit', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (85, 176, 'server.recovery.committingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (86, 177, 'server.recovery.asynCommittingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (87, 178, 'server.recovery.rollbackingRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (88, 179, 'server.recovery.timeoutRetryPeriod', 'seata-group', '', '1000', 'a9b7ba70783b617e9998dc4dd82eb3c5', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (89, 180, 'server.maxCommitRetryTimeout', 'seata-group', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (90, 181, 'server.maxRollbackRetryTimeout', 'seata-group', '', '-1', '6bb61e3b7bce0931da574d19d1d82c88', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (91, 182, 'server.rollbackRetryTimeoutUnlockEnable', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (92, 183, 'client.undo.dataValidation', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:30:44', '2021-02-04 01:30:44', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (93, 184, 'client.undo.logSerialization', 'seata-group', '', 'jackson', 'b41779690b83f182acc67d6388c7bac9', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (94, 185, 'client.undo.onlyCareUpdateColumns', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (95, 186, 'server.undo.logSaveDays', 'seata-group', '', '7', '8f14e45fceea167a5a36dedd4bea2543', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (96, 187, 'server.undo.logDeletePeriod', 'seata-group', '', '86400000', 'f4c122804fe9076cb2710f55c3c6e346', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (97, 188, 'client.undo.logTable', 'seata-group', '', 'undo_log', '2842d229c24afe9e61437135e8306614', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (98, 189, 'client.undo.compress.enable', 'seata-group', '', 'true', 'b326b5062b2f0e69046810717534cb09', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (99, 190, 'client.undo.compress.type', 'seata-group', '', 'zip', 'adcdbd79a8d84175c229b192aadc02f2', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (100, 191, 'client.undo.compress.threshold', 'seata-group', '', '64k', 'bd44a6458bdbff0b5cac721ba361f035', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (101, 192, 'log.exceptionRate', 'seata-group', '', '100', 'f899139df5e1059396431415e770c6dd', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (102, 193, 'transport.serialization', 'seata-group', '', 'seata', 'b943081c423b9a5416a706524ee05d40', '2021-02-04 15:30:48', '2021-02-04 01:30:48', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (103, 194, 'transport.compressor', 'seata-group', '', 'none', '334c4a4c42fdb79d7ebc3e73b517e6f8', '2021-02-04 15:30:51', '2021-02-04 01:30:52', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (104, 195, 'metrics.enabled', 'seata-group', '', 'false', '68934a3e9455fa72420237eb05902327', '2021-02-04 15:30:51', '2021-02-04 01:30:52', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (105, 196, 'metrics.registryType', 'seata-group', '', 'compact', '7cf74ca49c304df8150205fc915cd465', '2021-02-04 15:30:51', '2021-02-04 01:30:52', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (106, 197, 'metrics.exporterList', 'seata-group', '', 'prometheus', 'e4f00638b8a10e6994e67af2f832d51c', '2021-02-04 15:30:51', '2021-02-04 01:30:52', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (107, 198, 'metrics.exporterPrometheusPort', 'seata-group', '', '9898', '7b9dc501afe4ee11c56a4831e20cee71', '2021-02-04 15:30:51', '2021-02-04 01:30:52', NULL, '172.18.0.1', 'D', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 199, 'seata-server-config.properties', 'seata-group', '', 'transport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableClientBatchSendRequest=false\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\nservice.vgroupMapping.tmk_group=default\nservice.default.grouplist=127.0.0.1:8091\nservice.enableDegrade=false\nservice.disableGlobalTransaction=false\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=false\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nstore.mode=db\nstore.publicKey=\n#store.file.dir=file_store/data\n#store.file.maxBranchSessionSize=16384\n#store.file.maxGlobalSessionSize=512\n#store.file.fileWriteBufferCacheSize=16384\n#store.file.flushDiskMode=async\n#store.file.sessionReloadReadSize=100\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.jdbc.Driver\nstore.db.url=jdbc:mysql://192.168.3.251:3306/seata_db?useUnicode=true&characterEncoding=utf-8&allowMultiQueries=true&autoReconnect=true&useSSL=false&serverTimezone=Asia/Shanghai\nstore.db.user=test\nstore.db.password=123456\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n#store.redis.mode=single\n#store.redis.single.host=127.0.0.1\n#store.redis.single.port=6379\n#store.redis.maxConn=10\n#store.redis.minConn=1\n#store.redis.maxTotal=100\n#store.redis.database=0\n#store.redis.password=\n#store.redis.queryLimit=100\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\nlog.exceptionRate=100\ntransport.serialization=seata\ntransport.compressor=none\nmetrics.enabled=false\nmetrics.registryType=compact\nmetrics.exporterList=prometheus\nmetrics.exporterPrometheusPort=9898', '50009979d65f35ebf035b122d6cc78a5', '2021-02-04 15:33:32', '2021-02-04 01:33:33', NULL, '172.18.0.1', 'I', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e');
INSERT INTO `his_config_info` VALUES (0, 200, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true', '78b0e29c3fc1b3e7bfa099634b1ec814', '2021-02-05 10:37:55', '2021-02-04 20:37:55', NULL, '172.17.0.9', 'I', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (0, 201, 'tmk-api.yaml', 'tmk-group', '', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: oss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', 'fbc47b994af0d20abb40045a4f5797bf', '2021-02-05 10:38:46', '2021-02-04 20:38:47', NULL, '172.17.0.9', 'I', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (109, 202, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true', '78b0e29c3fc1b3e7bfa099634b1ec814', '2021-02-05 10:39:27', '2021-02-04 20:39:27', NULL, '172.17.0.9', 'U', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (109, 203, 'cloud-infrastructure-zuul-gateway.yaml', 'cloud-infrastructure', '', 'admin:\n    auth:\n        gateway:\n            nacos-zuul:\n                zuul:\n                    #路由规则\n                    routes:\n                        cloud-admin-core:\n                            path: /admin/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        cloud-admin-core-user:\n                            path: /user/**\n                            service-id: cloud-admin-core\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-admin-app:\n                            path: /tmk/admin/**,/tmk/statistics/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-agent-app:\n                            path: /tmk/agent/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true\n                        tmk-data-app:\n                            path: /tmk/keyValue/**\n                            stripPrefix: false\n                            retryable: false\n                            customSensitiveHeaders: true', '78b0e29c3fc1b3e7bfa099634b1ec814', '2021-02-05 10:40:04', '2021-02-04 20:40:05', NULL, '172.17.0.9', 'U', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (0, 204, 'resource-manager.yaml', 'tmk-group', '', 'resource-manager:\n    source-app:\n        oss: 1', '4d4a101a1dc3e32b109bbac553c3d19e', '2021-02-05 10:41:02', '2021-02-04 20:41:03', NULL, '172.17.0.9', 'I', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (110, 205, 'tmk-api.yaml', 'tmk-group', '', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: oss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', 'fbc47b994af0d20abb40045a4f5797bf', '2021-02-05 17:51:22', '2021-02-05 03:51:22', NULL, '172.17.0.9', 'U', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
INSERT INTO `his_config_info` VALUES (110, 206, 'tmk-api.yaml', 'tmk-group', '', 'tmk-api:\n    allow-in-minute: 10\n    app:    \n        oss: preoss123456\n    hotlines:\n    sms-business-code: \'TMK\'\n    sms-template-name: \"TMK电话回拨通知\"', '7b78c39e0c253506c9c8ac6bdc1450f7', '2021-02-05 18:31:13', '2021-02-05 04:31:14', NULL, '172.17.0.9', 'U', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c');
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `role` varchar(50) NOT NULL,
  `resource` varchar(255) NOT NULL,
  `action` varchar(8) NOT NULL,
  UNIQUE KEY `uk_role_permission` (`role`,`resource`,`action`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `username` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  UNIQUE KEY `idx_user_role` (`username`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');
COMMIT;

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '配额，0表示使用默认值',
  `usage` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用量',
  `max_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '聚合子配置最大个数',
  `max_aggr_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_id` (`tenant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='租户容量信息表';

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) COLLATE utf8_bin DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint(20) NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_info_kptenantid` (`kp`,`tenant_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='tenant_info';

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
BEGIN;
INSERT INTO `tenant_info` VALUES (1, '1', 'd25f3be5-152f-4c43-8f9e-46d011e3d83e', 'local', '开发环境', 'nacos', 1606382664396, 1611042277838);
INSERT INTO `tenant_info` VALUES (2, '1', '18bb42f4-7deb-4ee7-a0f5-44d41d0e03fc', 'test', '测试环境', 'nacos', 1611042293785, 1611042293785);
INSERT INTO `tenant_info` VALUES (3, '1', '3e3a10f8-9773-4b83-8d7a-51e972e63a2c', 'pre', '预发布环境', 'nacos', 1612492567108, 1612492567108);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
