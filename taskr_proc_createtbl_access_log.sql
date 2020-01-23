DROP procedure if exists proc_createtbl_access_log;
create procedure proc_createtbl_access_log(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('CREATE TABLE ', dbname, '.access_log
(
    login_id        int auto_increment
        primary key,
    user_email      varchar(255) null,
    login_time      timestamp    null,
    flow_name       varchar(255) null,
    flow_id         varchar(255) null,
    tenant_id       varchar(255) null,
    state_id        varchar(255) null,
    version_id      varchar(255) null,
    viewing_task_id varchar(255) null
);');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
