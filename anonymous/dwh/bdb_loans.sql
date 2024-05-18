create table bdb_loans
(
    LoanID       int auto_increment
        primary key,
    CustomerID   int            null,
    LoanType     varchar(20)    null,
    LoanAmount   decimal(15, 2) null,
    InterestRate decimal(5, 2)  null,
    LoanTerm     int            null,
    StartDate    date           null,
    constraint bdb_loans_ibfk_1
        foreign key (CustomerID) references bdb_customers (CustomerID)
);

create index CustomerID
    on bdb_loans (CustomerID);

