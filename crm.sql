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
