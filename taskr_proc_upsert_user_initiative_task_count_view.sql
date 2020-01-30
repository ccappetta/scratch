DROP procedure if exists proc_upsert_user_initiative_task_count_view;
create procedure proc_upsert_user_initiative_task_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.user_initiative_task_count_view as select `a`.`task_type`        AS `initiative`,
       `a`.`created_by`       AS `created_by`,
       count(`a`.`task_type`) AS `initiative_task_count`
from ', dbname,'.`task` `a`
where ((`a`.`task_type` is not null) and (`a`.`task_type` <> ''''))
group by `a`.`task_type`, `a`.`created_by`
order by `initiative_task_count` desc;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
