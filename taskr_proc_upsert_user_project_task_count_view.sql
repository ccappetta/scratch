DROP procedure if exists proc_upsert_user_project_task_count_view;
create procedure proc_upsert_user_project_task_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view taskr_one.user_project_task_count_view as select `a`.`parent_project`        AS `parent_project`,
       `a`.`created_by`            AS `created_by`,
       count(`a`.`parent_project`) AS `project_task_count`
from ', dbname,'.`task` `a`
where ((`a`.`parent_project` is not null) and (`a`.`parent_project` <> ''''))
group by `a`.`parent_project`, `a`.`created_by`
order by `project_task_count` desc;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
