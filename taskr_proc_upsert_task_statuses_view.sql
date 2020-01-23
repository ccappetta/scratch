DROP procedure if exists proc_upsert_task_statuses_view;
create procedure proc_upsert_task_statuses_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.task_statuses_view as select distinct ', dbname,'.task.status_message AS status_message
from ', dbname,'.`task`
where ((', dbname,'.task.status_message is not null) and (', dbname,'.task.status_message <> ''''));
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
