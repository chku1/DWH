create
    definer = elene@`%` procedure ADS1_PT_BDB0_IM()
BEGIN
    INSERT INTO PT (
        PT_TP_KEY, GENDER_KEY, FIRST_NAME_LAT, FAM_NAME_LAT, BRTH_DATE, PT_ID, SRC_SYS_ID, SRC_ID,
        INS_DT, UPD_DT, UPD_EFF_DATE, SRC_UPD_DT
    )
    SELECT
        1,
        CASE WHEN Gender = 'FEMALE' THEN 2 ELSE 1 END AS GENDER_KEY,
        FirstName,
        LastName,
        DateOfBirth,
        CustomerID,
        'BDB0',
        CustomerID,
        NOW(),
        NOW(),
        NOW(),
        NOW()
    FROM
        bdb_customers
    ON DUPLICATE KEY UPDATE
        PT_TP_KEY = VALUES(PT_TP_KEY),
        GENDER_KEY = VALUES(GENDER_KEY),
        FIRST_NAME_LAT = VALUES(FIRST_NAME_LAT),
        FAM_NAME_LAT = VALUES(FAM_NAME_LAT),
        BRTH_DATE = VALUES(BRTH_DATE),
        PT_ID = VALUES(PT_ID);
END;

