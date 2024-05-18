create table pos
(
    POS_KEY          int auto_increment
        primary key,
    PT_KEY           int                       default -1                not null,
    POS_TP_KEY       int                       default -1                not null,
    SRVC_OUTL_TP_KEY int                       default -1                not null,
    MERCH_CODE_KEY   int                       default -1                not null,
    POS_LOC_KEY      int                       default -1                not null,
    POS_ID           varchar(255) charset utf8 default ''                not null,
    POS_DESCR        varchar(255) charset utf8 default ''                null,
    OPEN_HOURS       varchar(255) charset utf8 default ''                null,
    VRTL_FLAG        int                       default -1                not null,
    TST_FLAG         int                       default -1                not null,
    SRC_ID           varchar(255) charset utf8                           not null,
    SRC_SYS_ID       varchar(255) charset utf8                           not null,
    DEL_FLAG         smallint                  default 0                 not null,
    INS_PROCESS_ID   varchar(255) charset utf8 default ''                not null,
    INS_DT           datetime                  default CURRENT_TIMESTAMP not null,
    UPD_PROCESS_ID   varchar(255) charset utf8 default ''                not null,
    UPD_DT           datetime                  default CURRENT_TIMESTAMP not null,
    SRC_UPD_DT       datetime                  default CURRENT_TIMESTAMP not null,
    UPD_EFF_DATE     datetime                  default CURRENT_TIMESTAMP not null,
    SC_CODE          varchar(255) charset utf8 default ''                not null,
    RN               int                       default -1                not null,
    PART_ID          varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    POS_CATG         varchar(10) charset utf8  default ''                null,
    ADDRESS          varchar(255) charset utf8 default ''                not null,
    CITY             varchar(255) charset utf8 default ''                not null,
    ZIPCODE          varchar(255) charset utf8 default ''                not null,
    constraint unique_src
        unique (SRC_ID, SRC_SYS_ID)
);

create index FK_POS_PT
    on pos (PT_KEY);

