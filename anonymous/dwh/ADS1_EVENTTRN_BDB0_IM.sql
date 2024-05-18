create
    definer = elene@`%` procedure ADS1_EVENTTRN_BDB0_IM()
BEGIN
    INSERT INTO event_trn (
        SNAP_DATE,
        EVENT_TRN_TP_KEY,
        PT_KEY,
        ACC_KEY,
        ACC_NUM,
        TRN_AMT,
        TRN_VAL_DATE,
        TRN_ENTR_DATE,
        EVENT_TRN_ID,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT
        TransactionDate,
        event_trn_tp.EVENT_TRN_TP_KEY,
        acc.PT_KEY,
        acc.ACC_KEY,
        AccountID,
        Amount,
        TransactionDate,
        TransactionDate,
        TransactionID,
        TransactionID,
        'BDB0'
    FROM
        bdb_transactions
        LEFT JOIN ACC ON ACC.SRC_ID = bdb_transactions.AccountID AND ACC.PART_ID = 'BDB0'
        LEFT JOIN event_trn_tp ON event_trn_tp.SRC_ID = bdb_transactions.TransactionType AND event_trn_tp.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        SNAP_DATE = VALUES(SNAP_DATE),
        EVENT_TRN_TP_KEY = VALUES(EVENT_TRN_TP_KEY),
        PT_KEY = VALUES(PT_KEY),
        ACC_KEY = VALUES(ACC_KEY),
        ACC_NUM = VALUES(ACC_NUM),
        TRN_AMT = VALUES(TRN_AMT),
        TRN_VAL_DATE = VALUES(TRN_VAL_DATE),
        TRN_ENTR_DATE = VALUES(TRN_ENTR_DATE),
        EVENT_TRN_ID = VALUES(EVENT_TRN_ID);
END;

