DROP procedure if exists proc_createtbl_task_comments;
create procedure proc_createtbl_task_comments(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('CREATE TABLE if not exists ', dbname, '.task_comments
(
    comment_id   int auto_increment
        primary key,
    comment_body varchar(9999) null,
    commenter    varchar(255)  null,
    task_id      varchar(20)   null,
    comment_time timestamp     null
);');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
