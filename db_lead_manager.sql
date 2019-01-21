create table if not exists lead
(
	id bigserial not null
		constraint lead_pk
			primary key,
	first_name varchar,
	last_name varchar,
	company varchar,
	email varchar,
	phone varchar,
	street varchar,
	street2 varchar,
	city varchar,
	state varchar,
	country varchar,
	campaign varchar,
	description varchar,
	lead_owner varchar,
	mobile_phone varchar,
	no_of_employees integer,
	annual_revenue varchar,
	probability integer,
	status varchar,
	company_id varchar,
	name varchar
);

