create
    definer = elene@`%` procedure ADS1_PT_BDB1_IM()
begin
INSERT INTO pt (
    FIRST_NAME_LAT,
    FAM_NAME_LAT,
    IS_INSIDER,
    START_DATE,
    PT_ID,
    SRC_SYS_ID,
    SRC_ID
)
SELECT
    FirstName,
    LastName,
    1,
    HireDate,
    EmployeeID,
    'BDB1',
    EmployeeID
FROM
    bdb_employees
ON DUPLICATE KEY UPDATE
    FIRST_NAME_LAT = VALUES(FIRST_NAME_LAT),
    FAM_NAME_LAT = VALUES(FAM_NAME_LAT),
    IS_INSIDER = VALUES(IS_INSIDER),
    START_DATE = VALUES(START_DATE),
    PT_ID = VALUES(PT_ID);
end;

