DROP procedure if exists proc_upsert_view_task_account;
create procedure proc_upsert_view_task_account(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.view_task_account as select `A`.`account_sf_id`           AS `account_sf_id`,
       `A`.`account_name`            AS `account_name`,
       `A`.`account_owner_name`      AS `account_owner_name`,
       `A`.`account_status`          AS `account_status`,
       `A`.`account_acv`             AS `account_acv`,
       `A`.`account_tcv`             AS `account_tcv`,
       `A`.`account_uri`             AS `account_uri`,
       `T`.`task_subject`            AS `task_subject`,
       `T`.`task_uuid`               AS `task_id`,
       `T`.`task_description`        AS `task_description`,
       `T`.`last_modified_timestamp` AS `task_last_modified`,
       `T`.`completed_timestamp`     AS `task_completed_timestamp`,
       `T`.`created_by`              AS `task_created_by`,
       `T`.`is_complete`             AS `task_is_complete`,
       `T`.`task_type`               AS `task_type`
from (', dbname,'.`related_account` `A`
         join ', dbname,'.`task` `T`)
where (`A`.`task_id` = `T`.`task_uuid`);




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
