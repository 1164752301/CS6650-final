create table group_info
(
    id bigint auto_increment
        primary key,
    group_name varchar(64) null,
    group_attribute int null,
    a_name varchar(64) null,
    b_name varchar(64) null,
    last_update date null,
    constraint table_name_group_name_uindex
        unique (group_name)
);

create table message
(
    id bigint auto_increment
        primary key,
    group_id bigint not null,
    sender_id varchar(255) not null,
    message varchar(255) null,
    create_time date null
);

create table relation
(
    id bigint auto_increment
        primary key,
    user_id varchar(255) not null,
    group_id bigint not null
);



