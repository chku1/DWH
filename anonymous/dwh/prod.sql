create table prod
(
    PROD_KEY         int auto_increment
        primary key,
    CONTR_KEY        int                       default -1                not null,
    PROD_STAT_KEY    int                       default -1                not null,
    BUS_PROD_TP_KEY  int                       default -1                not null,
    SYS_PROD_TP_KEY  int                       default -1                not null,
    TERM_TP_KEY      int                       default -1                not null,
    CMDT_KEY         int                       default -1                not null,
    ACCR_BASIS_KEY   int                       default -1                not null,
    POS_KEY          int                       default -1                not null,
    CRNT_POS_KEY     int                       default -1                not null,
    CNL_KEY          int                       default -1                not null,
    BANK_MOD_KEY     int                       default -1                not null,
    PROD_NUM         varchar(255) charset utf8 default ''                null,
    CB_ID            varchar(255) charset utf8 default ''                not null,
    CUST_PROD_DESCR  varchar(255) charset utf8 default ''                null,
    CMPN             varchar(255) charset utf8 default ''                not null,
    PROMO_CODE       varchar(255) charset utf8 default ''                not null,
    OPEN_DATE        date                      default '1000-01-01'      null,
    CLOS_DATE        date                      default '1000-01-01'      null,
    MAT_DATE         date                      default '1000-01-01'      null,
    FINAL_MAT_DATE   date                      default '1000-01-01'      null,
    DUR              decimal(19, 3)            default 0.000             null,
    MAIN_PROD_FLAG   int                       default -1                not null,
    EXT_REG_RPT_FLAG int                       default -1                not null,
    SRC_ID           varchar(255) charset utf8 default ''                not null,
    SRC_SYS_ID       varchar(255) charset utf8 default ''                not null,
    DEL_FLAG         smallint                  default 0                 not null,
    INS_PROCESS_ID   varchar(255) charset utf8 default ''                not null,
    INS_DT           datetime                  default CURRENT_TIMESTAMP not null,
    UPD_PROCESS_ID   varchar(255) charset utf8 default ''                not null,
    UPD_DT           datetime                  default CURRENT_TIMESTAMP not null,
    UPD_EFF_DATE     datetime                  default CURRENT_TIMESTAMP not null,
    SRC_UPD_DT       datetime                  default CURRENT_TIMESTAMP not null,
    RN               int                       default -1                not null,
    PART_ID          varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    constraint unique_src
        unique (SRC_ID, SRC_SYS_ID)
);
