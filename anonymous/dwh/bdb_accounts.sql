create table bdb_accounts
(
    AccountID   int auto_increment
        primary key,
    CustomerID  int            null,
    AccountType varchar(20)    null,
    Balance     decimal(15, 2) null,
    DateOpened  date           null,
    constraint bdb_accounts_ibfk_1
        foreign key (CustomerID) references bdb_customers (CustomerID)
);

create index CustomerID
    on bdb_accounts (CustomerID);

