create table if not exists project_task
(
	task_number bigserial not null
		constraint project_task_pkey
			primary key,
	subject varchar,
	description varchar,
	owner varchar,
	escalation1 varchar,
	escalation2 varchar,
	escalation3 varchar,
	project_uuid varchar,
	project_task_batch_id varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	other1 varchar,
	other2 varchar,
	other3 varchar,
	is_complete integer default 0,
	street_address varchar,
	street_2 varchar,
	city varchar,
	state varchar,
	zip varchar,
	country varchar,
	justification varchar,
	location_type varchar,
	requested_for varchar,
	requested_for_uuid varchar,
	contact_number varchar,
	device varchar,
	headset varchar,
	bundle varchar,
	status varchar,
	request_timestamp timestamp,
	task_due_timestamp timestamp,
	task_complete_timestamp timestamp,
	task_type varchar,
	hm_email varchar,
	nh_email varchar,
	assigned_to varchar,
	task_subtype1 varchar,
	task_subtype2 varchar,
	priority integer,
	task_uuid varchar,
	req_number varchar,
	req_id varchar,
	req_uri varchar
)
;

create table if not exists status_dash
(
	status_recork_pk bigserial not null
		constraint status_dash_pkey
			primary key,
	subject varchar,
	status_int integer,
	status varchar,
	other_status varchar,
	notes varchar,
	project_start_timestamp timestamp,
	last_action_timestamp timestamp,
	resolved_timestamp timestamp,
	project_uri varchar,
	project_uuid varchar,
	nh_first_name varchar,
	nh_last_name varchar,
	nh_full_name varchar,
	nh_uuid varchar,
	nh_badge varchar,
	nh_personal_email varchar,
	nh_work_email varchar,
	nh_personal_phone varchar,
	nh_work_phone varchar,
	nh_img_uri varchar,
	hm_name varchar,
	hm_uuid varchar,
	hm_email varchar,
	hm_phone varchar,
	it_name varchar,
	it_uuid varchar,
	it_phone varchar,
	it_email varchar,
	flag1 varchar,
	flag2 varchar,
	exception_status integer default 0,
	exception_description varchar,
	hire_datestring varchar,
	hire_datetime timestamp
)
;

create or replace view task_overview as
WITH all_projects AS (
      SELECT count(*) AS total, project_task.project_uuid
      FROM project_task
      GROUP BY project_task.project_uuid
  )
  SELECT count(p.*)                                                                                       AS completed,
         a.total,
         p.project_uuid,
         (((count(p.*)) :: double precision / (a.total) :: double precision) * (100) :: double precision) AS percentage,
         concat((count(p.*)) :: double precision, '/', a.total)                                           AS fraction
  FROM project_task p,
       all_projects a
  WHERE ((p.is_complete = 1) AND ((p.project_uuid) :: text = (a.project_uuid) :: text))
  GROUP BY p.project_uuid, a.project_uuid, a.total
;

create or replace view project_task_batch_overview as
WITH all_projects AS (
      SELECT count(*) AS total, project_task.project_task_batch_id
      FROM project_task
      GROUP BY project_task.project_task_batch_id
  )
  SELECT count(p.*)                                                                                       AS completed,
         a.total,
         p.project_task_batch_id,
         (((count(p.*)) :: double precision / (a.total) :: double precision) * (100) :: double precision) AS percentage,
         concat((count(p.*)) :: double precision, '/', a.total)                                           AS fraction
  FROM project_task p,
       all_projects a
  WHERE ((p.is_complete = 1) AND ((p.project_task_batch_id) :: text = (a.project_task_batch_id) :: text))
  GROUP BY p.project_task_batch_id, a.project_task_batch_id, a.total
;
