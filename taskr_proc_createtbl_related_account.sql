DROP procedure if exists proc_createtbl_related_account;
create procedure proc_createtbl_related_account(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('

create table if not exists ', dbname, '.related_account
(
	related_account_pk int auto_increment
		primary key,
	task_id varchar(20) null,
	account_sf_id varchar(255) null,
	account_hub_id varchar(255) null,
	account_name varchar(500) null,
	account_owner_id varchar(255) null,
	account_owner_name varchar(255) null,
	account_status varchar(255) null,
	account_tcv int null,
	account_acv int null,
	account_uri varchar(255) null
);



');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
