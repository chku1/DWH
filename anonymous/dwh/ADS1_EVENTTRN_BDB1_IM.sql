create
    definer = elene@`%` procedure ADS1_EVENTTRN_BDB1_IM()
BEGIN
    INSERT INTO event_trn (
        snap_date,
        EVENT_TRN_TP_KEY,
        PT_KEY,
        TRN_GRD_DESCR,
        SRC_ID,
        SRC_SYS_ID
    )
    SELECT
        InteractionDate,
        event_trn_tp.EVENT_TRN_TP_KEY,
        pt.PT_KEY,
        Notes,
        InteractionID,
        'BDB1'
    FROM
        bdb_customerinteractions
        LEFT JOIN PT ON PT.SRC_ID = bdb_customerinteractions.EmployeeID AND PT.PART_ID = 'BDB1'
        LEFT JOIN event_trn_tp ON event_trn_tp.SRC_ID = bdb_customerinteractions.InteractionType AND event_trn_tp.SRC_SYS_ID = 'BDB0'
    ON DUPLICATE KEY UPDATE
        snap_date = VALUES(snap_date),
        EVENT_TRN_TP_KEY = VALUES(EVENT_TRN_TP_KEY),
        PT_KEY = VALUES(PT_KEY),
        TRN_GRD_DESCR = VALUES(TRN_GRD_DESCR);
END;

