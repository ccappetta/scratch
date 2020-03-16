DROP procedure if exists proc_upsert_view_account_dollar_value_all;
create procedure proc_upsert_view_account_dollar_value_all(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.view_account_dollar_value_all as select sum(`B`.`account_acv`)     AS `account_acv`,
       sum(`B`.`account_tcv`)     AS `account_tcv`,
       count(`B`.`account_sf_id`) AS `account_count`,
       sum(`B`.`task_id_count`)   AS `task_count`
from ((select `A`.`account_acv`    AS `account_acv`,
              `A`.`account_tcv`    AS `account_tcv`,
              count(`A`.`task_id`) AS `task_id_count`,
              `A`.`account_sf_id`  AS `account_sf_id`
       from (', dbname,'.`related_account` `A`
                join ', dbname,'.`task` `T`)
       where (`A`.`task_id` = `T`.`task_uuid`)
       group by `A`.`account_sf_id`)) `B`;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
