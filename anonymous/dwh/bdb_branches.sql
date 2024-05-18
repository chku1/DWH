create table bdb_branches
(
    BranchID      int auto_increment
        primary key,
    BranchName    varchar(100) null,
    BranchAddress varchar(255) null,
    BranchCity    varchar(50)  null,
    BranchState   varchar(50)  null,
    BranchZipCode varchar(10)  null
);

