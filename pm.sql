create table public.project_spec
(
	spec_line_pk bigserial not null
		constraint project_spec_pkey
			primary key,
	phase1notes varchar,
	phase1status integer,
	phase2notes varchar,
	phase2status integer,
	phase3notes varchar,
	phase3status integer,
	phase4notes varchar,
	phase4status integer,
	phase5notes varchar,
	phase5status integer,
	phase6notes varchar,
	phase6status integer,
	phase7notes varchar,
	phase7status integer,
	project_uuid varchar,
	filter1 varchar,
	filter2 varchar,
	other1 varchar,
	other2 varchar,
	other3 varchar,
	othernum1 integer,
	othernum2 integer,
	othernum3 integer,
	subject varchar,
	participant varchar
)
;

alter table public.project_spec owner to boomicrm
;

create table public.project_spec_crossref
(
	crossref bigserial not null
		constraint project_spec_crossref_pkey
			primary key,
	project_spec_uuid varchar,
	project_name varchar,
	other1 varchar,
	other2 varchar,
	other3 varchar,
	phase integer
)
;

alter table public.project_spec_crossref owner to boomicrm
;

create table public.project_task
(
	task_number bigserial not null
		constraint project_task_pkey
			primary key,
	phase integer,
	subject varchar,
	description varchar,
	owner_participant varchar,
	escalation1 varchar,
	escalation2 varchar,
	escalation3 varchar,
	project_uuid varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	other1 varchar,
	other2 varchar,
	other3 varchar,
	is_complete integer default 0
)
;

alter table public.project_task owner to boomicrm
;

