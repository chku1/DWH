create
    definer = elene@`%` procedure ADS1_ACC_BDB0_IM()
begin
INSERT INTO ACC (
    PT_KEY,
    ACC_TP_KEY,
    ACC_ID,
    OPEN_DATE,
    SRC_ID,
    SRC_SYS_ID
)
SELECT
    PT.PT_KEY,
    ACC_TP.ACC_TP_KEY,
    bdb_accounts.AccountID,
    bdb_accounts.DateOpened,
    bdb_accounts.AccountID,
    'BDB0'
FROM
    bdb_accounts
    LEFT JOIN PT ON PT.SRC_ID = bdb_accounts.CustomerID AND PT.PART_ID = 'BDB0'
    LEFT JOIN ACC_TP ON ACC_TP.SRC_ID = bdb_accounts.AccountType AND ACC_TP.SRC_SYS_ID = 'BDB0'
ON DUPLICATE KEY UPDATE
    PT_KEY = VALUES(PT_KEY),
    ACC_TP_KEY = VALUES(ACC_TP_KEY),
    ACC_ID = VALUES(ACC_ID),
    OPEN_DATE = VALUES(OPEN_DATE);
end;

