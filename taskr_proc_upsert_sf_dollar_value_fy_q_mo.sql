DROP procedure if exists proc_upsert_sf_dollar_value_fy_q_mo;
create procedure proc_upsert_sf_dollar_value_fy_q_mo(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.sf_dollar_value_fy_q_mo as select sum(`O`.`opp_acv`)             AS `opp_acv`,
       sum(`O`.`opp_tcv`)             AS `opp_tcv`,
       count(`O`.`opportunity_sf_id`) AS `opp_count`,
       `O`.`opportunity_status`       AS `opp_stage`,
       `O`.`is_closed`                AS `opp_is_closed`,
       `O`.`close_date`               AS `opp_close_date`,
       count(`T`.`task_id`)           AS `task_count`,
       `O`.`close_date_month`         AS `closed_month`,
       `O`.`close_date_quarter`       AS `closed_quarter`,
       `O`.`close_date_fy`            AS `closed_fiscalyear`
from (', dbname,'.`related_opportunity` `O`
         join ', dbname,'.`task` `T`)
where ((`O`.`task_id` = `T`.`task_uuid`) and (`O`.`is_closed` = ''true''))
group by `O`.`close_date_month`, `O`.`close_date_fy`, `O`.`close_date_quarter`;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
