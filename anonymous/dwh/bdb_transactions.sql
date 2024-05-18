create table bdb_transactions
(
    TransactionID   int auto_increment
        primary key,
    AccountID       int            null,
    TransactionDate date           null,
    TransactionType varchar(20)    null,
    Amount          decimal(15, 2) null,
    constraint bdb_transactions_ibfk_1
        foreign key (AccountID) references bdb_accounts (AccountID)
);

create index AccountID
    on bdb_transactions (AccountID);

