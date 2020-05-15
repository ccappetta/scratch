DROP procedure if exists proc_upsert_insights_projects_allocations;
create procedure proc_upsert_insights_projects_allocations(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create or replace view ', dbname,'.insights_projects_allocations as select round(((`insights_projects_per_day_in_last_2_weeks`.`project_counts_last_2_weeks` /
               (select sum(`insights_projects_per_day_in_last_2_weeks`.`project_counts_last_2_weeks`)
                from ', dbname,'.`insights_projects_per_day_in_last_2_weeks`)) * 100), 2) AS `allocation`,
       `insights_projects_per_day_in_last_2_weeks`.`parent_projects_last_2_weeks`         AS `projects`
from ', dbname,'.`insights_projects_per_day_in_last_2_weeks`
order by `allocation` desc;




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
