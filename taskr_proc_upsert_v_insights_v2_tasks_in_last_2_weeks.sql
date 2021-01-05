DROP procedure if exists proc_upsert_v_insights_v2_tasks_in_last_2_weeks;
create procedure proc_upsert_v_insights_v2_tasks_in_last_2_weeks(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create or replace view ', dbname,'.v_insights_v2_tasks_in_last_2_weeks as
	select count(0) AS `count`, ', dbname,'.`task`.`created_by` AS `user`
from ', dbname,'.`task`
where (', dbname,'.`task`.`created_timestamp` between (now() - interval 14 day) and now())
group by ', dbname,'.`task`.`created_by`;



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
