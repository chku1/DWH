create
    definer = elene@`%` procedure ADS1_PRODPTREL_BDB0_IM()
BEGIN
INSERT INTO prod_pt_rel (
    PROD_KEY,
    PT_KEY,
    PROD_PT_REL_TP_KEY,
    SRC_ID,
    SRC_SYS_ID
)
SELECT
    prod.PROD_KEY,
    pt.PT_KEY,
    1,
    CONCAT(prod.SRC_ID, '.', pt.SRC_ID),
    'BDB0'
FROM
    bdb_loans
    INNER JOIN PROD ON PROD.SRC_ID = bdb_loans.LoanID AND PROD.PART_ID = 'BDB0'
    INNER JOIN PT ON PT.SRC_ID = bdb_loans.CustomerID AND PT.PART_ID = 'BDB0'
ON DUPLICATE KEY UPDATE
    PROD_KEY = VALUES(PROD_KEY),
    PT_KEY = VALUES(PT_KEY),
    PROD_PT_REL_TP_KEY = VALUES(PROD_PT_REL_TP_KEY),
    SRC_ID = VALUES(SRC_ID),
    SRC_SYS_ID = VALUES(SRC_SYS_ID);

END;

