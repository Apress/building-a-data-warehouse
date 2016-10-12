use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name like 'fk_subscription_sales_store'
   and parent_object_id = object_id('subscription_sales'))
alter table subscription_sales
  drop constraint fk_subscription_sales_store
go

if exists
  (select * from sys.foreign_keys
   where name like 'fk_order_header_store'
   and parent_object_id = object_id('order_header'))
alter table order_header
  drop constraint fk_order_header_store
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'store')
drop table store
go

-- Create the table:

create table store
( store_key           int not null identity(1,1)
, store_number        smallint
, store_name          varchar(50)
, store_type_key      int
, address_key   int
, phone_number_key    int
, web_site            varchar(100)
, region_key          int
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_store
  primary key clustered (store_key)
  on nds_fg6
, constraint fk_store_store_type
  foreign key (store_type_key)
  references store_type(store_type_key)
, constraint fk_store_address
  foreign key (address_key)
  references address(address_key)
, constraint fk_store_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
, constraint fk_store_region
  foreign key (region_key)
  references region(region_key)
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'subscription_sales')
alter table subscription_sales
  add constraint fk_subscription_sales_store
  foreign key (store_key)
  references store(store_key)
go

if exists
  (select * from sys.tables
   where name = 'order_header')
alter table order_header
  add constraint fk_order_header_store
  foreign key (store_key)
  references store(store_key)
go

-- Create indexes:

if exists
  (select * from sys.indexes
   where name = 'store_number'
   and object_id = object_id('store'))
drop index store.store_number
go

create unique index store_number
  on store(store_number)
  on nds_fg6
go