create definer = elene@`%` view vw_customer_loan_summary as
select `dwh`.`pt`.`PT_KEY`                                                     AS `CUSTOMER_KEY`,
       `dwh`.`pt`.`SRC_ID`                                                     AS `CUSTOMER_ID`,
       `dwh`.`pt`.`FIRST_NAME_LAT`                                             AS `FIRST_NAME`,
       `dwh`.`pt`.`FAM_NAME_LAT`                                               AS `LAST_NAME`,
       `dwh`.`loan`.`SRC_ID`                                                   AS `LOAN_ID`,
       `dwh`.`loan`.`NOM_AMT`                                                  AS `LOAN_AMOUNT`,
       `dwh`.`loan_tp`.`DESCR_LAT`                                             AS `LOANTYPE`,
       `dwh`.`prod`.`OPEN_DATE`                                                AS `START_DATE`,
       `dwh`.`prod`.`DUR`                                                      AS `LOANDURATION`,
       coalesce(sum(`dwh`.`entr_trn`.`TRN_AMT`), 0)                            AS `TOTALPAYMENTS`,
       (`dwh`.`loan`.`NOM_AMT` - coalesce(sum(`dwh`.`entr_trn`.`TRN_AMT`), 0)) AS `OUTSTANDINGAMOUNT`
from (((((`dwh`.`pt` left join `dwh`.`prod_pt_rel` on (((`dwh`.`prod_pt_rel`.`PT_KEY` = `dwh`.`pt`.`PT_KEY`) and
                                                        (`dwh`.`prod_pt_rel`.`PART_ID` = 'BDB0')))) left join `dwh`.`prod`
         on (((`dwh`.`prod`.`PROD_KEY` = `dwh`.`prod_pt_rel`.`PROD_KEY`) and
              (`dwh`.`prod`.`PART_ID` = 'BDB0')))) left join `dwh`.`loan`
        on (((`dwh`.`loan`.`PROD_KEY` = `dwh`.`prod`.`PROD_KEY`) and
             (`dwh`.`loan`.`PART_ID` = 'BDB0')))) left join `dwh`.`loan_tp`
       on (((`dwh`.`loan`.`LOAN_TP_KEY` = `dwh`.`loan_tp`.`LOAN_TP_KEY`) and
            (`dwh`.`loan_tp`.`SRC_SYS_ID` = 'BDB0')))) left join `dwh`.`entr_trn`
      on (((`dwh`.`entr_trn`.`PROD_KEY` = `dwh`.`prod`.`PROD_KEY`) and (`dwh`.`entr_trn`.`PART_ID` like 'BDB0%'))))
where (`dwh`.`pt`.`PART_ID` = 'BDB0')
group by `dwh`.`pt`.`PT_KEY`, `dwh`.`pt`.`SRC_ID`, `dwh`.`pt`.`FIRST_NAME_LAT`, `dwh`.`pt`.`FAM_NAME_LAT`,
         `dwh`.`loan`.`SRC_ID`, `dwh`.`loan`.`NOM_AMT`, `dwh`.`loan_tp`.`DESCR_LAT`, `dwh`.`prod`.`OPEN_DATE`,
         `dwh`.`prod`.`DUR`;

