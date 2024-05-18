create table prod_pt_rel
(
    PROD_PT_REL_KEY    int auto_increment
        primary key,
    PROD_KEY           int                       default -1                not null,
    PT_KEY             int                       default -1                not null,
    PROD_PT_REL_TP_KEY int                       default -1                not null,
    SRC_ID             varchar(255) charset utf8 default ''                not null,
    SRC_SYS_ID         varchar(255) charset utf8 default ''                not null,
    DEL_FLAG           smallint                  default 0                 not null,
    INS_PROCESS_ID     varchar(255) charset utf8 default ''                not null,
    INS_DT             datetime                  default CURRENT_TIMESTAMP not null,
    UPD_PROCESS_ID     varchar(255) charset utf8 default ''                not null,
    UPD_DT             datetime                  default CURRENT_TIMESTAMP not null,
    UPD_EFF_DATE       datetime                  default CURRENT_TIMESTAMP not null,
    SRC_UPD_DT         datetime                  default CURRENT_TIMESTAMP not null,
    RN                 int                       default -1                not null,
    PART_ID            varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    constraint unique_src
        unique (SRC_ID, SRC_SYS_ID),
    constraint FK_PROD_PT_REL_PROD
        foreign key (PROD_KEY) references prod (PROD_KEY),
    constraint FK_PROD_PT_REL_PT
        foreign key (PT_KEY) references pt (PT_KEY)
);

