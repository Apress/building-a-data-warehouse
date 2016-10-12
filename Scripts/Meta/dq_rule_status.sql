use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_rule_status')
drop table dq_rule_status
go

create table dq_rule_status
( id                char(2)      not null
, rule_status       varchar(30)  not null
, description       varchar(200) not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_rule_status
  primary key clustered (id)
)
go

insert into dq_rule_status (id, rule_status, description, create_timestamp, update_timestamp)
values ('A', 'Active', 'The rule is currently used in the data warehouse', getdate(), getdate())

insert into dq_rule_status (id, rule_status, description, create_timestamp, update_timestamp)
values ('D', 'Decommissioned', 'The rule is not currently used in the data warehouse', getdate(), getdate())
go

