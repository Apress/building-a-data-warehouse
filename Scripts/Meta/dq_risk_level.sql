use meta
go

if exists 
  ( select * from sys.tables
    where name = 'dq_risk_level')
drop table dq_risk_level
go

create table dq_risk_level
( id                int          not null
, risk_level        varchar(30)  not null
, description       varchar(200) not null
, create_timestamp  datetime     not null
, update_timestamp  datetime     not null
, constraint pk_dq_risk_level
  primary key clustered (id)
)
go

insert into dq_risk_level (id, risk_level, description, create_timestamp, update_timestamp)
values ('1', 'Risk Level 1', 'A data quality risk without any business, legal or financial implication', getdate(), getdate())

insert into dq_risk_level (id, risk_level, description, create_timestamp, update_timestamp)
values ('2', 'Risk Level 2', 'A data quality risk with financial, legal or business risk up to $100k', getdate(), getdate())

insert into dq_risk_level (id, risk_level, description, create_timestamp, update_timestamp)
values ('3', 'Risk Level 3', 'A data quality risk with financial, legal or business risk up to $100k, and some strategic disadvantages', getdate(), getdate())

insert into dq_risk_level (id, risk_level, description, create_timestamp, update_timestamp)
values ('4', 'Risk Level 4', 'A data quality risk with financial, legal or business risk up to $1m and some strategic disadvantages', getdate(), getdate())

insert into dq_risk_level (id, risk_level, description, create_timestamp, update_timestamp)
values ('5', 'Risk Level 5', 'A data quality risk with severe financial damage which could potentially cause the company to cease trading', getdate(), getdate())
go

