create
    definer = elene@`%` procedure ADS1_ENTRTRN_BDB0_IM()
BEGIN
    INSERT INTO entr_trn (
        SNAP_DATE,
        ENTR_TRN_TP_KEY,
        PROD_KEY,
        TRN_AMT,
        TRN_VAL_DATE,
        TRN_ENTR_DATE,
        ENTR_TRN_ID,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT
        PaymentDate,
        entr_trn_tp.ENTR_TRN_TP_KEY,
        PROD.PROD_KEY,
        PaymentAmount,
        PaymentDate,
        PaymentDate,
        PaymentID,
        PaymentID,
        'BDB0'
    FROM
        bdb_payments
        LEFT JOIN PROD ON PROD.SRC_ID = bdb_payments.LoanID AND PROD.PART_ID = 'BDB0'
        LEFT JOIN entr_trn_tp ON entr_trn_tp.SRC_ID = bdb_payments.PaymentMethod AND entr_trn_tp.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        SNAP_DATE = VALUES(SNAP_DATE),
        ENTR_TRN_TP_KEY = VALUES(ENTR_TRN_TP_KEY),
        PROD_KEY = VALUES(PROD_KEY),
        TRN_AMT = VALUES(TRN_AMT),
        TRN_VAL_DATE = VALUES(TRN_VAL_DATE),
        TRN_ENTR_DATE = VALUES(TRN_ENTR_DATE),
        ENTR_TRN_ID = VALUES(ENTR_TRN_ID);
END;

