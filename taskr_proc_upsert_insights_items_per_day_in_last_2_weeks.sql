DROP procedure if exists proc_upsert_insights_items_per_day_in_last_2_weeks;
create procedure proc_upsert_insights_items_per_day_in_last_2_weeks(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.insights_items_per_day_in_last_2_weeks as select ', dbname,'.`task`.`created_by`               AS `username`,
       count(', dbname,'.`task`.`created_by`)        AS `user_items_last_2_weeks`,
       dayofyear(curdate())                          AS `day_of_year`,
       (count(', dbname,'.`task`.`created_by`) / 14) AS `items_per_day_last_2_weeks`
from ', dbname,'.`task`
where (', dbname,'.`task`.`created_timestamp` >= (cast(now() as date) - interval 14 day))
group by ', dbname,'.`task`.`created_by`;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
