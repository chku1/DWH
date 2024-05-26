create definer = elene@`%` view vw_transaction_summary as
select `dwh`.`event_trn`.`EVENT_TRN_KEY` AS `TRANSACTION_KEY`,
       `dwh`.`event_trn`.`SRC_ID`        AS `TRANSACTION_ID`,
       `dwh`.`event_trn`.`SNAP_DATE`     AS `TRANSACTION_DATE`,
       `dwh`.`event_trn`.`TRN_AMT`       AS `TRANSACTION_AMOUNT`,
       `dwh`.`pt`.`SRC_ID`               AS `CUSTOMER_ID`,
       `dwh`.`pt`.`FIRST_NAME_LAT`       AS `FIRST_NAME`,
       `dwh`.`pt`.`FAM_NAME_LAT`         AS `LAST_NAME`
from ((`dwh`.`event_trn` left join `dwh`.`acc` on (((`dwh`.`event_trn`.`ACC_KEY` = `dwh`.`acc`.`ACC_KEY`) and
                                                    (`dwh`.`acc`.`PART_ID` = 'BDB0')))) left join `dwh`.`pt`
      on (((`dwh`.`pt`.`PT_KEY` = `dwh`.`event_trn`.`PT_KEY`) and (`dwh`.`pt`.`PART_ID` = 'BDB0'))))
where (`dwh`.`event_trn`.`PART_ID` like 'BDB0%');

