use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_rule_type')
drop table dq_rule_type
go

create table dq_rule_type
( id                char         not null
, rule_type         varchar(30)  not null
, description       varchar(200) not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_rule_type
  primary key clustered (id)
)
go

insert into dq_rule_type (id, rule_type, description, create_timestamp, update_timestamp)
values ('E', 'Error', 'A data quality issue causing some financial or business risk', getdate(), getdate())

insert into dq_rule_type (id, rule_type, description, create_timestamp, update_timestamp)
values ('W', 'Warning', 'A data quality issue without any financial or business risk', getdate(), getdate())

insert into dq_rule_type (id, rule_type, description, create_timestamp, update_timestamp)
values ('I', 'Information', 'Not a data quality issue of any kind, only informational statement about data quality', getdate(), getdate())
go

