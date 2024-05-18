create table bdb_customers
(
    CustomerID  int auto_increment
        primary key,
    FirstName   varchar(50)  null,
    LastName    varchar(50)  null,
    DateOfBirth date         null,
    Gender      varchar(10)  null,
    Email       varchar(100) null,
    PhoneNumber varchar(255) null,
    Address     varchar(255) null,
    City        varchar(50)  null,
    State       varchar(50)  null,
    ZipCode     varchar(10)  null
);

