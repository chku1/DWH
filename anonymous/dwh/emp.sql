create table emp
(
    EMP_KEY        int auto_increment
        primary key,
    PT_KEY         int                       default -1                not null,
    EMP_GRP_KEY    int                       default -1                not null,
    EMP_TP_KEY     int                       default -1                not null,
    DMN_USERNAME   varchar(255) charset utf8 default ''                not null,
    CODE           varchar(255) charset utf8 default ''                not null,
    EXT_SYS_CODE   varchar(255) charset utf8 default ''                not null,
    SRC_SYS_ID     varchar(255) charset utf8 default ''                not null,
    SRC_ID         varchar(255) charset utf8 default ''                not null,
    DEL_FLAG       smallint                  default 0                 not null,
    INS_PROCESS_ID varchar(255) charset utf8 default ''                not null,
    INS_DT         datetime                  default CURRENT_TIMESTAMP not null,
    UPD_PROCESS_ID varchar(255) charset utf8 default ''                not null,
    UPD_DT         datetime                  default CURRENT_TIMESTAMP not null,
    UPD_EFF_DATE   datetime                  default CURRENT_TIMESTAMP not null,
    SRC_UPD_DT     datetime                  default CURRENT_TIMESTAMP not null,
    PART_ID        varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    RN             int                       default -1                null,
    POSITION       varchar(255)              default ''                null,
    HIREDATE       date                      default '1000-01-01'      null,
    constraint unique_src
        unique (SRC_ID, SRC_SYS_ID),
    constraint FK_EMP_PT
        foreign key (PT_KEY) references pt (PT_KEY)
);

