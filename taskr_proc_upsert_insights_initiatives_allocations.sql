DROP procedure if exists proc_upsert_insights_initiatives_allocations;
create procedure proc_upsert_insights_initiatives_allocations(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.insights_initiatives_allocations as select round(((`insights_initiatives_per_day_in_last_2_weeks`.`initiative_counts_last_2_weeks` /
               (select sum(`insights_initiatives_per_day_in_last_2_weeks`.`initiative_counts_last_2_weeks`)
                from ', dbname,'.`insights_initiatives_per_day_in_last_2_weeks`)) * 100), 2) AS `allocation`,
       `insights_initiatives_per_day_in_last_2_weeks`.`initiatives_last_2_weeks`             AS `initiatives`
from ', dbname,'.`insights_initiatives_per_day_in_last_2_weeks`
order by `allocation` desc;




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
