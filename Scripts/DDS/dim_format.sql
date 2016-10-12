use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_format'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_format
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_format')
drop table dim_format
go

create table dim_format
( format_key           int not null
, name                 varchar(30)
, description          varchar(50)
, media                varchar(15)
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_format
  primary key clustered (format_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_format
  foreign key (format_key)
  references dim_format(format_key)
go
