DROP procedure if exists proc_upsert_insights_initiatives_per_day;
create procedure proc_upsert_insights_initiatives_per_day(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view insights_initiatives_per_day as select ', dbname,'.`task`.`task_type`                                 AS `initiatives`,
       count(', dbname,'.`task`.`task_type`)                          AS `initiative_counts`,
       (count(', dbname,'.`task`.`task_type`) / dayofyear(curdate())) AS `initiatives_per_day`
from ', dbname,'.`task`
group by ', dbname,'.`task`.`task_type`
order by `initiative_counts` desc;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
