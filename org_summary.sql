create or replace definer = taskrmaster@`%` view selfservice.org_summary as select `a`.`org_name`                                     AS `organization`,
       `a`.`stripe_cust`                                  AS `stripe_customer_id`,
       `a`.`created_time`                                 AS `org_created`,
       count(`b`.`subscription_item_id`)                  AS `subscription_count`,
       group_concat(`b`.`item_identifier` separator ', ') AS `subscription_items`,
       `b`.`ssb_schema`                                   AS `instance_schemas`,
       `b`.`tool_identifier`                              AS `tool_identifier`
from (`selfservice`.`ssb_org` `a`
         left join `selfservice`.`subscription_items` `b` on ((`a`.`stripe_cust` = `b`.`stripe_customer_id`)))
where (`b`.`is_active` = 1)
group by `a`.`org_name`, `org_created`
order by `org_created` desc;

