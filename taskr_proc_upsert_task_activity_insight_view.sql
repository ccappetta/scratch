DROP procedure if exists proc_upsert_task_activity_insight_view;
create procedure proc_upsert_task_activity_insight_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create or replace view ', dbname,'.task_activity_insight_view as select `a`.`task_uuid`                  AS `task_uuid`,
       `a`.`view_count`                 AS `view_count`,
       `b`.`last_visit`                 AS `last_visit`,
       `b`.`last_visitor`               AS `last_visitor`,
       coalesce(`c`.`comment_count`, 0) AS `comment_count`
from ((', dbname,'.`task_visit_count_view` `a` join ', dbname,'.`task_last_visitor_view` `b` on ((`a`.`task_uuid` = `b`.`task_uuid`)))
         left join ', dbname,'.`task_comment_count_view` `c` on ((`a`.`task_uuid` = `c`.`task_uuid`)))
group by `a`.`task_uuid`, `a`.`task_subject`;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
