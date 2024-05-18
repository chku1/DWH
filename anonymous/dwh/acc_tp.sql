create table acc_tp
(
    ACC_TP_KEY int auto_increment
        primary key,
    ACC_TP     varchar(255) charset utf8 null,
    ACC_TP_LAT varchar(255) charset utf8 null,
    SRC_ID     varchar(255) charset utf8 null,
    SRC_SYS_ID varchar(255) charset utf8 null
);

