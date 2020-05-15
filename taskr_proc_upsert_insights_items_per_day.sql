DROP procedure if exists proc_upsert_insights_items_per_day;
create procedure proc_upsert_insights_items_per_day(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create view ', dbname,'.insights_items_per_day as select ', dbname,'.`task`.`created_by`                                 AS `username`,
       count(', dbname,'.`task`.`created_by`)                          AS `user_items`,
       dayofyear(curdate())                                            AS `day_of_year`,
       (count(', dbname,'.`task`.`created_by`) / dayofyear(curdate())) AS `items_per_day`
from ', dbname,'.`task`
group by ', dbname,'.`task`.`created_by`;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
