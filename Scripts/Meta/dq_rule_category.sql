use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_rule_category')
drop table dq_rule_category
go

create table dq_rule_category
( id                char         not null
, rule_category     varchar(50)  not null
, description       varchar(200) not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_rule_category
  primary key clustered (id)
)
go

insert into dq_rule_category (id, rule_category, description, create_timestamp, update_timestamp)
values ('I', 'Incoming data validation', 'Rules that check if the data loaded into the data warehouse satisfy certain criteria or not, without referring to any data in the data warehouse', getdate(), getdate())

insert into dq_rule_category (id, rule_category, description, create_timestamp, update_timestamp)
values ('C', 'Cross reference validation', 'Rules that check the incoming data against the data in the warehouse', getdate(), getdate())

insert into dq_rule_category (id, rule_category, description, create_timestamp, update_timestamp)
values ('D', 'Internal data warehouse validation', 'Rules that check the data already in the data warehouse', getdate(), getdate())
go

