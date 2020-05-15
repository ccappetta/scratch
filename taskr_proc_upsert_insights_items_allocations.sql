DROP procedure if exists proc_upsert_insights_items_allocations;
create procedure proc_upsert_insights_items_allocations(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.insights_items_allocations as select round(((`insights_items_per_day_merged`.`items_per_day_last_2_weeks` /
               `insights_items_per_day_merged`.`items_per_day`) * 100), 2) AS `allocation`,
       `insights_items_per_day_merged`.`username`                          AS `username`
from ', dbname,'.`insights_items_per_day_merged`;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
