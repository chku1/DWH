create
    definer = elene@`%` procedure ADS1_POS_BDB0_IM()
BEGIN
    INSERT INTO POS (
        POS_ID,
        POS_DESCR,
        SRC_ID,
        SRC_SYS_ID,
        ADDRESS,
        CITY,
        ZIPCODE
    )
    SELECT
        BranchID,
        BranchName,
        BranchID,
        'BDB0',
        BranchAddress,
        BranchCity,
        BranchZipCode
    FROM
        bdb_branches
    ON DUPLICATE KEY UPDATE
        POS_ID = VALUES(POS_ID),
        POS_DESCR = VALUES(POS_DESCR),
        ADDRESS = VALUES(ADDRESS),
        CITY = VALUES(CITY),
        ZIPCODE = VALUES(ZIPCODE);
END;

