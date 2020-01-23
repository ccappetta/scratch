DROP procedure if exists proc_upsert_instance_users_view;
create procedure proc_upsert_instance_users_view(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('create or replace view ', dbname,'.instance_users_view as
select distinct ', dbname,'.access_log.user_email AS user_email
from ', dbname,'.access_log
where ((', dbname,'.access_log.user_email is not null) and (',dbname,'.access_log.user_email <> ''''));');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
