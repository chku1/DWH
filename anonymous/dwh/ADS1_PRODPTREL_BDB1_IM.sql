create
    definer = elene@`%` procedure ADS1_PRODPTREL_BDB1_IM()
BEGIN
    INSERT INTO prod_pt_rel (
        PROD_KEY,
        PT_KEY,
        PROD_PT_REL_TP_KEY,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT DISTINCT
        PROD.PROD_KEY,
        PT.PT_KEY,
        prod_pt_rel_tp.PROD_PT_REL_TP_KEY,
        CONCAT(prod.SRC_ID, '.', pt.SRC_ID, '.', prod_pt_rel_tp.PROD_PT_REL_TP_KEY),
        'BDB1'
    FROM
        bdb_loanemployees
        INNER JOIN PT ON PT.SRC_ID = bdb_loanemployees.EmployeeID AND PT.PART_ID = 'BDB1'
        INNER JOIN PROD ON PROD.SRC_ID = bdb_loanemployees.LoanID AND PROD.PART_ID = 'BDB0'
        LEFT JOIN prod_pt_rel_tp ON prod_pt_rel_tp.DESCR_LAT = bdb_loanemployees.Role AND prod_pt_rel_tp.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        PROD_KEY = VALUES(PROD_KEY),
        PT_KEY = VALUES(PT_KEY),
        PROD_PT_REL_TP_KEY = VALUES(PROD_PT_REL_TP_KEY);
END;

