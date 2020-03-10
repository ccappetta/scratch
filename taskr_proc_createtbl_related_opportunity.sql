DROP procedure if exists proc_createtbl_related_opportunity;
create procedure proc_createtbl_related_opportunity(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('CREATE TABLE ', dbname, '.related_opportunity
(
	related_opportunity_id int auto_increment
		primary key,
	task_id varchar(20) null,
	account_sf_id varchar(255) null,
	account_hub_id varchar(255) null,
	opportunity_sf_id varchar(255) null,
	opportunity_name varchar(500) null,
	opportunity_owner_id varchar(255) null,
	opportunity_owner_firstname varchar(255) null,
	opportunity_owner_lastname varchar(255) null,
	opportunity_status varchar(255) null,
	opp_acv int null,
	opp_tcv int null,
	is_closed varchar(50) null,
	is_won varchar(50) null,
	close_date timestamp null,
	close_date_quarter varchar(50) null,
	close_date_fy varchar(50) null,
	close_date_month varchar(50) null,
	opportunity_uri varchar(255) null
);');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
