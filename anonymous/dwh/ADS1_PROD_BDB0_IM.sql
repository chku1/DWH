create
    definer = elene@`%` procedure ADS1_PROD_BDB0_IM()
BEGIN
INSERT INTO prod (
    PROD_NUM,
    CUST_PROD_DESCR,
    OPEN_DATE,
    DUR,
    SRC_ID,
    SRC_SYS_ID
)
SELECT
    LoanID,
    LoanType,
    StartDate,
    LoanTerm,
    LoanID,
    'BDB0'
FROM
    bdb_loans
ON DUPLICATE KEY UPDATE
    PROD_NUM = VALUES(PROD_NUM),
    CUST_PROD_DESCR = VALUES(CUST_PROD_DESCR),
    OPEN_DATE = VALUES(OPEN_DATE),
    DUR = VALUES(DUR);
END;

