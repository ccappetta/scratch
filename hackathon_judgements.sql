create table if not exists judgement
(
	judgement_id bigserial not null
		constraint judgement_pkey
			primary key,
	judge_name varchar,
	submission_team varchar,
	overall_score integer,
	innovation_score integer,
	technical_competency_score integer,
	business_value_score integer,
	useability_score integer,
	overall_comments varchar,
	flow_url varchar,
	import_token varchar,
	submission_id integer,
	innovation_comments varchar,
	technical_comments varchar,
	business_value_comments varchar,
	useability_comments varchar,
	video varchar,
	grand_total integer,
	submitter_comments varchar,
	app_name varchar
);

create table if not exists submissions
(
	submission_id bigserial not null
		constraint submissions_pkey
			primary key,
	submitter varchar,
	flow_url varchar,
	import_token varchar,
	video varchar,
	submitter_comments varchar,
	app_name varchar
);
