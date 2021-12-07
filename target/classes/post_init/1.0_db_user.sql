-- we don't know how to generate root <with-no-name> (class Root) :(
grant super on *.* to 'mysql.session'@localhost;

grant alter, alter routine, create, create routine, create tablespace, create temporary tables, create user, create view, delete, drop, event, execute, file, index, insert, lock tables, process, references, reload, replication client, replication slave, select, show databases, show view, shutdown, super, trigger, update, grant option on *.* to root;

grant alter, alter routine, create, create routine, create tablespace, create temporary tables, create user, create view, delete, drop, event, execute, file, index, insert, lock tables, process, references, reload, replication client, replication slave, select, show databases, show view, shutdown, super, trigger, update, grant option on *.* to root@localhost;

create table group_info
(
    id bigint auto_increment
        primary key,
    group_name varchar(64) null,
    group_attribute int null,
    member1_name varchar(64) null,
    member2_name varchar(64) null,
    last_update date null,
    constraint table_name_group_name_uindex
        unique (group_name)
);

create table message
(
    id bigint auto_increment
        primary key,
    group_id bigint not null,
    sender_id bigint not null,
    message varchar(255) null,
    create_time date null
);

create table relation
(
    id bigint auto_increment
        primary key,
    user_id bigint not null,
    group_id bigint not null
);

