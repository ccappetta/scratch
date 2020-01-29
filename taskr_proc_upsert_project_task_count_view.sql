DROP procedure if exists proc_upsert_project_task_count_view;
create procedure proc_upsert_project_task_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view taskr_one.project_task_count_view as select coalesce(nullif(`a`.`parent_project`, ''''), ''Unattached'')          AS `parent_project`,
       count(''parent_project'')                                           AS `total_project_tasks`,
       count((case when (`a`.`status_message` = ''Complete'') then 1 end)) AS `completed_project_tasks`
from ', dbname,'.`task` `a`
group by `a`.`parent_project`
order by `total_project_tasks` desc;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
