DROP procedure if exists proc_upsert_sf_dollar_value_by_teammate;
create procedure proc_upsert_sf_dollar_value_by_teammate(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.sf_dollar_value_by_teammate as select sum(`O`.`opp_acv`)             AS `opp_acv`,
       sum(`O`.`opp_tcv`)             AS `opp_tcv`,
       count(`O`.`opportunity_sf_id`) AS `opp_count`,
       `O`.`opportunity_status`       AS `opp_stage`,
       count(`T`.`task_id`)           AS `task_count`,
       `T`.`action_on`                AS `team_member`
from (', dbname,'.`related_opportunity` `O`
         join ', dbname,'.`task` `T`)
where ((`O`.`task_id` = `T`.`task_uuid`) and (`O`.`is_closed` = ''true''))
group by `T`.`action_on`;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
