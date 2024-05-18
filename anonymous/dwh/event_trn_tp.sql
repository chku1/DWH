create table event_trn_tp
(
    EVENT_TRN_TP_KEY int auto_increment
        primary key,
    DESCR            varchar(255) charset utf8 null,
    DESCR_LAT        varchar(255)              null,
    SRC_ID           varchar(255)              null,
    SRC_SYS_ID       varchar(255)              null
);

