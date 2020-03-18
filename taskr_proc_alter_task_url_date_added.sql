DROP procedure if exists proc_alter_task_url_date_added;
create procedure proc_alter_task_url_date_added(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('
alter table ', dbname,'.task_urls
	add date_added timestamp;
');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
