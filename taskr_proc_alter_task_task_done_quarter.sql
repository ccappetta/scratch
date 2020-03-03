DROP procedure if exists proc_alter_task_task_done_quarter;
create procedure proc_alter_task_task_done_quarter (IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

alter table ', dbname,'.task
	add task_done_quarter  varchar(50) null;


');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
