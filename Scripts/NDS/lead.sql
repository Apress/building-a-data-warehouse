use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_subscription_sales_lead'
   and parent_object_id = object_id('subscription_sales'))
alter table subscription_sales
  drop constraint fk_subscription_sales_lead
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'lead')
drop table lead
go

-- Create the table:

create table lead
( lead_key              int not null identity(1,1)
, lead_name             varchar(30) not null
, source_site           varchar(50) not null
, lead_url              varchar(100)
, lead_timestamp        datetime
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_lead
  primary key clustered (lead_key)
  on nds_fg6
) on [primary]
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'subscription_sales')
alter table subscription_sales
  add constraint pk_subscription_sales_lead
  foreign key (lead_key)
  references lead(lead_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'lead_name'
   and object_id = object_id('lead'))
drop index lead.lead_name
go

create unique index lead_name
  on lead(lead_name)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'source_site'
   and object_id = object_id('lead'))
drop index lead.source_site
go

create unique index source_site
  on lead(source_site)
  on nds_fg6
go
