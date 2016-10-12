use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_order_item_order_header'
   and parent_object_id = object_id('order_item'))
alter table order_item
  drop constraint fk_order_item_order_header
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'order_header')
drop table order_header
go

-- Create the table:

create table order_header
( order_key             int not null identity(1,1)
, order_id              int not null
, sales_date            datetime
, customer_key          int
, store_key             int
, currency_key          int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_order_header
  primary key clustered (order_key)
  on nds_fg6
, constraint fk_order_header_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_order_header_store
  foreign key (store_key)
  references store(store_key)
) on [primary]
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'order_item')
alter table order_item
  add constraint fk_order_item_order_header
  foreign key (order_key)
  references order_header(order_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'order_header_order_id'
   and object_id = object_id('order_header'))
drop index order_header.order_header_order_id
go

create unique index order_header_order_id
  on order_header(order_id)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'order_header_sales_date'
   and object_id = object_id('order_header'))
drop index order_header.order_header_sales_date
go

create index order_header_sales_date
  on order_header(sales_date)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'order_header_customer_key'
   and object_id = object_id('order_header'))
drop index order_header.order_header_customer_key
go

create index order_header_customer_key
  on order_header(customer_key)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'order_header_store_key'
   and object_id = object_id('order_header'))
drop index order_header.order_header_store_key
go

create index order_header_store_key
  on order_header(store_key)
  on nds_fg6
go

