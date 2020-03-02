DROP procedure if exists proc_upsert_view_task_opp;
create procedure proc_upsert_view_task_opp(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.view_task_opp as select `T`.`task_subject`        AS `task_subject`,
       `T`.`task_url`            AS `task_url`,
       `T`.`task_description`    AS `task_description`,
       `T`.`created_timestamp`   AS `task_creation_date`,
       `T`.`completed_timestamp` AS `task_complete_date`,
       `T`.`action_on`           AS `task_owner`,
       `T`.`task_done_fy`        AS `task_done_fy`,
       `T`.`task_done_quarter`   AS `task_done_quarter`,
       `T`.`task_done_month`     AS `task_done_month`,
       `O`.`opportunity_name`    AS `opp_name`,
       `O`.`account_sf_id`       AS `account_sf_id`,
       `O`.`opportunity_sf_id`   AS `opp_sf_id`,
       `O`.`opp_acv`             AS `opp_acv`,
       `O`.`opp_tcv`             AS `opp_tcv`,
       `O`.`is_closed`           AS `opp_is_closed`,
       `O`.`close_date`          AS `opp_close_date`,
       `O`.`close_date_fy`       AS `opp_close_fy`,
       `O`.`close_date_quarter`  AS `opp_close_quarter`,
       `O`.`close_date_month`    AS `close_date_month`,
       `O`.`opportunity_status`  AS `opp_status`,
       `O`.`opportunity_uri`     AS `opp_uri`
from (', dbname,'.`task` `T`
         join ', dbname,'.`related_opportunity` `O`)
where (`T`.`task_uuid` = `O`.`task_id`);


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
