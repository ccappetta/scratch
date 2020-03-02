DROP procedure if exists proc_upsert_distinct_user_projects_view;
create procedure proc_upsert_distinct_user_projects_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.user_distinct_projects_view as select parent_project, created_by
from ', dbname,'.task
where ((parent_project is not null) and (parent_project <> ''))
group by parent_project, created_by
order by parent_project;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
