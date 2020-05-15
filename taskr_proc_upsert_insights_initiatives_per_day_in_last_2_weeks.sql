DROP procedure if exists proc_upsert_insights_initiatives_per_day_in_last_2_weeks;
create procedure proc_upsert_insights_initiatives_per_day_in_last_2_weeks(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view insights_initiatives_per_day_in_last_2_weeks as select ', dbname,'.`task`.`task_type`                                 AS `initiatives_last_2_weeks`,
       count(', dbname,'.`task`.`task_type`)                          AS `initiative_counts_last_2_weeks`,
       (count(', dbname,'.`task`.`task_type`) / dayofyear(curdate())) AS `initiatives_per_day_last_2_weeks`
from ', dbname,'.`task`
where (', dbname,'.`task`.`created_timestamp` >= (cast(now() as date) - interval 14 day))
group by ', dbname,'.`task`.`task_type`
order by `initiative_counts_last_2_weeks` desc;




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
