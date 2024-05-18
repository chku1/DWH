create table bdb_loanemployees
(
    LoanEmployeeID int auto_increment
        primary key,
    LoanID         int         null,
    EmployeeID     int         null,
    Role           varchar(20) null,
    constraint bdb_loanemployees_ibfk_1
        foreign key (LoanID) references bdb_loans (LoanID),
    constraint bdb_loanemployees_ibfk_2
        foreign key (EmployeeID) references bdb_employees (EmployeeID)
);

create index EmployeeID
    on bdb_loanemployees (EmployeeID);

create index LoanID
    on bdb_loanemployees (LoanID);

