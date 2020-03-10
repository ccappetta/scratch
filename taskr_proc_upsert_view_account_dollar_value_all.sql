DROP procedure if exists proc_upsert_view_account_dollar_value_all;
create procedure proc_upsert_view_account_dollar_value_all(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.view_account_dollar_value_all as select sum(`B`.`account_acv`)     AS `account_acv`,
       sum(`B`.`account_tcv`)     AS `account_tcv`,
       count(`B`.`account_sf_id`) AS `account_count`,
       count(`T`.`task_id`)       AS `task_count`
from (((select sum(`A`.`account_acv`) AS `account_acv`,
               sum(`A`.`account_tcv`) AS `account_tcv`,
               `A`.`task_id`          AS `task_id`,
               `A`.`account_sf_id`    AS `account_sf_id`
        from ', dbname,'.`related_account` `A`
        group by `A`.`task_id`, `A`.`account_sf_id`)) `B`
         join ', dbname,'.`task` `T`)
where (`B`.`task_id` = `T`.`task_uuid`);

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
