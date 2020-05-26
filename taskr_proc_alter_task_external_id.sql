DROP procedure if exists proc_alter_task_external_id;
create procedure proc_alter_task_external_id (IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
alter table ', dbname,'.task
	add external_id  varchar(255) null;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
