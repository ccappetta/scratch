
create table chat_answer_made
(
	`key` int auto_increment
		primary key,
	chat_id varchar(36) not null,
	request_time datetime null,
	request_text varchar(2500) null,
	intent_matched varchar(99) null,
	intent_reply varchar(5000) null,
	flag tinyint(1) null,
	notes text null
)
charset=latin1
;

create table chat_fulfills
(
	`key` int auto_increment
		primary key,
	chat_id varchar(36) not null,
	end_time datetime null,
	intent_matched varchar(50) null
)
charset=latin1
;

create table chat_missed
(
	`key` int auto_increment
		primary key,
	chat_id varchar(36) not null,
	request_time datetime null,
	request_text varchar(1500) null,
	flag tinyint(1) null,
	notes text null
)
charset=latin1
;

create table chat_replies
(
	`key` int auto_increment
		primary key,
	intentID varchar(100) null,
	slot1 varchar(100) null,
	reply varchar(1000) null,
	followup_question varchar(1000) null,
	route_overide varchar(90) null
)
charset=latin1
;

create table chat_track
(
	`key` int auto_increment
		primary key,
	chat_id varchar(36) not null,
	start_time datetime null,
	last_request_time datetime null,
	requests int null,
	missed int null,
	answers int null,
	fulfils int null,
	chat_log text null,
	admin_log text null,
	flag tinyint(1) null,
	notes text null
)
charset=latin1
;

