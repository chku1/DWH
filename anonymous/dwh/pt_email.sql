create table pt_email
(
    PT_EMAIL_KEY   int auto_increment
        primary key,
    PT_KEY         int                       not null,
    CONT_PURP_KEY  int                       not null,
    EMAIL          varchar(255) charset utf8 not null,
    EMAIL_DESCR    varchar(255) charset utf8 null,
    SRC_ID         varchar(255) charset utf8 not null,
    SRC_SYS_ID     varchar(255) charset utf8 not null,
    DEL_FLAG       smallint                  not null,
    INS_PROCESS_ID varchar(255) charset utf8 not null,
    INS_DT         datetime                  not null,
    UPD_PROCESS_ID varchar(255) charset utf8 not null,
    UPD_DT         datetime                  not null,
    UPD_EFF_DATE   datetime                  not null,
    SRC_UPD_DT     datetime                  not null,
    PART_ID        varchar(255) charset utf8 as (`SRC_SYS_ID`) stored,
    RN             int                       null,
    constraint FK_PT_EMAIL_PT
        foreign key (PT_KEY) references pt (PT_KEY)
);

