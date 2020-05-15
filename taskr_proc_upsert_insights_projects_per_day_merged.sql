DROP procedure if exists proc_upsert_insights_projects_per_day_merged;
create procedure proc_upsert_insights_projects_per_day_merged(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create view ', dbname,'.insights_projects_per_day_merged as select `t1`.`parent_projects`               AS `projects`,
       `t1`.`projects_per_day`              AS `projects_per_day`,
       `t1`.`day_of_year`                   AS `day_of_year`,
       `t2`.`projects_per_day_last_2_weeks` AS `projects_per_day_last_2_weeks`,
       `t2`.`parent_projects_last_2_weeks`  AS `user_projects_last_2_weeks`
from (', dbname,'.`insights_projects_per_day` `t1`
         join ', dbname,'.`insights_projects_per_day_in_last_2_weeks` `t2`
              on ((`t1`.`parent_projects` = `t2`.`parent_projects_last_2_weeks`)));


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
