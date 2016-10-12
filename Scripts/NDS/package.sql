use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_subscription_sales_package'
   and parent_object_id = object_id('subscription_sales'))
alter table subscription_sales
  drop constraint fk_subscription_sales_package
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'package')
drop table package
go

-- Create the table:

create table package
( package_key           int not null identity(1,1)
, name                  varchar(30) 
, description           varchar(100)
, package_type_key      int
, package_price         money
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_package
  primary key clustered (package_key)
  on nds_fg6
, constraint fk_package_package_type
  foreign key (package_type_key)
  references package_type(package_type_key)
) on [primary]
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'subscription_sales')
alter table subscription_sales
  add constraint fk_subscription_sales_package
  foreign key (package_key)
  references package(package_key)
go

-- There is no point creating indexes as this is a small table