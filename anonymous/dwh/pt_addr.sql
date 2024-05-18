create table pt_addr
(
    PT_ADDR_KEY        int auto_increment
        primary key,
    PT_KEY             int                        not null,
    LOC_ADDR_KEY       int                        not null,
    ADDR_PURP_KEY      int                        not null,
    CITY_KEY           int                        not null,
    DSTC_KEY           int                        not null,
    REGION_KEY         int                        not null,
    SOC_TRF_REGION_KEY int                        not null,
    CNTRY_KEY          int                        not null,
    STR_NAME           varchar(255) charset utf8  null,
    STR_NUM            varchar(255) charset utf8  null,
    CITY_NAME          varchar(255) charset utf8  null,
    LAND_REG_NUM       varchar(255) charset utf8  null,
    ZIP                varchar(255) charset utf8  null,
    ADDR_DET           varchar(255) charset utf8  null,
    ORIG_UNSTRUCT_TXT  varchar(4000) charset utf8 null,
    LGT                decimal(19, 3)             null,
    LTT                decimal(19, 3)             null,
    ADDR_USE_FROM      date                       not null,
    ADDR_USE_TO        date                       not null,
    DEL_FLAG           smallint                   not null,
    SRC_ID             varchar(255) charset utf8  not null,
    SRC_SYS_ID         varchar(255) charset utf8  not null,
    INS_PROCESS_ID     varchar(255) charset utf8  not null,
    INS_DT             datetime                   not null,
    UPD_PROCESS_ID     varchar(255) charset utf8  not null,
    UPD_DT             datetime                   not null,
    UPD_EFF_DATE       datetime                   not null,
    SRC_UPD_DT         datetime                   not null,
    RN                 int                        not null,
    PART_ID            varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    constraint FK_PT_ADDR_PT
        foreign key (PT_KEY) references pt (PT_KEY)
);

