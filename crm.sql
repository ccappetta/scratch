
-- Dumping structure for table public.account
CREATE TABLE IF NOT EXISTS "account" (
	"account_id" BIGINT NOT NULL DEFAULT nextval('"Account_Account-ID_seq"'::regclass) COMMENT E'',
	"account_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("account_id")
);

-- Data exporting was unselected.
-- Dumping structure for table public.contact
CREATE TABLE IF NOT EXISTS "contact" (
	"contact_id" BIGINT NOT NULL DEFAULT nextval('"Contact_Contact_ID_seq"'::regclass) COMMENT E'',
	"contact_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"role" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("contact_id")
);

-- Data exporting was unselected.
-- Dumping structure for table public.implementation
CREATE TABLE IF NOT EXISTS "implementation" (
	"implementation_id" BIGINT NOT NULL DEFAULT nextval('"Implementation_Implementation_ID_seq"'::regclass) COMMENT E'',
	"implementation_project_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_start_datetime" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"implementation_due_date" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"client_task_1" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"client_task_2" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"client_task_3" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"company_task_1" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"company_task_2" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"company_task_3" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"project_status" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"customer_contact" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"project_owner" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_opportunity" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"account" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"friendly_start_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"friendly_due_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_opportunity_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"customer_contact_phone" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"customer_contact_email" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_flowuri" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"client_flowuri" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_delivery_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("implementation_id")
);

-- Data exporting was unselected.
-- Dumping structure for table public.lead
CREATE TABLE IF NOT EXISTS "lead" (
	"lead_id" BIGINT NOT NULL DEFAULT nextval('"Lead_Lead_ID_seq"'::regclass) COMMENT E'',
	"lead_nombre" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("lead_id")
);

-- Data exporting was unselected.
-- Dumping structure for table public.opportunity
CREATE TABLE IF NOT EXISTS "opportunity" (
	"opportunity_id" BIGINT NOT NULL DEFAULT nextval('"Opportunity_Opportunity_ID_seq"'::regclass) COMMENT E'',
	"opportunity_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"account_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"account_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"description" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"stage" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"probability" INTEGER NULL DEFAULT NULL COMMENT E'',
	"close_date" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"opportunity_type" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"next_step" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"lead_source" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"is_closed" BOOLEAN NULL DEFAULT NULL COMMENT E'',
	"is_won" BOOLEAN NULL DEFAULT NULL COMMENT E'',
	"forecast_category" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"campaign_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"pricebook_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"owner_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"owner_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"created_date" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"created_by_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"created_by_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"last_modified" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"last_modified_by_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"last_activity_datetime" TIMESTAMP WITHOUT TIME ZONE NULL DEFAULT NULL COMMENT E'',
	"url" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"other1" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"implementation_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"friendly_created_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"friendly_modified_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"friendly_last_action_datestring" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"friendly_close_date" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("opportunity_id")
);

-- Data exporting was unselected.
-- Dumping structure for table public.product
CREATE TABLE IF NOT EXISTS "product" (
	"product_id" BIGINT NOT NULL DEFAULT nextval('"Product_Product_ID_seq"'::regclass) COMMENT E'',
	"product_name" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	"pricebook_id" INTEGER NULL DEFAULT NULL COMMENT E'',
	"quantity" INTEGER NULL DEFAULT NULL COMMENT E'',
	"price" INTEGER NULL DEFAULT NULL COMMENT E'',
	"description" CHARACTER VARYING NULL DEFAULT NULL COMMENT E'',
	PRIMARY KEY ("product_id")
);

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
