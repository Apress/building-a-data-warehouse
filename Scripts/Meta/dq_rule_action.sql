use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_rule_action')
drop table dq_rule_action
go

create table dq_rule_action
( id                char(2)      not null
, rule_action       varchar(30)  not null
, description       varchar(200) not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_rule_action
  primary key clustered (id)
)
go

insert into dq_rule_action (id, rule_action, description, create_timestamp, update_timestamp)
values ('R', 'Reject', 'The data will not be loaded into the warehouse. It will be rejected and put into DQ database.', getdate(), getdate())

insert into dq_rule_action (id, rule_action, description, create_timestamp, update_timestamp)
values ('A', 'Allow', 'Allow the data to be loaded into the warehouse', getdate(), getdate())

insert into dq_rule_action (id, rule_action, description, create_timestamp, update_timestamp)
values ('F', 'Fix', 'The data will be corrected according to predefined values then loaded into the warehouse. The old values will be logged into DQ database', getdate(), getdate())
go

