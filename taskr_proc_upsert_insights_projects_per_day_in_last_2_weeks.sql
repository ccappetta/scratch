DROP procedure if exists proc_upsert_insights_projects_per_day_in_last_2_weeks;
create procedure proc_upsert_insights_projects_per_day_in_last_2_weeks(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.insights_projects_per_day_in_last_2_weeks as select ', dbname,'.`task`.`parent_project`                                 AS `parent_projects_last_2_weeks`,
       count(', dbname,'.`task`.`parent_project`)                          AS `project_counts_last_2_weeks`,
       (count(', dbname,'.`task`.`parent_project`) / dayofyear(curdate())) AS `projects_per_day_last_2_weeks`
from ', dbname,'.`task`
where (', dbname,'.`task`.`created_timestamp` >= (cast(now() as date) - interval 14 day))
group by ', dbname,'.`task`.`parent_project`
order by `project_counts_last_2_weeks` desc;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
