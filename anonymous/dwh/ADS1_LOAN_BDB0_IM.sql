create
    definer = elene@`%` procedure ADS1_LOAN_BDB0_IM()
BEGIN
    INSERT INTO loan (
        PROD_KEY,
        LOAN_TP_KEY,
        NOM_AMT,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT
        prod.PROD_KEY,
        loan_tp.LOAN_TP_KEY,
        LoanAmount,
        LoanID,
        'BDB0'
    FROM
        bdb_loans
        LEFT JOIN PROD ON PROD.SRC_ID = bdb_loans.LoanID AND PROD.PART_ID = 'BDB0'
        LEFT JOIN LOAN_TP ON LOAN_TP.DESCR_LAT = bdb_loans.LoanType AND LOAN_TP.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        PROD_KEY = VALUES(PROD_KEY),
        LOAN_TP_KEY = VALUES(LOAN_TP_KEY),
        NOM_AMT = VALUES(NOM_AMT);
END;

