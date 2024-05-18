create table bdb_employees
(
    EmployeeID  int auto_increment
        primary key,
    FirstName   varchar(50)  null,
    LastName    varchar(50)  null,
    Position    varchar(50)  null,
    Email       varchar(100) null,
    PhoneNumber varchar(15)  null,
    HireDate    date         null
);

