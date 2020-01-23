DROP procedure if exists proc_upsert_parent_projects_view;
create procedure proc_upsert_parent_projects_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.parent_projects_view as
select distinct ', dbname,'.task.parent_project AS parent_project
from ', dbname,'.task
where ((', dbname,'.task.parent_project is not null) and (', dbname,'.task.parent_project <> ''''));
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
