-- 创建数据库
CREATE DATABASE `final` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 用户权限
grant all PRIVILEGES on final.* to root@'%' identified by 'Y2h5d9pDa9D';
flush privileges;
use final;