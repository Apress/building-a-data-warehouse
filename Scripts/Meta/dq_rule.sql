use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_rule')
drop table dq_rule
go

create table dq_rule
( rule_key          int          not null identity(1,1)
, rule_name         varchar(50)  not null
, description       varchar(200) not null
, rule_type         char(2)      not null
, rule_category     char(2)      not null
, risk_level        int          not null
, status            char(2)      not null
, rule_action       char(2)      not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_rule
  primary key clustered (rule_key)
)
go

use meta

set identity_insert dq_rules on

insert into dq_rules (rule_key, rule_name, description, rule_type, rule_category,
risk_level, status, rule_action, create_timestamp, update_timestamp)
values (7, 'product code format', 'Product code needs to be in AAA999AA format. Reject if it is not in this format and notify product manager by email.',
'E', 'I', 3, 'A', 'R', '2007-10-21 11:41:33' , '2007-11-27 14:07:11')

insert into dq_rules (rule_key, rule_name, description, rule_type, rule_category,
risk_level, status, rule_action, create_timestamp, update_timestamp)
values (8, 'unit price', 'Within 25% of last 3 months average.',
'W', 'C', 1, 'A', 'A', '2007-09-18 04:33' , '2007-10-12 09:27:55')

set identity_insert dq_rules off

select * from dq_rules 