create table if not exists address
(
    ip   varchar(64) null,
    port int         null,
    id   bigint auto_increment
        primary key
);

create table if not exists group_info
(
    id              bigint auto_increment
        primary key,
    group_name      varchar(64) null,
    group_attribute int         null,
    a_name          varchar(64) null,
    b_name          varchar(64) null,
    last_update     timestamp   null,
    constraint table_name_group_name_uindex
        unique (group_name)
);

create table if not exists message
(
    id          bigint auto_increment
        primary key,
    group_id    bigint       not null,
    sender_id   varchar(255) not null,
    message     varchar(255) null,
    create_time timestamp    null
);

create table if not exists relation
(
    id       bigint auto_increment
        primary key,
    user_id  varchar(255) not null,
    group_id bigint       not null
);

insert into address (ip, port, id) VALUES ('server1', 30001, 1);
insert into address (ip, port, id) VALUES ('server2', 30001, 2);
insert into address (ip, port, id) VALUES ('server3', 30001, 3);

