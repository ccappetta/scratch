DROP procedure if exists proc_upsert_insights_initiatives_per_day_merged2;
create procedure proc_upsert_insights_initiatives_per_day_merged2(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.insights_initiatives_per_day_merged2 as select `t1`.`initiatives`                      AS `initiatives`,
       `t1`.`initiative_counts`                AS `initiatives_counts`,
       `t1`.`initiatives_per_day`              AS `initiatives_per_day`,
       `t2`.`initiatives_per_day_last_2_weeks` AS `initiatives_per_day_last_2_weeks`,
       `t2`.`initiative_counts_last_2_weeks`   AS `user_initiatives_last_2_weeks`
from (', dbname,'.`insights_initiatives_per_day` `t1`
         join ', dbname,'.`insights_initiatives_per_day_in_last_2_weeks` `t2`
              on ((`t1`.`initiatives` = `t2`.`initiatives_last_2_weeks`)));




');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
