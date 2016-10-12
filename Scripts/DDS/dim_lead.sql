use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_lead'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_lead
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_lead')
drop table dim_lead
go

create table dim_lead
( lead_key             int not null
, name                 varchar(30) not null
, source               varchar(50)
, lead_url             varchar(100)
, lead_timestamp       datetime
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_lead
  primary key clustered (lead_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_lead
  foreign key (lead_key)
  references dim_lead(lead_key)
go

-- Build indexes

if exists 
  (select * from sys.indexes 
   where name = 'dim_lead_name'
   and object_id = object_id('dim_lead'))
drop index dim_lead.dim_lead_name
go

create index dim_lead_name
  on dim_lead(name)
  on dds_fg6
go
