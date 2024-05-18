create table bdb_payments
(
    PaymentID     int auto_increment
        primary key,
    LoanID        int            null,
    PaymentDate   date           null,
    PaymentAmount decimal(15, 2) null,
    PaymentMethod varchar(20)    null,
    constraint bdb_payments_ibfk_1
        foreign key (LoanID) references bdb_loans (LoanID)
);

create index LoanID
    on bdb_payments (LoanID);

