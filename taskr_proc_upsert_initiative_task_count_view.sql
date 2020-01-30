DROP procedure if exists proc_upsert_initiative_task_count_view;
create procedure proc_upsert_initiative_task_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.initiative_task_count_view as select coalesce(nullif(`a`.`task_type`, ''''), ''Unattached'')               AS `initiative`,
       count(''task_type'')                                                AS `total_initiative_tasks`,
       count((case when (`a`.`status_message` = ''Complete'') then 1 end)) AS `completed_initiative_tasks`
from ', dbname,'.`task` `a`
group by `a`.`task_type`
order by `total_initiative_tasks` desc;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
