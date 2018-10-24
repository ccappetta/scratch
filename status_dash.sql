create table status_dash
(
	status_recork_pk bigserial not null
		constraint status_dash_pkey
			primary key,
	subject varchar,
	status varchar,
	other_status varchar,
	notes varchar,
	start_request_timestamp timestamp,
	last_action_timestamp timestamp,
	resolved_timestamp timestamp,
	ticket_uri varchar,
	for_whom varchar,
	for_whom_uuid varchar,
	system_or_equipment varchar,
	status_int integer,
	flag1 varchar,
	flag2 varchar,
	exception_status integer default 0,
	exception_description varchar,
	hm_email varchar,
	it_email varchar,
	nh_email varchar,
	nhlaunchexecutionuuid varchar
)
;

