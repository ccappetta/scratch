DROP procedure if exists proc_upsert_insights_projects_per_day;
create procedure proc_upsert_insights_projects_per_day(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.insights_projects_per_day as select ', dbname,'.`task`.`parent_project`                                 AS `parent_projects`,
       count(', dbname,'.`task`.`parent_project`)                          AS `project_counts`,
       dayofyear(curdate())                                                AS `day_of_year`,
       (count(', dbname,'.`task`.`parent_project`) / dayofyear(curdate())) AS `projects_per_day`
from ', dbname,'.`task`
group by ', dbname,'.`task`.`parent_project`
order by `project_counts` desc;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
