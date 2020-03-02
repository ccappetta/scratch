DROP procedure if exists proc_upsert_sf_opps_touched_by_fy_q_mo;
create procedure proc_upsert_sf_opps_touched_by_fy_q_mo(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.sf_opps_touched_by_fy_q_mo as select sum(`O`.`opp_acv`)             AS `opp_acv`,
       sum(`O`.`opp_tcv`)             AS `opp_tcv`,
       count(`O`.`opportunity_sf_id`) AS `opp_count`,
       `O`.`opportunity_status`       AS `opp_stage`,
       `O`.`is_closed`                AS `opp_is_closed`,
       `O`.`close_date`               AS `opp_close_date`,
       count(`T`.`task_id`)           AS `task_count`,
       `T`.`completed_timestamp`      AS `task_done_on`,
       `T`.`task_done_fy`             AS `task_done_fy`,
       `T`.`task_done_quarter`        AS `task_done_quarter`,
       `T`.`task_done_month`          AS `task_done_month`
from (', dbname,'.`related_opportunity` `O`
         join ', dbname,'.`task` `T`)
where (`O`.`task_id` = `T`.`task_uuid`)
group by `O`.`opportunity_status`, `T`.`task_done_fy`, `T`.`task_done_quarter`, `T`.`task_done_month`;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
