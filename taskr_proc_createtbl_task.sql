DROP procedure if exists proc_createtbl_task;
create procedure proc_createtbl_task(IN dbname varchar(128))
BEGIN
    SET @theSQL=CONCAT('CREATE TABLE ', dbname, '.task
(
    task_id                 int auto_increment
        primary key,
    task_subject            varchar(255)  null,
    task_description        varchar(2500) null,
    task_uuid               varchar(18)   null,
    last_modified_timestamp timestamp     null,
    created_timestamp       timestamp     null,
    completed_timestamp     timestamp     null,
    last_action_by          varchar(255)  null,
    created_by              varchar(255)  null,
    touch_count             int           null,
    status_message          varchar(255)  null,
    status_int              int           null,
    is_complete             bit           null,
    is_active_worklist      bit           null,
    task_type               varchar(255)  null,
    action_on               varchar(255)  null,
    parent_project          varchar(255)  null,
    task_url                varchar(255)  null
);');
    PREPARE stmt1 from @theSQL;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END;
