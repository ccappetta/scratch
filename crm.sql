CREATE TABLE IF NOT EXISTS "account" (
	"account_id" BIGSERIAL NOT NULL,
	"account_name" CHARACTER VARYING,
	PRIMARY KEY ("account_id")
);


CREATE TABLE IF NOT EXISTS "contact" (
	"contact_id" BIGSERIAL NOT NULL,
	"contact_name" CHARACTER VARYING,
	"role" CHARACTER VARYING,
	PRIMARY KEY ("contact_id")
);


CREATE TABLE IF NOT EXISTS "implementation" (
	"implementation_id" BIGSERIAL NOT NULL,
	"implementation_project_name" CHARACTER VARYING,
	"implementation_start_datetime" TIMESTAMP WITHOUT TIME ZONE,
	"implementation_due_date" TIMESTAMP WITHOUT TIME ZONE,
	"client_task_1" CHARACTER VARYING,
	"client_task_2" CHARACTER VARYING,
	"client_task_3" CHARACTER VARYING,
	"company_task_1" CHARACTER VARYING,
	"company_task_2" CHARACTER VARYING,
	"company_task_3" CHARACTER VARYING,
	"project_status" CHARACTER VARYING,
	"customer_contact" CHARACTER VARYING,
	"project_owner" CHARACTER VARYING,
	"implementation_opportunity" CHARACTER VARYING,
	"account" CHARACTER VARYING,
	"friendly_start_datestring" CHARACTER VARYING,
	"friendly_due_datestring" CHARACTER VARYING,
	"implementation_opportunity_id" INTEGER,
	"customer_contact_phone" CHARACTER VARYING,
	"customer_contact_email" CHARACTER VARYING,
	"implementation_flowuri" CHARACTER VARYING,
	"client_flowuri" CHARACTER VARYING,
	"implementation_delivery_datestring" CHARACTER VARYING,
	PRIMARY KEY ("implementation_id")
);


CREATE TABLE IF NOT EXISTS "lead" (
	"lead_id" BIGSERIAL NOT NULL,
	"lead_nombre" CHARACTER VARYING,
	PRIMARY KEY ("lead_id")
);


CREATE TABLE IF NOT EXISTS "opportunity" (
	"opportunity_id" BIGSERIAL NOT NULL,
	"opportunity_name" CHARACTER VARYING,
	"account_id" INTEGER,
	"account_name" CHARACTER VARYING,
	"description" CHARACTER VARYING,
	"stage" CHARACTER VARYING,
	"probability" INTEGER,
	"close_date" TIMESTAMP WITHOUT TIME ZONE,
	"opportunity_type" CHARACTER VARYING,
	"next_step" CHARACTER VARYING,
	"lead_source" CHARACTER VARYING,
	"is_closed" BOOLEAN,
	"is_won" BOOLEAN,
	"forecast_category" CHARACTER VARYING,
	"campaign_id" INTEGER,
	"pricebook_id" INTEGER,
	"owner_id" INTEGER,
	"owner_name" CHARACTER VARYING,
	"created_date" TIMESTAMP WITHOUT TIME ZONE,
	"created_by_id" INTEGER,
	"created_by_name" CHARACTER VARYING,
	"last_modified" TIMESTAMP WITHOUT TIME ZONE,
	"last_modified_by_id" INTEGER,
	"last_activity_datetime" TIMESTAMP WITHOUT TIME ZONE,
	"url" CHARACTER VARYING,
	"other1" CHARACTER VARYING,
	"implementation_id" INTEGER,
	"friendly_created_datestring" CHARACTER VARYING,
	"friendly_modified_datestring" CHARACTER VARYING,
	"friendly_last_action_datestring" CHARACTER VARYING,
	"friendly_close_date" CHARACTER VARYING,
	PRIMARY KEY ("opportunity_id")
);

CREATE TABLE IF NOT EXISTS "product" (
	"product_id" BIGSERIAL NOT NULL,
	"product_name" CHARACTER VARYING,
	"pricebook_id" INTEGER,
	"quantity" INTEGER,
	"price" INTEGER,
	"description" CHARACTER VARYING,
	PRIMARY KEY ("product_id")
);

CREATE TABLE IF NOT EXISTS "employee" (
	"id" BIGSERIAL NOT NULL,
	"first_name" CHARACTER VARYING,
	"last_name" CHARACTER VARYING,
	"account_number" INTEGER,
	"email" CHARACTER VARYING,
	"phone" CHARACTER VARYING,
	"street_address" CHARACTER VARYING,
	"city" CHARACTER VARYING,
	"state" CHARACTER VARYING,
	"zip" CHARACTER VARYING,
	"birthdate" CHARACTER VARYING,
	"department" CHARACTER VARYING,
	"department_id" INTEGER,
	"manager" CHARACTER VARYING,
	"hire_date" CHARACTER VARYING,
	"exit_date" CHARACTER VARYING,
	"idstring" CHARACTER VARYING,
	"employment_status" CHARACTER VARYING,
	"notes" CHARACTER VARYING,
	"region" CHARACTER VARYING,
	"hire_datetime" TIMESTAMP WITHOUT TIME ZONE,
	"exit_datetime" TIMESTAMP WITHOUT TIME ZONE,
	"hiring_process_id" INTEGER,
	"full_name" CHARACTER VARYING,
	PRIMARY KEY ("id")
);

CREATE TABLE IF NOT EXISTS "hiring_process" (
	"onboard_id" BIGSERIAL NOT NULL,
	"prospect_name" CHARACTER VARYING,
	"hire_datetime" TIMESTAMP WITHOUT TIME ZONE,
	"friendly_hire_datestring" CHARACTER VARYING,
	"req_id" CHARACTER VARYING,
	"recruiter_id" INTEGER,
	"recruiter_name" CHARACTER VARYING,
	"department" CHARACTER VARYING,
	"next_step" CHARACTER VARYING,
	"process_url" CHARACTER VARYING,
	"status" CHARACTER VARYING,
	"requested_salary" CHARACTER VARYING,
	"prospect_phone" CHARACTER VARYING,
	"prospect_email" CHARACTER VARYING,
	"region" CHARACTER VARYING,
	"title" CHARACTER VARYING,
	"description" CHARACTER VARYING,
	"hiring_manager" CHARACTER VARYING,
	"task_order_hardware" CHARACTER VARYING,
	"task_provision_systems" CHARACTER VARYING,
	"task_review_duties" CHARACTER VARYING,
	"last_name" CHARACTER VARYING,
	"first_name" CHARACTER VARYING,
	PRIMARY KEY ("onboard_id")
);

CREATE TABLE IF NOT EXISTS "it_task" (
	"task_id" BIGSERIAL NOT NULL,
	"assigned_to" CHARACTER VARYING,
	"type" CHARACTER VARYING,
	"subject" CHARACTER VARYING,
	"comment" CHARACTER VARYING,
	"sla" CHARACTER VARYING,
	"priority" CHARACTER VARYING,
	"status" CHARACTER VARYING,
	"appropriate_action" CHARACTER VARYING,
	"for_user" CHARACTER VARYING,
	"manager" CHARACTER VARYING,
	"started" TIMESTAMP WITHOUT TIME ZONE,
	"finished" TIMESTAMP WITHOUT TIME ZONE,
	PRIMARY KEY ("task_id")
);

CREATE TABLE IF NOT EXISTS "it_user" (
	"it_user_pk" BIGSERIAL NOT NULL,
	"name" CHARACTER VARYING,
	"manager" CHARACTER VARYING,
	"department" CHARACTER VARYING,
	"hired" CHARACTER VARYING,
	"region" CHARACTER VARYING,
	"email" CHARACTER VARYING,
	"phone" CHARACTER VARYING,
	"title" CHARACTER VARYING,
	"outlook_install" CHARACTER VARYING,
	"zoom_install" CHARACTER VARYING,
	"local_admin_access" CHARACTER VARYING,
	"powerpoint_install" CHARACTER VARYING,
	"sublimetext_install" CHARACTER VARYING,
	"notepadplus_install" CHARACTER VARYING,
	"operating_system" CHARACTER VARYING,
	"slack_install" CHARACTER VARYING,
	"vlc_install" CHARACTER VARYING,
	"postman_install" CHARACTER VARYING,
	"heidi_install" CHARACTER VARYING,
	"adobe_pro_install" CHARACTER VARYING,
	"vpn_install" CHARACTER VARYING,
	"gtm_install" CHARACTER VARYING,
	"status" CHARACTER VARYING,
	"onboarded_time" TIMESTAMP WITHOUT TIME ZONE,
	"next_action" CHARACTER VARYING,
	PRIMARY KEY ("it_user_pk")
);
