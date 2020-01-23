DROP procedure if exists proc_upsert_task_types_view;
create procedure proc_upsert_task_types_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.task_types_view as select distinct ', dbname,'.task.task_type AS task_type
from ', dbname,'.task
where ((', dbname,'.task.task_type is not null) and (', dbname,'.task.task_type <> ''''));
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
