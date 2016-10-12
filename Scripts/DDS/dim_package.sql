use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_package'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_package
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_package')
drop table dim_package
go

create table dim_package
( package_key          int not null
, name                 varchar(30) not null
, description          varchar(100)
, package_type         varchar(15)
, package_price        smallmoney
, source_system_code   tinyint
, create_timestamp     datetime
, update_timestamp     datetime
, constraint pk_dim_package
  primary key clustered (package_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_package
  foreign key (package_key)
  references dim_package(package_key)
go

-- Build indexes:

if exists 
  (select * from sys.indexes 
   where name = 'dim_package_name'
   and object_id = object_id('dim_package'))
drop index dim_package.dim_package_name
go

create index dim_package_name
  on dim_package(name)
  on dds_fg6
go
