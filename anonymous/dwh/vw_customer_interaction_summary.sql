create definer = elene@`%` view vw_customer_interaction_summary as
select `dwh`.`pt`.`PT_KEY`               AS `CUSTOMER_KEY`,
       `dwh`.`pt`.`SRC_ID`               AS `CUSTOMER_ID`,
       `dwh`.`event_trn_tp`.`DESCR_LAT`  AS `INTERCATION_TYPE`,
       `dwh`.`event_trn`.`SNAP_DATE`     AS `INTERACTION_DATE`,
       `pt_2`.`SRC_ID`                   AS `EMPLOYEE_ID`,
       `pt_2`.`FIRST_NAME_LAT`           AS `FIRST_NAME_EMPLOYEE`,
       `pt_2`.`FAM_NAME_LAT`             AS `LAST_NAME_EMPLOYEE`,
       count(`dwh`.`event_trn`.`SRC_ID`) AS `INTERACTION_COUNT`
from ((((`dwh`.`event_trn` left join `dwh`.`pt` on (((`dwh`.`pt`.`PT_KEY` = `dwh`.`event_trn`.`PT_KEY`) and
                                                     (`dwh`.`pt`.`PART_ID` = 'BDB0')))) left join `dwh`.`event_trn_tp`
        on ((`dwh`.`event_trn_tp`.`EVENT_TRN_TP_KEY` =
             `dwh`.`event_trn`.`EVENT_TRN_TP_KEY`))) left join `dwh`.`event_trn` `event_trn_2`
       on (((`dwh`.`event_trn`.`SRC_ID` = `event_trn_2`.`SRC_ID`) and
            (`event_trn_2`.`PART_ID` like 'BDB1%')))) left join `dwh`.`pt` `pt_2`
      on (((`pt_2`.`PT_KEY` = `event_trn_2`.`PT_KEY`) and (`pt_2`.`PART_ID` = 'BDB1'))))
where (`dwh`.`event_trn`.`PART_ID` like 'BDB2%')
group by `dwh`.`pt`.`PT_KEY`, `dwh`.`pt`.`SRC_ID`, `dwh`.`event_trn_tp`.`DESCR_LAT`, `dwh`.`event_trn`.`SNAP_DATE`,
         `pt_2`.`SRC_ID`, `pt_2`.`FIRST_NAME_LAT`, `pt_2`.`FAM_NAME_LAT`;

