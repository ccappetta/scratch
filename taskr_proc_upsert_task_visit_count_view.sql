DROP procedure if exists proc_upsert_task_visit_count_view;
create procedure proc_upsert_task_visit_count_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.task_types_view as select distinct ', dbname,'.task.task_type AS task_type
from ', dbname,'.task
where ((', dbname,'.task.task_type is not null) and (', dbname,'.task.task_type <> ''''));

create or replace view ', dbname,'.task_visit_count_view as select `a`.`task_uuid`              AS `task_uuid`,
       `a`.`task_subject`           AS `task_subject`,
       count(`b`.`viewing_task_id`) AS `view_count`
from (', dbname,'.`task` `a`
         join ', dbname,'.`access_log` `b` on ((`a`.`task_uuid` = `b`.`viewing_task_id`)))
group by `a`.`task_uuid`, `a`.`task_subject`;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
