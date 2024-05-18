create table bdb_customerinteractions
(
    InteractionID   int auto_increment
        primary key,
    CustomerID      int         null,
    EmployeeID      int         null,
    InteractionType varchar(50) null,
    InteractionDate datetime    null,
    Notes           text        null,
    constraint bdb_customerinteractions_ibfk_1
        foreign key (CustomerID) references bdb_customers (CustomerID),
    constraint bdb_customerinteractions_ibfk_2
        foreign key (EmployeeID) references bdb_employees (EmployeeID)
);

create index CustomerID
    on bdb_customerinteractions (CustomerID);

create index EmployeeID
    on bdb_customerinteractions (EmployeeID);

