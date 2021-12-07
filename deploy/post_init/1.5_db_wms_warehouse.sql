/*
 Navicat Premium Data Transfer

 Source Server         : 桐庐MES_MySQL
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : 47.115.203.105:33061
 Source Schema         : mes3

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 24/09/2021 17:44:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

use mes3;
-- ----------------------------
-- Table structure for wms_warehouse_info
-- ----------------------------
DROP TABLE IF EXISTS `wms_warhouse_info`;
DROP TABLE IF EXISTS `wms_warehouse_info`;
CREATE TABLE `wms_warehouse_info`
(
    `id`              bigint                                                        NOT NULL AUTO_INCREMENT COMMENT '主键',
    `code`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '库位代码',
    `name`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '名称',
    `type`            varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '类型',
    `parent_code`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '父仓储代码',
    `ancestor_code`   varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '顶级仓储代码',
    `desc`            text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci         NULL COMMENT '描述，预留字段',
    `location`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL     DEFAULT NULL COMMENT '库位位置',
    `length`          double                                                        NULL     DEFAULT NULL COMMENT '长度',
    `width`           double                                                        NULL     DEFAULT NULL COMMENT '宽度',
    `height`          double                                                        NULL     DEFAULT NULL COMMENT '高度',
    `unit`            varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '单位',
    `state`           varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL DEFAULT 'ACTIVE' COMMENT '用户定义状态',
    `x_rel`           int                                                           NULL     DEFAULT NULL COMMENT '在界面上的相对坐标x',
    `y_rel`           int                                                           NULL     DEFAULT NULL COMMENT '在界面上的相对坐标y',
    `is_deleted`      datetime(3)                                                   NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除。未删除为1970-01-01 00:00:00',
    `tenant_id`       varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NOT NULL COMMENT '租户id',
    `create_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '创建用户',
    `create_time`     datetime(3)                                                   NULL     DEFAULT NULL COMMENT '创建时间',
    `update_username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci  NULL     DEFAULT NULL COMMENT '更新用户',
    `update_time`     datetime(3)                                                   NULL     DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `storage_code_idx_uq` (`code`, `is_deleted`, `tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '仓储资源表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wms_warehouse_info
-- ----------------------------
INSERT INTO `wms_warehouse_info`
VALUES (1, 'CK00000001', '杭半城的仓库', '2001', 'EMPTY', 'CK00000001', NULL, '杭州西湖底', 1000, 500, 500, '米', 'ACTIVE', 10, 10,
        '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (2, 'HJ00000001', '杭半城的货架1', '2002', 'CK00000001', 'CK00000001', NULL, '湖滨银泰', 100, 50, 50, '米', 'ACTIVE', 20,
        20, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (3, 'HJ00000002', '孙一峰的货架2', '2002', 'CK00000001', 'CK00000001', NULL, '雷峰塔', 100, 50, 50, '米', 'ACTIVE', 30, 30,
        '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (4, 'KW00000001', '杭半城的库位1', '2003', 'HJ00000001', 'CK00000001', NULL, '花鸟观鱼', 50, 25, 25, '米', 'ACTIVE', 40, 40,
        '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (5, 'KW00000002', '我大哥的库位2', '2003', 'HJ00000001', 'CK00000001', NULL, '金台夕照', 50, 25, 25, '米', 'ACTIVE', 50, 50,
        '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (6, 'KW00000003', 'TossBoy的库位3', '2003', 'HJ00000001', 'CK00000001', NULL, '断桥残雪', 50, 25, 25, '米', 'ACTIVE', 60,
        60, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', NULL, 'admin', NULL);
INSERT INTO `wms_warehouse_info`
VALUES (12, 'KW00000004', '货架2的库位1', '2003', 'HJ00000002', 'CK00000001', NULL, '凤起路', 20, 55, 90, NULL, 'ACTIVE', NULL,
        NULL, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', '2021-09-23 08:53:58.000',
        'admin', '2021-09-23 09:16:02.000');
INSERT INTO `wms_warehouse_info`
VALUES (13, 'KW00000005', '货架2的库位2', '2003', 'HJ00000002', 'CK00000001', NULL, '龙翔桥', 80, 100, 110, NULL, 'ACTIVE',
        NULL, NULL, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin',
        '2021-09-23 08:53:58.000', 'admin', '2021-09-23 09:16:02.000');
INSERT INTO `wms_warehouse_info`
VALUES (15, 'KW00000006', '货架2的库位3', '2003', 'HJ00000002', 'CK00000001', NULL, '西湖文化广场', 10, 20, 30, NULL, 'ACTIVE',
        NULL, NULL, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin',
        '2021-09-23 08:53:58.000', 'admin', '2021-09-23 09:16:02.000');
INSERT INTO `wms_warehouse_info`
VALUES (16, 'KW00000007', '货架2的库位4', '2003', 'HJ00000002', 'CK00000001', NULL, '打铁关', 22, 60, 999, NULL, 'ACTIVE', 96,
        294, '1970-01-01 00:00:00.000', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', '2021-09-23 08:53:58.000',
        'admin', '2021-09-23 09:16:02.000');

SET FOREIGN_KEY_CHECKS = 1;
