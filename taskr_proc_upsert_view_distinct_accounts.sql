DROP procedure if exists proc_upsert_view_distinct_accounts;
create procedure proc_upsert_view_distinct_accounts(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.distinct_accounts as select `A`.`account_name`       AS `account_name`,
       `A`.`account_acv`        AS `account_acv`,
       `A`.`account_tcv`        AS `account_tcv`,
       count(`A`.`task_id`)     AS `task_id_count`,
       `A`.`account_sf_id`      AS `account_sf_id`,
       `A`.`account_owner_name` AS `account_owner`,
       `A`.`account_status`     AS `account_status`,
       `A`.`account_uri`        AS `account_uri`
from (', dbname,'.`related_account` `A`
         join ', dbname,'.`task` `T`)
where (`A`.`task_id` = `T`.`task_uuid`)
group by `A`.`account_sf_id`;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
