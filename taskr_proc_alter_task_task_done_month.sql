DROP procedure if exists proc_alter_task_task_done_month;
create procedure proc_alter_task_task_done_month (IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

alter table ', dbname,'.task
	add task_done_month  varchar(50) null;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
