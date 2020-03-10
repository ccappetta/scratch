DROP procedure if exists proc_upsert_distinct_opps_view;
create procedure proc_upsert_distinct_opps_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.distinct_opps as select count(`T`.`task_uuid`)   AS `task_count`,
       `O`.`opportunity_name`   AS `opp_name`,
       `O`.`opportunity_sf_id`  AS `opportunity_sf_id`,
       `O`.`account_sf_id`      AS `account_sf_id`,
       `O`.`opportunity_sf_id`  AS `opp_sf_id`,
       `O`.`opp_acv`            AS `opp_acv`,
       `O`.`opp_tcv`            AS `opp_tcv`,
       `O`.`is_closed`          AS `opp_is_closed`,
       `O`.`close_date`         AS `close_date`,
       `O`.`close_date_fy`      AS `close_date_fy`,
       `O`.`close_date_quarter` AS `close_date_quarter`,
       `O`.`close_date_month`   AS `close_date_month`,
       `O`.`opportunity_status` AS `opportunity_status`,
       `O`.`opportunity_uri`    AS `opportunity_uri`,
       `O`.`is_closed`          AS `is_closed`
from (', dbname,'.`task` `T`
         join ', dbname,'.`related_opportunity` `O`)
where (`T`.`task_uuid` = `O`.`task_id`)
group by `O`.`opportunity_sf_id`;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
