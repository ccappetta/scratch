DROP procedure if exists proc_upsert_insights_items_per_day_merged;
create procedure proc_upsert_insights_items_per_day_merged(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.insights_items_per_day_merged as select `t1`.`username`                   AS `username`,
       `t1`.`user_items`                 AS `user_items`,
       `t1`.`day_of_year`                AS `day_of_year`,
       `t1`.`items_per_day`              AS `items_per_day`,
       `t2`.`items_per_day_last_2_weeks` AS `items_per_day_last_2_weeks`,
       `t2`.`user_items_last_2_weeks`    AS `user_items_last_2_weeks`
from (', dbname,'.`insights_items_per_day` `t1`
         join ', dbname,'.`insights_items_per_day_in_last_2_weeks` `t2` on ((`t1`.`username` = `t2`.`username`)));



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
