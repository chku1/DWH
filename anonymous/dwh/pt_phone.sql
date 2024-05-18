create table pt_phone
(
    PT_PHONE_KEY         int auto_increment
        primary key,
    PT_KEY               int                       not null,
    PHONE_TP_KEY         int                       not null,
    CONT_PURP_KEY        int                       not null,
    PHONE_CNTRY_PREF_KEY int                       not null,
    PHONE_PREF_KEY       int                       not null,
    PHONE_NUM            varchar(255) charset utf8 null,
    VERIF_FLAG           int                       not null,
    SIGN_FLAG            int                       not null,
    LAST_UPD_DT          date                      null,
    SRC_ID               varchar(255) charset utf8 not null,
    SRC_SYS_ID           varchar(255) charset utf8 not null,
    DEL_FLAG             smallint                  not null,
    INS_PROCESS_ID       varchar(255) charset utf8 not null,
    INS_DT               datetime                  not null,
    UPD_PROCESS_ID       varchar(255) charset utf8 not null,
    UPD_DT               datetime                  not null,
    UPD_EFF_DATE         datetime                  not null,
    SRC_UPD_DT           datetime                  not null,
    RN                   int                       not null,
    PART_ID              varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    constraint FK_PT_PHONE_PT
        foreign key (PT_KEY) references pt (PT_KEY)
);

