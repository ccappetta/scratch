create table public.account
(
	account_id bigserial not null
		constraint account_pkey
			primary key,
	account_name varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.account owner to boomicrm
;

create table public.contact
(
	contact_id bigserial not null
		constraint contact_pkey
			primary key,
	contact_name varchar,
	role varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.contact owner to boomicrm
;

create table public.implementation
(
	implementation_id bigserial not null
		constraint implementation_pkey
			primary key,
	implementation_project_name varchar,
	implementation_start_datetime timestamp,
	implementation_due_date timestamp,
	client_task_1 varchar,
	client_task_2 varchar,
	client_task_3 varchar,
	company_task_1 varchar,
	company_task_2 varchar,
	company_task_3 varchar,
	project_status varchar,
	customer_contact varchar,
	project_owner varchar,
	implementation_opportunity varchar,
	account varchar,
	friendly_start_datestring varchar,
	friendly_due_datestring varchar,
	implementation_opportunity_id integer,
	customer_contact_phone varchar,
	customer_contact_email varchar,
	implementation_flowuri varchar,
	client_flowuri varchar,
	implementation_delivery_datestring varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.implementation owner to boomicrm
;

create table public.lead
(
	lead_id bigserial not null
		constraint lead_pkey
			primary key,
	lead_nombre varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.lead owner to boomicrm
;

create table public.opportunity
(
	opportunity_id bigserial not null
		constraint opportunity_pkey
			primary key,
	opportunity_name varchar,
	account_id integer,
	account_name varchar,
	description varchar,
	stage varchar,
	probability integer,
	close_date timestamp,
	opportunity_type varchar,
	next_step varchar,
	lead_source varchar,
	is_closed boolean,
	is_won boolean,
	forecast_category varchar,
	campaign_id integer,
	pricebook_id integer,
	owner_id integer,
	owner_name varchar,
	created_date timestamp,
	created_by_id integer,
	created_by_name varchar,
	last_modified timestamp,
	last_modified_by_id integer,
	last_activity_datetime timestamp,
	url varchar,
	other1 varchar,
	implementation_id integer,
	friendly_created_datestring varchar,
	friendly_modified_datestring varchar,
	friendly_last_action_datestring varchar,
	friendly_close_date varchar,
	oppfilter1 varchar,
	oppfilter2 varchar,
	oppfilter3 varchar,
	oppopen1 varchar,
	oppopen2 varchar,
	oppopen3 varchar
)
;

alter table public.opportunity owner to boomicrm
;

create table public.product
(
	product_id bigserial not null
		constraint product_pkey
			primary key,
	product_name varchar,
	pricebook_id integer,
	quantity integer,
	price integer,
	description varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.product owner to boomicrm
;

create table public.employee
(
	id bigserial not null
		constraint employee_pkey
			primary key,
	first_name varchar,
	last_name varchar,
	account_number integer,
	email varchar,
	phone varchar,
	street_address varchar,
	city varchar,
	state varchar,
	zip varchar,
	birthdate varchar,
	department varchar,
	department_id integer,
	manager varchar,
	hire_date varchar,
	exit_date varchar,
	idstring varchar,
	employment_status varchar,
	notes varchar,
	region varchar,
	hire_datetime timestamp,
	exit_datetime timestamp,
	hiring_process_id integer,
	full_name varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.employee owner to boomicrm
;

create table public.hiring_process
(
	onboard_id bigserial not null
		constraint hiring_process_pkey
			primary key,
	prospect_name varchar,
	hire_datetime timestamp,
	friendly_hire_datestring varchar,
	req_id varchar,
	recruiter_id integer,
	recruiter_name varchar,
	department varchar,
	next_step varchar,
	process_url varchar,
	status varchar,
	requested_salary varchar,
	prospect_phone varchar,
	prospect_email varchar,
	region varchar,
	title varchar,
	description varchar,
	hiring_manager varchar,
	task_order_hardware varchar,
	task_provision_systems varchar,
	task_review_duties varchar,
	last_name varchar,
	first_name varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.hiring_process owner to boomicrm
;

create table public.it_task
(
	task_id bigserial not null
		constraint it_task_pkey
			primary key,
	assigned_to varchar,
	type varchar,
	subject varchar,
	comment varchar,
	sla varchar,
	priority varchar,
	status varchar,
	appropriate_action varchar,
	for_user varchar,
	manager varchar,
	started timestamp,
	finished timestamp,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.it_task owner to boomicrm
;

create table public.it_user
(
	it_user_pk bigserial not null
		constraint it_user_pkey
			primary key,
	name varchar,
	manager varchar,
	department varchar,
	hired varchar,
	region varchar,
	email varchar,
	phone varchar,
	title varchar,
	outlook_install varchar,
	zoom_install varchar,
	local_admin_access varchar,
	powerpoint_install varchar,
	sublimetext_install varchar,
	notepadplus_install varchar,
	operating_system varchar,
	slack_install varchar,
	vlc_install varchar,
	postman_install varchar,
	heidi_install varchar,
	adobe_pro_install varchar,
	vpn_install varchar,
	gtm_install varchar,
	status varchar,
	onboarded_time timestamp,
	next_action varchar,
	filter1 varchar,
	filter2 varchar,
	filter3 varchar,
	open1 varchar,
	open2 varchar,
	open3 varchar
)
;

alter table public.it_user owner to boomicrm
;

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
	other3 varchar
)
;

alter table public.project_task owner to boomicrm
;

