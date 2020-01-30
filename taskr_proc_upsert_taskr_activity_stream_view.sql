DROP procedure if exists proc_upsert_taskr_activity_stream_view;
create procedure proc_upsert_taskr_activity_stream_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
create or replace view ', dbname,'.taskr_activity_stream as select ''task'' COLLATE utf8mb4_unicode_ci  AS `action_type`,
       `a`.`last_action_by`              AS `actor`,
       `a`.`last_modified_timestamp`     AS `action_time`,
       `a`.`task_uuid`                   AS `task_identifier`,
       concat(`a`.`last_action_by`, convert((case
                                                 when (((select timestampdiff(SECOND, `a`.`created_timestamp`,
                                                                              `a`.`last_modified_timestamp`) AS `result`) <=
                                                        ''120'') and (`a`.`is_complete` = TRUE))
                                                     then '' CREATED and then pretty-much immediately COMPLETED ''
                                                 when (`a`.`is_complete` = TRUE) then '' COMPLETED ''
                                                 when ((select timestampdiff(SECOND, `a`.`created_timestamp`,
                                                                             `a`.`last_modified_timestamp`) AS `result`) <=
                                                       ''5'') then '' CREATED ''
                                                 else '' UPDATED '' end) using latin1), ''the task: '',
              upper(`a`.`task_subject`)) AS `action_description`,
       `a`.`task_url`                    AS `task_url`
from ', dbname,'.`task` `a`
union all
select ''comment'' COLLATE utf8mb4_unicode_ci  AS `action_type`,
       `b`.`commenter`                 AS `actor`,
       `b`.`comment_time`              AS `action_time`,
       `b`.`task_id`                   AS `task_identifier`,
       concat(`b`.`commenter`, '' COMMENTED on the task: '', upper(`a`.`task_subject`), '' with the message: "'',
              `b`.`comment_body`, ''"'') AS `action_description`,
       `a`.`task_url`                  AS `task_url`
from (', dbname,'.`task_comments` `b`
         join ', dbname,'.`task` `a` on ((`a`.`task_uuid` = `b`.`task_id`)))
order by `action_time` desc;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;

