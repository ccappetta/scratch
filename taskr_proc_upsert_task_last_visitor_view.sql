DROP procedure if exists proc_upsert_task_last_visitor_view;
create procedure proc_upsert_task_last_visitor_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.task_last_visitor_view as select `a`.`task_uuid`       AS `task_uuid`,
       `a`.`task_subject`    AS `task_subject`,
       max(`b`.`login_time`) AS `last_visit`,
       (select `b`.`user_email`
        from ', dbname,'.`access_log` `b`
        where (`b`.`viewing_task_id` = `a`.`task_uuid`)
        order by `b`.`login_time` desc
        limit 1)             AS `last_visitor`
from (', dbname,'.`task` `a`
         join ', dbname,'.`access_log` `b` on ((`a`.`task_uuid` = `b`.`viewing_task_id`)))
group by `a`.`task_uuid`, `a`.`task_subject`;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
