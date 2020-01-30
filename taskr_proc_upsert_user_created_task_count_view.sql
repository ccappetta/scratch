DROP procedure if exists proc_upsert_user_created_task_count_view;
create procedure proc_upsert_user_created_task_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.user_created_task_count_view as select coalesce(nullif(`a`.`created_by`, ''''), ''Unattached'')              AS `task_creator`,
       count(''created_by'')                                               AS `total_user_created_tasks`,
       count((case when (`a`.`status_message` = ''Complete'') then 1 end)) AS `completed_tasks`
from ', dbname,'.`task` `a`
group by `a`.`created_by`
order by `total_user_created_tasks` desc;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
