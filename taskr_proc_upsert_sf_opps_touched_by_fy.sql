DROP procedure if exists proc_upsert_sf_opps_touched_by_fy;
create procedure proc_upsert_sf_opps_touched_by_fy(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.sf_opps_touched_by_fy as select sum(`O`.`opp_acv`)             AS `opp_acv`,
       sum(`O`.`opp_tcv`)             AS `opp_tcv`,
       count(`O`.`opportunity_sf_id`) AS `opp_count`,
       `O`.`opportunity_status`       AS `opp_stage`,
       `O`.`is_closed`                AS `opp_is_closed`,
       `O`.`close_date`               AS `opp_close_date`,
       count(`T`.`task_id`)           AS `task_count`,
       `T`.`completed_timestamp`      AS `task_done_on`,
       `T`.`task_done_fy`             AS `task_done_fy`
from (', dbname,'.`related_opportunity` `O`
         join ', dbname,'.`task` `T`)
where (`O`.`task_id` = `T`.`task_uuid`)
group by `O`.`opportunity_status`, `T`.`task_done_fy`;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
