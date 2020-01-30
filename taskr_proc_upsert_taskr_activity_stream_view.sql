DROP procedure if exists proc_upsert_taskr_activity_stream_view;
create procedure proc_upsert_taskr_activity_stream_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

CREATE OR REPLACE VIEW ', dbname,'.taskr_activity_stream AS
SELECT ''task'' COLLATE utf8mb4_unicode_ci  AS action_type,
       a.last_action_by AS actor,
       a.last_modified_timestamp AS action_time,
       a.task_uuid AS task_identifier,
       CONCAT(a.last_action_by,
        (
        CASE
        WHEN (((SELECT TIMESTAMPDIFF(SECOND,a.created_timestamp,a.last_modified_timestamp) result) <= ''120'') AND (a.is_complete = true) )
            THEN '' CREATED and then pretty-much immediately COMPLETED ''
        WHEN (a.is_complete = true)
            THEN '' COMPLETED ''
        WHEN ((SELECT TIMESTAMPDIFF(SECOND,a.created_timestamp,a.last_modified_timestamp) result) <= ''5'')
            THEN '' CREATED ''
        ELSE '' UPDATED ''
        END
        )
        ,''the task: '', UPPER(a.task_subject)) AS action_description
FROM ', dbname,'.task a
UNION ALL
SELECT ''comment'' COLLATE utf8mb4_unicode_ci AS action_type,
       b.commenter AS actor,
       b.comment_time AS action_time,
       b.task_id AS task_identifier,
       CONCAT(b.commenter, '' COMMENTED on the task: '',UPPER((SELECT a.task_subject WHERE a.task_uuid = b.task_id)),'' with the message: "'', b.comment_body,''"'') as action_description
FROM ', dbname,'.task_comments b, ', dbname,'.task a
GROUP BY action_description
ORDER BY action_time DESC;

');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;

