create
    definer = elene@`%` procedure ADS1_EVENTTRN_BDB3_IM()
BEGIN
    INSERT INTO event_trn (
        SNAP_DATE,
        EVENT_TRN_TP_KEY,
        PT_KEY,
        TRN_AMT,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT
        UsageDate,
        event_trn_tp.EVENT_TRN_TP_KEY,
        pt.PT_KEY,
        UsageAmount,
        UsageID,
        'BDB3'
    FROM
        bdb_productusage
        LEFT JOIN PT ON PT.SRC_ID = bdb_productusage.CustomerID AND PT.PART_ID = 'BDB0'
        LEFT JOIN event_trn_tp ON event_trn_tp.SRC_ID = bdb_productusage.ProductType AND event_trn_tp.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        SNAP_DATE = VALUES(SNAP_DATE),
        EVENT_TRN_TP_KEY = VALUES(EVENT_TRN_TP_KEY),
        PT_KEY = VALUES(PT_KEY),
        TRN_AMT = VALUES(TRN_AMT);
END;

