create table edi_flow
(
	record_id bigserial not null
		constraint edi_flow_pkey
			primary key,
	flow_url varchar,
	trading_partner varchar,
	doc_number varchar,
	w_value varchar,
	error_message varchar,
	current_data varchar,
	doc_type varchar,
	status varchar,
	start_time timestamp,
	last_action timestamp,
	final_action timestamp,
	error_value varchar,
	updated_value varchar,
	audit_number varchar
);

