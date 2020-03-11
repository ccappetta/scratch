DROP procedure if exists proc_createtbl_task_urls;
create procedure proc_createtbl_task_urls(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('



create table if not exists ', dbname, '.task_urls
(
	url_pk int auto_increment
		primary key,
	asset_url varchar(255) null,
	asset_name varchar(999) null,
	related_task_id varchar(255) null
);



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
