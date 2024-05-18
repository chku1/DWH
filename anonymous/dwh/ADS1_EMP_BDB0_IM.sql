create
    definer = elene@`%` procedure ADS1_EMP_BDB0_IM()
begin
INSERT INTO emp (
    PT_KEY,
    SRC_ID,
    SRC_SYS_ID,
    POSITION,
    HIREDATE
)
SELECT
    PT.PT_KEY,
    EmployeeID,
    'BDB0',
    Position,
    HireDate
FROM
    bdb_employees
    LEFT JOIN PT ON PT.SRC_ID = bdb_employees.EmployeeID AND PT.PART_ID = 'BDB1'
ON DUPLICATE KEY UPDATE
    PT_KEY = VALUES(PT_KEY),
    POSITION = VALUES(POSITION),
    HIREDATE = VALUES(HIREDATE);

END;

