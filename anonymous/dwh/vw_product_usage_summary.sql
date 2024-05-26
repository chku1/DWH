create definer = elene@`%` view vw_product_usage_summary as
select `dwh`.`pt`.`PT_KEY`               AS `CUSTOMER_KEY`,
       `dwh`.`pt`.`SRC_ID`               AS `CUSTOMER_ID`,
       `dwh`.`pt`.`FIRST_NAME_LAT`       AS `FIRST_NAME`,
       `dwh`.`pt`.`FAM_NAME_LAT`         AS `LAST_NAME`,
       sum(`dwh`.`event_trn`.`TRN_AMT`)  AS `TOTAL_USAGE`,
       count(`dwh`.`event_trn`.`SRC_ID`) AS `USAGE_COUNT`
from (`dwh`.`event_trn` left join `dwh`.`pt`
      on (((`dwh`.`event_trn`.`PT_KEY` = `dwh`.`pt`.`PT_KEY`) and (`dwh`.`pt`.`PART_ID` = 'BDB0'))))
where (`dwh`.`event_trn`.`PART_ID` like 'BDB3%')
group by `dwh`.`pt`.`PT_KEY`, `dwh`.`pt`.`SRC_ID`, `dwh`.`pt`.`FIRST_NAME_LAT`, `dwh`.`pt`.`FAM_NAME_LAT`;

