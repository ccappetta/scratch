DROP procedure if exists proc_upsert_v_insights_v2_allocation;
create procedure proc_upsert_v_insights_v2_allocation(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('


create or replace view ', dbname,'.v_insights_v2_allocation as
	select `a`.`created_by`                                                                                         AS `username`,
       count(`a`.`created_by`)                                                                                  AS `user_items`,
       min(`a`.`created_timestamp`)                                                                             AS `earliest_task`,
       (to_days(now()) - to_days(min(`a`.`created_timestamp`)))                                                 AS `days_since_first_task`,
       (count(`a`.`created_by`) /
        (to_days(now()) - to_days(min(`a`.`created_timestamp`))))                                               AS `lifetime_tasks_per_day`,
       coalesce(`b`.`count`, 0)                                                                                 AS `user_items_last_2_weeks`,
       (coalesce(`b`.`count`, 0) / 14)                                                                          AS `user_item_per_day_last_2_weeks`,
       round((((coalesce(`b`.`count`, 0) / 14) /
               (count(`a`.`created_by`) / (to_days(now()) - to_days(min(`a`.`created_timestamp`))))) * 100),
             0)                                                                                                 AS `allocation`
from (', dbname,'.`task` `a`
         left join ', dbname,'.`v_insights_v2_tasks_in_last_2_weeks` `b` on ((`a`.`created_by` = `b`.`user`)))
where (`a`.`created_by` is not null)
group by `a`.`created_by`;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
