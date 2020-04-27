create schema if not exists boomiforgood collate latin1_swedish_ci;

create table if not exists authorized_user
(
	authorized_user_id bigint unsigned auto_increment,
	email varchar(100) null,
	organization_id int null,
	constraint authorized_user_authorized_user_id_uindex
		unique (authorized_user_id),
	constraint authorized_user_id
		unique (authorized_user_id)
);

alter table authorized_user
	add primary key (authorized_user_id);

create table if not exists organization
(
	organization_id int auto_increment
		primary key,
	public_uuid char(36) null,
	registered_email varchar(255) not null,
	created timestamp null,
	logo_url varchar(2000) null,
	faq_url varchar(500) null,
	organization_name varchar(200) not null,
	organization_message text null,
	admin_portal_url varchar(500) null,
	bot_url varchar(500) null,
	private int default 0 null
);

create table if not exists faq_item
(
	faq_item_id int auto_increment
		primary key,
	question varchar(1500) not null,
	answer varchar(9999) not null,
	item_created timestamp null,
	item_last_updated timestamp null,
	update_count int null,
	score int default 0 null,
	organization_id int null,
	updated_by varchar(255) null,
	constraint faq_item_organization_organization_id_fk
		foreign key (organization_id) references organization (organization_id)
);

create table if not exists faq_tag
(
	faq_tag_id int auto_increment
		primary key,
	tag varchar(100) not null,
	faq_item_id int null,
	created timestamp null,
	created_by varchar(100) null,
	hit_count int default 0 null,
	constraint faq_tag_faq_item_faq_item_id_fk
		foreign key (faq_item_id) references faq_item (faq_item_id)
);

create table if not exists org_subscriber
(
	org_subscriber_id int auto_increment
		primary key,
	organization_id int not null,
	email_address varchar(255) not null,
	subscribed_date timestamp null,
	last_emailed_date timestamp null,
	validation varchar(255) null,
	constraint org_subscriber_organization_organization_id_fk
		foreign key (organization_id) references organization (organization_id)
);

create or replace definer = bfgmaster@`%` view vw_authorized_user as select `o`.`organization_id`    AS `organization_id`,
       `o`.`public_uuid`        AS `public_uuid`,
       `o`.`organization_name`  AS `organization_name`,
       `o`.`created`            AS `organization_created`,
       `u`.`authorized_user_id` AS `authorized_user_id`,
       `u`.`email`              AS `authorized_user_email`
from (`boomiforgood`.`authorized_user` `u`
         left join `boomiforgood`.`organization` `o` on ((`u`.`organization_id` = `o`.`organization_id`)));

create or replace definer = bfgmaster@`%` view vw_calculations as select `a`.`org_count`             AS `org_count`,
       `b`.`faq_item_count`        AS `faq_item_count`,
       `c`.`faq_tag_count`         AS `faq_tag_count`,
       `d`.`authorized_user_count` AS `authorized_user_count`,
       `e`.`org_subscriber_count`  AS `org_subscriber_count`
from (select count(distinct `boomiforgood`.`organization`.`organization_id`) AS `org_count`
      from `boomiforgood`.`organization`
      where (`boomiforgood`.`organization`.`private` <> 1)) `a`
         join (select count(distinct `fi`.`faq_item_id`) AS `faq_item_count`
               from (`boomiforgood`.`faq_item` `fi`
                        join `boomiforgood`.`organization` `o` on ((`fi`.`organization_id` = `o`.`organization_id`)))
               where (`o`.`private` <> 1)) `b`
         join (select count(distinct `ft`.`faq_tag_id`) AS `faq_tag_count`
               from ((`boomiforgood`.`faq_tag` `ft` join `boomiforgood`.`faq_item` `fi` on ((`ft`.`faq_item_id` = `fi`.`faq_item_id`)))
                        join `boomiforgood`.`organization` `o` on ((`fi`.`organization_id` = `o`.`organization_id`)))
               where (`o`.`private` <> 1)) `c`
         join (select count(distinct `au`.`email`) AS `authorized_user_count`
               from (`boomiforgood`.`authorized_user` `au`
                        join `boomiforgood`.`organization` `o` on ((`au`.`organization_id` = `o`.`organization_id`)))
               where (`o`.`private` <> 1)) `d`
         join (select count(distinct `os`.`org_subscriber_id`) AS `org_subscriber_count`
               from (`boomiforgood`.`org_subscriber` `os`
                        join `boomiforgood`.`organization` `o` on ((`os`.`organization_id` = `o`.`organization_id`)))
               where (`o`.`private` <> 1)) `e`;

create or replace definer = bfgmaster@`%` view vw_faq_tags as select `o`.`organization_id`   AS `organization_id`,
       `o`.`public_uuid`       AS `public_uuid`,
       `i`.`faq_item_id`       AS `faq_item_id`,
       `i`.`question`          AS `question`,
       `i`.`answer`            AS `answer`,
       `i`.`score`             AS `score`,
       `i`.`item_created`      AS `item_created`,
       `i`.`item_last_updated` AS `item_last_updated`,
       `t`.`faq_tag_id`        AS `faq_tag_id`,
       `t`.`tag`               AS `tag`
from ((`boomiforgood`.`faq_item` `i` join `boomiforgood`.`organization` `o` on ((`i`.`organization_id` = `o`.`organization_id`)))
         join `boomiforgood`.`faq_tag` `t` on ((`i`.`faq_item_id` = `t`.`faq_item_id`)));

create or replace definer = bfgmaster@`%` view vw_faqs as select `o`.`organization_id`                 AS `organization_id`,
       `o`.`public_uuid`                     AS `public_uuid`,
       `i`.`faq_item_id`                     AS `faq_item_id`,
       `i`.`question`                        AS `question`,
       `i`.`answer`                          AS `answer`,
       `i`.`score`                           AS `score`,
       `i`.`item_created`                    AS `item_created`,
       `i`.`item_last_updated`               AS `item_last_updated`,
       group_concat(`t`.`tag` separator ',') AS `tags`
from ((`boomiforgood`.`faq_item` `i` join `boomiforgood`.`organization` `o` on ((`i`.`organization_id` = `o`.`organization_id`)))
         left join `boomiforgood`.`faq_tag` `t` on ((`i`.`faq_item_id` = `t`.`faq_item_id`)))
group by `i`.`faq_item_id`;

