create table prod_pt_rel_tp
(
    PROD_PT_REL_TP_KEY int auto_increment
        primary key,
    DESCR              varchar(255) charset utf8 null,
    DESCR_LAT          varchar(255)              null,
    SRC_ID             varchar(255)              null,
    SRC_SYS_ID         varchar(255)              null,
    constraint unique_src
        unique (SRC_ID, SRC_SYS_ID)
);

