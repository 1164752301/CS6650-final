use mes3;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT COMMENT '权限ID',
    `name`            varchar(50)  NULL DEFAULT NULL COMMENT '权限名称',
    `perms`           varchar(500) NULL DEFAULT NULL COMMENT '权限标识',
    `path`            varchar(500) NULL DEFAULT NULL COMMENT '权限api路径',
    `is_deleted`      datetime(3)  NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    `tenant_id`       varchar(64)  NULL     DEFAULT NULL COMMENT '企业id',
    `create_time`     datetime(3)  NULL DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64)  NULL DEFAULT NULL COMMENT '创建人',
    `update_time`     datetime(3)  NULL DEFAULT NULL COMMENT '最后更新时间',
    `update_username` varchar(64)  NULL DEFAULT NULL COMMENT '最后更新人',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_name_tenant_deleted` (`perms`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '权限表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(1, '新增单个物料信息', 'base:material:create', '/v1/base/material/create', '2021-11-17 03:28:08.872000000', 'system', '2021-11-17 03:28:08.873000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(2, '批量查询物料信息', 'base:material:list', '/v1/base/material/list', '2021-11-17 03:28:08.880000000', 'system', '2021-11-17 03:28:08.881000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(3, '删除单个物料信息', 'base:material:delete', '/v1/base/material/{id}/delete', '2021-11-17 03:28:08.882000000', 'system', '2021-11-17 03:28:08.882000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(4, '查询单个物料信息', 'base:material:show', '/v1/base/material/{id}/show', '2021-11-17 03:28:08.883000000', 'system', '2021-11-17 03:28:08.883000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(5, '修改单个物料信息', 'base:material:update', '/v1/base/material/{id}/update', '2021-11-17 03:28:08.884000000', 'system', '2021-11-17 03:28:08.885000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(6, '新增加工工具组', 'base:prd-tool-group:create', '/v1/base/prd-tool-group/create', '2021-11-17 03:28:08.886000000', 'system', '2021-11-17 03:28:08.886000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(7, '批量查询加工工具组信息', 'base:prd-tool-group:list', '/v1/base/prd-tool-group/list', '2021-11-17 03:28:08.887000000', 'system', '2021-11-17 03:28:08.888000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(8, '删除指定加工工具组', 'base:prd-tool-group:delete', '/v1/base/prd-tool-group/{id}/delete', '2021-11-17 03:28:08.889000000', 'system', '2021-11-17 03:28:08.889000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(9, '查询指定加工工具组信息', 'base:prd-tool-group:show', '/v1/base/prd-tool-group/{id}/show', '2021-11-17 03:28:08.890000000', 'system', '2021-11-17 03:28:08.890000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(10, '更新指定加工工具组', 'base:prd-tool-group:update', '/v1/base/prd-tool-group/{id}/update', '2021-11-17 03:28:08.891000000', 'system', '2021-11-17 03:28:08.892000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(11, '新建质检工具组', 'base:qc-tool-group:create', '/v1/base/qc-tool-group/create', '2021-11-17 03:28:08.893000000', 'system', '2021-11-17 03:28:08.893000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(12, '批量分页指定质检工具组', 'base:qc-tool-group:list', '/v1/base/qc-tool-group/list', '2021-11-17 03:28:08.894000000', 'system', '2021-11-17 03:28:08.894000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(13, '删除指定质检工具组', 'base:qc-tool-group:delete', '/v1/base/qc-tool-group/{id}/delete', '2021-11-17 03:28:08.895000000', 'system', '2021-11-17 03:28:08.895000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(14, '查询指定质检工具组信息', 'base:qc-tool-group:show', '/v1/base/qc-tool-group/{id}/show', '2021-11-17 03:28:08.896000000', 'system', '2021-11-17 03:28:08.896000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(15, '更新指定质检工具组', 'base:qc-tool-group:update', '/v1/base/qc-tool-group/{id}/update', '2021-11-17 03:28:08.897000000', 'system', '2021-11-17 03:28:08.897000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(16, '新增单个 基础信息-质检-缺陷类型 信息', 'base:qc-fault-type:create', '/v1/base/qc/fault-type/create', '2021-11-17 03:28:08.899000000', 'system', '2021-11-17 03:28:08.899000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(17, '批量查询 基础信息-质检-缺陷类型 信息', 'base:qc-fault-type:list', '/v1/base/qc/fault-type/list', '2021-11-17 03:28:08.901000000', 'system', '2021-11-17 03:28:08.901000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(18, '删除单个 基础信息-质检-缺陷类型 信息', 'base:qc-fault-type:delete', '/v1/base/qc/fault-type/{id}/delete', '2021-11-17 03:28:08.902000000', 'system', '2021-11-17 03:28:08.902000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(19, '查询单个 基础信息-质检-缺陷类型 信息', 'base:qc-fault-type:show', '/v1/base/qc/fault-type/{id}/show', '2021-11-17 03:28:08.903000000', 'system', '2021-11-17 03:28:08.903000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(20, '修改单个 基础信息-质检-缺陷类型 信息', 'base:qc-fault-type:update', '/v1/base/qc/fault-type/{id}/update', '2021-11-17 03:28:08.904000000', 'system', '2021-11-17 03:28:08.904000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(21, '新增单个 基础信息-质检-缺陷 信息', 'base:qc-fault:create', '/v1/base/qc/fault/create', '2021-11-17 03:28:08.905000000', 'system', '2021-11-17 03:28:08.905000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(22, '批量查询 基础信息-质检-缺陷 信息', 'base:qc-fault:list', '/v1/base/qc/fault/list', '2021-11-17 03:28:08.906000000', 'system', '2021-11-17 03:28:08.906000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(23, '删除单个 基础信息-质检-缺陷 信息', 'base:qc-fault:delete', '/v1/base/qc/fault/{id}/delete', '2021-11-17 03:28:08.907000000', 'system', '2021-11-17 03:28:08.908000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(24, '查询单个 基础信息-质检-缺陷 信息', 'base:qc-fault:show', '/v1/base/qc/fault/{id}/show', '2021-11-17 03:28:08.909000000', 'system', '2021-11-17 03:28:08.909000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(25, '修改单个 基础信息-质检-缺陷 信息', 'base:qc-fault:update', '/v1/base/qc/fault/{id}/update', '2021-11-17 03:28:08.910000000', 'system', '2021-11-17 03:28:08.910000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(26, '新增单个 基础信息-质检-条目类型 信息', 'base:qc-item-type:create', '/v1/base/qc/item-type/create', '2021-11-17 03:28:08.911000000', 'system', '2021-11-17 03:28:08.911000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(27, '批量查询 基础信息-质检-条目类型 信息', 'base:qc-item-type:list', '/v1/base/qc/item-type/list', '2021-11-17 03:28:08.912000000', 'system', '2021-11-17 03:28:08.912000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(28, '删除单个 基础信息-质检-条目类型 信息', 'base:qc-item-type:delete', '/v1/base/qc/item-type/{id}/delete', '2021-11-17 03:28:08.912000000', 'system', '2021-11-17 03:28:08.913000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(29, '查询单个 基础信息-质检-条目类型 信息', 'base:qc-item-type:show', '/v1/base/qc/item-type/{id}/show', '2021-11-17 03:28:08.914000000', 'system', '2021-11-17 03:28:08.914000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(30, '修改单个 基础信息-质检-条目类型 信息', 'base:qc-item-type:update', '/v1/base/qc/item-type/{id}/update', '2021-11-17 03:28:08.914000000', 'system', '2021-11-17 03:28:08.915000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(31, '新增单个 基础信息-质检-条目 信息', 'base:qc-item:create', '/v1/base/qc/item/create', '2021-11-17 03:28:08.915000000', 'system', '2021-11-17 03:28:08.916000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(32, '删除 基础信息-质检-条目-指导文件', 'base:qc-item-file:delete', '/v1/base/qc/item/file/delete', '2021-11-17 03:28:08.916000000', 'system', '2021-11-17 03:28:08.917000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(33, '下载 基础信息-质检-条目-指导文件', 'base:qc-item-file:download', '/v1/base/qc/item/file/download', '2021-11-17 03:28:08.917000000', 'system', '2021-11-17 03:28:08.917000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(34, '上传 基础信息-质检-条目-指导文件', 'base:qc-item-file:upload', '/v1/base/qc/item/file/upload', '2021-11-17 03:28:08.918000000', 'system', '2021-11-17 03:28:08.918000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(35, '批量查询 基础信息-质检-条目 信息', 'base:qc-item:list', '/v1/base/qc/item/list', '2021-11-17 03:28:08.919000000', 'system', '2021-11-17 03:28:08.919000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(36, '删除单个 基础信息-质检-条目 信息', 'base:qc-item:delete', '/v1/base/qc/item/{id}/delete', '2021-11-17 03:28:08.920000000', 'system', '2021-11-17 03:28:08.920000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(37, '查询单个 基础信息-质检-条目 信息', 'base:qc-item:show', '/v1/base/qc/item/{id}/show', '2021-11-17 03:28:08.921000000', 'system', '2021-11-17 03:28:08.921000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(38, '修改单个 基础信息-质检-条目 信息', 'base:qc-item:update', '/v1/base/qc/item/{id}/update', '2021-11-17 03:28:08.922000000', 'system', '2021-11-17 03:28:08.922000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(39, '新增单个工厂资源组信息', 'base:resourcegroup:create', '/v1/base/resource-group/create', '2021-11-17 03:28:08.922000000', 'system', '2021-11-17 03:28:08.923000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(40, '批量查询工厂资源组信息', 'base:resourcegroup:list', '/v1/base/resource-group/list', '2021-11-17 03:28:08.923000000', 'system', '2021-11-17 03:28:08.924000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(41, '根据id删除单个工厂资源组信息', 'base:resourcegroup:delete', '/v1/base/resource-group/{id}/delete', '2021-11-17 03:28:08.924000000', 'system', '2021-11-17 03:28:08.925000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(42, '根据id查询单个工厂资源组信息', 'base:resourcegroup:show', '/v1/base/resource-group/{id}/show', '2021-11-17 03:28:08.925000000', 'system', '2021-11-17 03:28:08.925000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(43, '修改单个工厂资源组信息', 'base:resourcegroup:update', '/v1/base/resource-group/{id}/update', '2021-11-17 03:28:08.926000000', 'system', '2021-11-17 03:28:08.926000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(44, '新建基本单位', 'base:unit:create', '/v1/base/unit/create', '2021-11-17 03:28:08.927000000', 'system', '2021-11-17 03:28:08.927000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(45, '批量分页指定单位信息', 'base:unit:list', '/v1/base/unit/list', '2021-11-17 03:28:08.928000000', 'system', '2021-11-17 03:28:08.928000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(46, '删除指定基本单位', 'base:unit:delete', '/v1/base/unit/{unit-id}/delete', '2021-11-17 03:28:08.929000000', 'system', '2021-11-17 03:28:08.929000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(47, '查询指定基本单位信息', 'base:unit:show', '/v1/base/unit/{unit-id}/show', '2021-11-17 03:28:08.930000000', 'system', '2021-11-17 03:28:08.930000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(48, '更新指定单位', 'base:unit:update', '/v1/base/unit/{unit-id}/update', '2021-11-17 03:28:08.930000000', 'system', '2021-11-17 03:28:08.931000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(49, '新建组件', 'craft:component:create', '/v1/craft/component/create', '2021-11-17 03:28:08.931000000', 'system', '2021-11-17 03:28:08.931000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(50, '批量分页指定组件信息', 'craft:component:list', '/v1/craft/component/list', '2021-11-17 03:28:08.932000000', 'system', '2021-11-17 03:28:08.932000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(51, '删除指定组件', 'craft:component:delete', '/v1/craft/component/{component-id}/delete', '2021-11-17 03:28:08.933000000', 'system', '2021-11-17 03:28:08.933000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(52, '查询指定组件信息', 'craft:component:show', '/v1/craft/component/{component-id}/show', '2021-11-17 03:28:08.934000000', 'system', '2021-11-17 03:28:08.934000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(53, '更新指定组件', 'craft:component:update', '/v1/craft/component/{component-id}/update', '2021-11-17 03:28:08.934000000', 'system', '2021-11-17 03:28:08.935000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(54, '创建工艺流程', 'craft:flow:create', '/v1/craft/flow/create', '2021-11-17 03:28:08.935000000', 'system', '2021-11-17 03:28:08.936000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(55, '批量分页查询工艺流程简要信息', 'craft:flow:list', '/v1/craft/flow/list', '2021-11-17 03:28:08.936000000', 'system', '2021-11-17 03:28:08.936000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(56, '删除工艺流程', 'craft:flow:delete', '/v1/craft/flow/{flow-id}/delete', '2021-11-17 03:28:08.937000000', 'system', '2021-11-17 03:28:08.937000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(57, '更新工艺流程图', 'craft:flow-graph:update', '/v1/craft/flow/{flow-id}/graph/update', '2021-11-17 03:28:08.938000000', 'system', '2021-11-17 03:28:08.938000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(58, '查询工艺流程', 'craft:flow:show', '/v1/craft/flow/{flow-id}/show', '2021-11-17 03:28:08.938000000', 'system', '2021-11-17 03:28:08.939000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(59, '更新工艺流程', 'craft:flow:update', '/v1/craft/flow/{flow-id}/update', '2021-11-17 03:28:08.939000000', 'system', '2021-11-17 03:28:08.940000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(60, '批量查询模板信息', 'craft:template:list', '/v1/craft/template/list', '2021-11-17 03:28:08.940000000', 'system', '2021-11-17 03:28:08.940000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(61, '查询指定工厂资源的下属资源信息', 'factory:child-resources:list', '/v1/factory/child-resources/list', '2021-11-17 03:28:08.941000000', 'system', '2021-11-17 03:28:08.941000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(62, '保存工厂资源层级概况', 'factory:factory-summary:save', '/v1/factory/factory-summary/save', '2021-11-17 03:28:08.942000000', 'system', '2021-11-17 03:28:08.942000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(63, '获取指定工厂资源的层级概况', 'factory:factory-summary:show', '/v1/factory/factory-summary/{parentCode}/show', '2021-11-17 03:28:08.943000000', 'system', '2021-11-17 03:28:08.943000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(64, '批量查询工厂资源信息', 'factory:resources:list', '/v1/factory/mes-base/src/main/resources/list', '2021-11-17 03:28:08.943000000', 'system', '2021-11-17 03:28:08.944000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(65, '更新指定工厂资源的详细信息', 'factory:resource-detail:update', '/v1/factory/resource-detail/update', '2021-11-17 03:28:08.944000000', 'system', '2021-11-17 03:28:08.945000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(66, '新增工厂资源', 'factory:resource:add', '/v1/factory/resource/add', '2021-11-17 03:28:08.945000000', 'system', '2021-11-17 03:28:08.945000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(67, '删除指定工厂资源', 'factory:resource:delete', '/v1/factory/resource/{resourceCode}/delete', '2021-11-17 03:28:08.946000000', 'system', '2021-11-17 03:28:08.946000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(68, '查询指定工厂资源的详细信息', 'factory:resource:show', '/v1/factory/resource/{resourceCode}/show', '2021-11-17 03:28:08.947000000', 'system', '2021-11-17 03:28:08.947000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(69, '批量查询权限信息', 'sys:permission:list', '/v1/permission/list', '2021-11-17 03:28:08.947000000', 'system', '2021-11-17 03:28:08.948000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(70, '创建角色', 'sys:role:create', '/v1/role/create', '2021-11-17 03:28:08.948000000', 'system', '2021-11-17 03:28:08.948000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(71, '批量获取角色信息', 'sys:role:list', '/v1/role/list', '2021-11-17 03:28:08.949000000', 'system', '2021-11-17 03:28:08.949000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(72, '修改角色', 'sys:role:update', '/v1/role/update', '2021-11-17 03:28:08.950000000', 'system', '2021-11-17 03:28:08.950000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(73, '删除角色', 'sys:role:delete', '/v1/role/{roleId}/delete', '2021-11-17 03:28:08.950000000', 'system', '2021-11-17 03:28:08.951000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(74, '获取单个角色详细信息', 'sys:role:show', '/v1/role/{roleId}/show', '2021-11-17 03:28:08.951000000', 'system', '2021-11-17 03:28:08.952000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(75, '创建用户', 'sys:user:create', '/v1/user/create', '2021-11-17 03:28:08.952000000', 'system', '2021-11-17 03:28:08.952000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(76, '批量获取用户信息', 'sys:user:list', '/v1/user/list', '2021-11-17 03:28:08.953000000', 'system', '2021-11-17 03:28:08.953000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(77, '修改用户角色', 'sys:user:role:update', '/v1/user/update-roles', '2021-11-17 03:28:08.954000000', 'system', '2021-11-17 03:28:08.954000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(78, '删除用户', 'sys:user:delete', '/v1/user/{userId}/delete', '2021-11-17 03:28:08.954000000', 'system', '2021-11-17 03:28:08.955000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(79, '获取选中仓储的子仓储信息', 'wms:child-warehouses:list', '/v1/wms/child-warehouses/list', '2021-11-17 03:28:08.956000000', 'system', '2021-11-17 03:28:08.956000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(80, '更新选中仓储的详细信息', 'wms:warehouse-detail:update', '/v1/wms/warehouse-detail/update', '2021-11-17 03:28:08.957000000', 'system', '2021-11-17 03:28:08.957000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(81, '新增仓储', 'wms:warehouse:add', '/v1/wms/warehouse/add', '2021-11-17 03:28:08.957000000', 'system', '2021-11-17 03:28:08.958000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(82, '删除选中仓储', 'wms:warehouse:delete', '/v1/wms/warehouse/{warehouseCode}/delete', '2021-11-17 03:28:08.958000000', 'system', '2021-11-17 03:28:08.958000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(83, '获取选中仓储的详细信息', 'wms:warehouse:show', '/v1/wms/warehouse/{warehouseCode}/show', '2021-11-17 03:28:08.959000000', 'system', '2021-11-17 03:28:08.959000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(84, '保存仓储层级概况', 'wms:warehouses-summary:save', '/v1/wms/warehouses-summary/save', '2021-11-17 03:28:08.960000000', 'system', '2021-11-17 03:28:08.960000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(85, '获取指定资源的层级概况', 'wms:warehouses-summary:show', '/v1/wms/warehouses-summary/{parentCode}/show', '2021-11-17 03:28:08.960000000', 'system', '2021-11-17 03:28:08.961000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');
INSERT INTO mes3.sys_perm
(id, name, perms, `path`, create_time, create_username, update_time, update_username, IS_DELETED, TENANT_ID)
VALUES(86, '批量查询仓储信息', 'wms:warehouse:list', '/v1/wms/warehouses/list', '2021-11-17 03:28:08.961000000', 'system', '2021-11-17 03:28:08.962000000', 'system', '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21');


-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`
(
    `id`              bigint      NOT NULL AUTO_INCREMENT COMMENT '角色ID',
    `name`            varchar(50) NOT NULL COMMENT '角色名称',
    `role`            varchar(50) NOT NULL COMMENT '角色标识',
    `tenant_id`       varchar(64) NULL     DEFAULT NULL COMMENT '企业id',
    `create_time`     datetime(3) NULL     DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64) NULL     DEFAULT NULL COMMENT '创建人',
    `update_time`     datetime(3) NULL     DEFAULT NULL COMMENT '最后更新时间',
    `update_username` varchar(64) NULL     DEFAULT NULL COMMENT '最后更新人',
    `is_deleted`      datetime(3) NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE KEY `UK_name_tenant_deleted` (`name`, `tenant_id`, `is_deleted`) USING BTREE,
    UNIQUE KEY `UK_role_tenant_deleted` (`role`, `tenant_id`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role`
VALUES (1, '管理员', 'ADMIN', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', now(), 'sys', now(), 'sys',
        '1970-01-01 00:00:00.000');
INSERT INTO `sys_role`
VALUES (2, '普通用户', 'USER', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', now(), 'sys', now(), 'sys',
        '1970-01-01 00:00:00.000');

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm`
(
    `id`      bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
    `perm_id` bigint NULL DEFAULT NULL COMMENT '权限ID',
    `is_deleted`      datetime(3)  NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    `tenant_id`       varchar(64)  NULL     DEFAULT NULL COMMENT '企业id',
    `create_time`     datetime(3)  NULL DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64)  NULL DEFAULT NULL COMMENT '创建人',
    `update_time`     datetime(3)  NULL DEFAULT NULL COMMENT '最后更新时间',
    `update_username` varchar(64)  NULL DEFAULT NULL COMMENT '最后更新人',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '角色与权限关系表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(1, 1, 1, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.658000000', 'system', '2021-11-17 03:28:25.658000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(2, 1, 2, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.660000000', 'system', '2021-11-17 03:28:25.660000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(3, 1, 3, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.660000000', 'system', '2021-11-17 03:28:25.661000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(4, 1, 4, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.661000000', 'system', '2021-11-17 03:28:25.661000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(5, 1, 5, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.662000000', 'system', '2021-11-17 03:28:25.662000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(6, 1, 6, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.663000000', 'system', '2021-11-17 03:28:25.663000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(7, 1, 7, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.664000000', 'system', '2021-11-17 03:28:25.664000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(8, 1, 8, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.664000000', 'system', '2021-11-17 03:28:25.665000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(9, 1, 9, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.665000000', 'system', '2021-11-17 03:28:25.665000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(10, 1, 10, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.666000000', 'system', '2021-11-17 03:28:25.666000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(11, 1, 11, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.667000000', 'system', '2021-11-17 03:28:25.667000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(12, 1, 12, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.667000000', 'system', '2021-11-17 03:28:25.667000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(13, 1, 13, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.668000000', 'system', '2021-11-17 03:28:25.668000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(14, 1, 14, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.669000000', 'system', '2021-11-17 03:28:25.669000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(15, 1, 15, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.669000000', 'system', '2021-11-17 03:28:25.669000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(16, 1, 16, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.670000000', 'system', '2021-11-17 03:28:25.670000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(17, 1, 17, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.671000000', 'system', '2021-11-17 03:28:25.671000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(18, 1, 18, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.671000000', 'system', '2021-11-17 03:28:25.671000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(19, 1, 19, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.672000000', 'system', '2021-11-17 03:28:25.672000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(20, 1, 20, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.673000000', 'system', '2021-11-17 03:28:25.673000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(21, 1, 21, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.674000000', 'system', '2021-11-17 03:28:25.674000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(22, 1, 22, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.674000000', 'system', '2021-11-17 03:28:25.674000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(23, 1, 23, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.675000000', 'system', '2021-11-17 03:28:25.675000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(24, 1, 24, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.676000000', 'system', '2021-11-17 03:28:25.676000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(25, 1, 25, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.676000000', 'system', '2021-11-17 03:28:25.677000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(26, 1, 26, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.677000000', 'system', '2021-11-17 03:28:25.677000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(27, 1, 27, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.678000000', 'system', '2021-11-17 03:28:25.678000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(28, 1, 28, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.678000000', 'system', '2021-11-17 03:28:25.679000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(29, 1, 29, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.679000000', 'system', '2021-11-17 03:28:25.679000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(30, 1, 30, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.680000000', 'system', '2021-11-17 03:28:25.680000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(31, 1, 31, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.680000000', 'system', '2021-11-17 03:28:25.681000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(32, 1, 32, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.681000000', 'system', '2021-11-17 03:28:25.681000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(33, 1, 33, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.682000000', 'system', '2021-11-17 03:28:25.682000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(34, 1, 34, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.683000000', 'system', '2021-11-17 03:28:25.683000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(35, 1, 35, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.683000000', 'system', '2021-11-17 03:28:25.684000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(36, 1, 36, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.684000000', 'system', '2021-11-17 03:28:25.684000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(37, 1, 37, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.685000000', 'system', '2021-11-17 03:28:25.685000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(38, 1, 38, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.685000000', 'system', '2021-11-17 03:28:25.686000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(39, 1, 39, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.686000000', 'system', '2021-11-17 03:28:25.686000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(40, 1, 40, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.687000000', 'system', '2021-11-17 03:28:25.687000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(41, 1, 41, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.687000000', 'system', '2021-11-17 03:28:25.688000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(42, 1, 42, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.688000000', 'system', '2021-11-17 03:28:25.688000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(43, 1, 43, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.689000000', 'system', '2021-11-17 03:28:25.689000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(44, 1, 44, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.690000000', 'system', '2021-11-17 03:28:25.690000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(45, 1, 45, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.690000000', 'system', '2021-11-17 03:28:25.691000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(46, 1, 46, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.691000000', 'system', '2021-11-17 03:28:25.691000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(47, 1, 47, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.692000000', 'system', '2021-11-17 03:28:25.692000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(48, 1, 48, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.692000000', 'system', '2021-11-17 03:28:25.693000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(49, 1, 49, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.693000000', 'system', '2021-11-17 03:28:25.693000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(50, 1, 50, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.694000000', 'system', '2021-11-17 03:28:25.694000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(51, 1, 51, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.694000000', 'system', '2021-11-17 03:28:25.694000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(52, 1, 52, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.695000000', 'system', '2021-11-17 03:28:25.695000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(53, 1, 53, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.696000000', 'system', '2021-11-17 03:28:25.696000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(54, 1, 54, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.696000000', 'system', '2021-11-17 03:28:25.696000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(55, 1, 55, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.697000000', 'system', '2021-11-17 03:28:25.697000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(56, 1, 56, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.697000000', 'system', '2021-11-17 03:28:25.698000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(57, 1, 57, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.698000000', 'system', '2021-11-17 03:28:25.698000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(58, 1, 58, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.699000000', 'system', '2021-11-17 03:28:25.699000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(59, 1, 59, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.699000000', 'system', '2021-11-17 03:28:25.700000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(60, 1, 60, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.700000000', 'system', '2021-11-17 03:28:25.700000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(61, 1, 61, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.701000000', 'system', '2021-11-17 03:28:25.701000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(62, 1, 62, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.701000000', 'system', '2021-11-17 03:28:25.702000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(63, 1, 63, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.702000000', 'system', '2021-11-17 03:28:25.702000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(64, 1, 64, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.703000000', 'system', '2021-11-17 03:28:25.703000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(65, 1, 65, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.703000000', 'system', '2021-11-17 03:28:25.703000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(66, 1, 66, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.704000000', 'system', '2021-11-17 03:28:25.704000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(67, 1, 67, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.704000000', 'system', '2021-11-17 03:28:25.705000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(68, 1, 68, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.705000000', 'system', '2021-11-17 03:28:25.705000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(69, 1, 69, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.706000000', 'system', '2021-11-17 03:28:25.706000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(70, 1, 70, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.706000000', 'system', '2021-11-17 03:28:25.707000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(71, 1, 71, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.707000000', 'system', '2021-11-17 03:28:25.707000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(72, 1, 72, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.708000000', 'system', '2021-11-17 03:28:25.708000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(73, 1, 73, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.708000000', 'system', '2021-11-17 03:28:25.708000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(74, 1, 74, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.709000000', 'system', '2021-11-17 03:28:25.709000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(75, 1, 75, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.709000000', 'system', '2021-11-17 03:28:25.710000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(76, 1, 76, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.710000000', 'system', '2021-11-17 03:28:25.710000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(77, 1, 77, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.711000000', 'system', '2021-11-17 03:28:25.711000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(78, 1, 78, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.711000000', 'system', '2021-11-17 03:28:25.712000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(79, 1, 79, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.712000000', 'system', '2021-11-17 03:28:25.712000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(80, 1, 80, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.713000000', 'system', '2021-11-17 03:28:25.713000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(81, 1, 81, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.713000000', 'system', '2021-11-17 03:28:25.714000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(82, 1, 82, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.714000000', 'system', '2021-11-17 03:28:25.714000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(83, 1, 83, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.715000000', 'system', '2021-11-17 03:28:25.715000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(84, 1, 84, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.715000000', 'system', '2021-11-17 03:28:25.715000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(85, 1, 85, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.716000000', 'system', '2021-11-17 03:28:25.716000000', 'system');
INSERT INTO mes3.sys_role_perm
(id, role_id, perm_id, IS_DELETED, TENANT_ID, CREATE_TIME, CREATE_USERNAME, UPDATE_TIME, UPDATE_USERNAME)
VALUES(86, 1, 86, '1970-01-01 00:00:00', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-11-17 03:28:25.716000000', 'system', '2021-11-17 03:28:25.717000000', 'system');


-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS `sys_tenant`;
CREATE TABLE `sys_tenant`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT COMMENT '主键',
    `tenant_id`       varchar(64)  NOT NULL COMMENT '租户id',
    `login_name`      varchar(255) NULL     DEFAULT NULL COMMENT '租户账号登录名',
    `state`           varchar(16)  NULL     DEFAULT 'ACTIVE' COMMENT '0 表示启用，1表示冻结',
    `create_time`     datetime(3)  NULL     DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64)  NULL     DEFAULT NULL,
    `update_time`     datetime(3)  NULL     DEFAULT NULL,
    `update_username` varchar(64)  NULL     DEFAULT NULL,
    `is_deleted`      datetime(3)  NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `U_tenant_deleted` (`tenant_id`, `is_deleted`) USING BTREE,
    INDEX `tenant_id` (`tenant_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '企业租户'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO mes3.sys_tenant
(id, tenant_id, login_name, state, create_time, create_username, update_time, update_username)
VALUES (10, '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'user', 'ACTIVE', '2021-08-01 00:00:00', 'sys', '2021-08-01
00:00:00', 'sys');
INSERT INTO mes3.sys_tenant
(id, tenant_id, login_name, state, create_time, create_username, update_time, update_username)
VALUES (20, '08a0e82e-0ea2-4046-85c9-9e0e4b19ab21', 'admin', 'ACTIVE', '2021-08-01 00:00:00', 'sys',
        '2021-08-01 00:00:00', 'sys');



-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
-- mes3.sys_user definition
CREATE TABLE `sys_user`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    `username`        varchar(50)  NOT NULL COMMENT '用户名',
    `password`        varchar(100) NOT NULL COMMENT '密码',
    `salt`            varchar(50)  NOT NULL COMMENT '盐值',
    `real_name`       varchar(50)  NOT NULL COMMENT '用户真实姓名',
    `state`           varchar(16)  NULL     DEFAULT 'ACTIVE' COMMENT '状态:0-激活，1-冻结',
    `tenant_id`       varchar(64)  NULL     DEFAULT NULL COMMENT '企业id',
    `create_time`     datetime(3)  NULL     DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64)  NULL     DEFAULT NULL COMMENT '创建人',
    `update_time`     datetime(3)  NULL     DEFAULT NULL COMMENT '最后更新时间',
    `update_username` varchar(64)  NULL     DEFAULT NULL COMMENT '最后更新人',
    `is_deleted`      datetime(3)  NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `U_user_tenant_deleted` (`username`, `is_deleted`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_unicode_ci COMMENT = '系统用户表'
  ROW_FORMAT = DYNAMIC;
-- ----------------------------
-- Records of sys_user， 默认登录初始密码：2$9d&J2kd@@kc9!4
-- ----------------------------
INSERT INTO mes3.sys_user
(id, username, password, salt, real_name, state, tenant_id, create_time, create_username, update_time, update_username)
VALUES (1, 'admin', 'cb49020376df4db2a9db31460af0b89dc988926a9dd7de1dbe90115e91a321c4', 'RvP3UID2n30Q2sycZYvH',
        '租户用户名1', 'ACTIVE', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-08-03 23:19:17', 'sys', '2021-02-17 23:19:17',
        'sys');
INSERT INTO mes3.sys_user
(id, username, password, salt, real_name, state, tenant_id, create_time, create_username, update_time, update_username)
VALUES (2, 'user', '301f93c68e48df51565fbb15d0b61d69ce61f60dc87c8d47ab282a5a161a0cdb', 'OVlrD37bDUKNcFRB10qG',
        '租户用户名2', 'ACTIVE', '58a0e82e-0ea2-4046-85c9-9e0e4b19ab21', '2021-02-17 23:19:17', 'sys', '2021-02-17 23:19:17',
        'sys');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`
(
    `id`      bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
    `role_id` bigint NULL DEFAULT NULL COMMENT '角色ID',
    `create_time`     datetime(3)  NULL     DEFAULT NULL COMMENT '创建时间',
    `create_username` varchar(64)  NULL     DEFAULT NULL,
    `update_time`     datetime(3)  NULL     DEFAULT NULL,
    `update_username` varchar(64)  NULL     DEFAULT NULL,
    `is_deleted`      datetime(3)  NOT NULL DEFAULT '1970-01-01 00:00:00.000' COMMENT '逻辑删除：1970-01-01 00:00:00 表示启用，有值 表示删除',
    `tenant_id`       varchar(64)  NULL     DEFAULT NULL COMMENT '企业id',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '用户与角色关系表'
  ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` (id, user_id, role_id)
VALUES (1, 1, 1);
INSERT INTO `sys_user_role`(id, user_id, role_id)
VALUES (2, 2, 2);

SET FOREIGN_KEY_CHECKS = 1;