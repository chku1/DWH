create definer = elene@`%` view vw_employee_loan_activity as
select `dwh`.`pt`.`PT_KEY`                                                                                       AS `EMP_KEY`,
       `dwh`.`pt`.`SRC_ID`                                                                                       AS `EMP_ID`,
       `dwh`.`pt`.`FIRST_NAME_LAT`                                                                               AS `FIRST_NAME`,
       `dwh`.`pt`.`FAM_NAME_LAT`                                                                                 AS `LAST_NAME`,
       count(distinct `dwh`.`prod_pt_rel`.`PROD_KEY`)                                                            AS `LOANSPROCESSED`,
       count(distinct (case
                           when (`dwh`.`prod_pt_rel`.`PROD_PT_REL_TP_KEY` = 3)
                               then `dwh`.`prod_pt_rel`.`PROD_KEY` end))                                         AS `LoansApproved`
from (`dwh`.`pt` left join `dwh`.`prod_pt_rel`
      on (((`dwh`.`pt`.`PT_KEY` = `dwh`.`prod_pt_rel`.`PT_KEY`) and (`dwh`.`prod_pt_rel`.`PART_ID` = 'BDB1'))))
where ((`dwh`.`pt`.`PART_ID` = 'BDB1') and (`dwh`.`pt`.`IS_INSIDER` = 1))
group by `dwh`.`pt`.`PT_KEY`, `dwh`.`pt`.`SRC_ID`, `dwh`.`pt`.`FIRST_NAME_LAT`, `dwh`.`pt`.`FAM_NAME_LAT`;

