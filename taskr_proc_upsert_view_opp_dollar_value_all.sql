DROP procedure if exists proc_upsert_view_opp_dollar_value_all;
create procedure proc_upsert_view_opp_dollar_value_all(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.view_opp_dollar_value_all as select sum(`O`.`opp_acv`)             AS `opp_acv`,
       sum(`O`.`opp_tcv`)             AS `opp_tcv`,
       count(`O`.`opportunity_sf_id`) AS `opp_count`,
       `O`.`opportunity_status`       AS `opp_stage`,
       `O`.`is_closed`                AS `opp_is_closed`,
       sum(`O`.`task_count`)          AS `task_count`
from ', dbname,'.`distinct_opps` `O`;




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
