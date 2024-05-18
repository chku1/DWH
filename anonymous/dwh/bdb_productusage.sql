create table bdb_productusage
(
    UsageID     int auto_increment
        primary key,
    CustomerID  int            null,
    ProductType varchar(50)    null,
    UsageAmount decimal(15, 2) null,
    UsageDate   datetime       null,
    constraint bdb_productusage_ibfk_1
        foreign key (CustomerID) references bdb_customers (CustomerID)
);

create index CustomerID
    on bdb_productusage (CustomerID);

