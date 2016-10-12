use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_order_item_product'
   and parent_object_id = object_id('order_item'))
alter table order_item
  drop constraint fk_order_item_product
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'product')
drop table product
go

-- Create the table:

create table product
( product_key           int not null identity(1,1)
, product_code          varchar(10) not null
, name                  varchar(50) 
, description           varchar(100)
, title                 varchar(100)
, artist_key            int
, product_type_key      int
, format_key            int
, unit_price            smallmoney
, unit_cost             smallmoney
, product_status_key    int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_product
  primary key clustered (product_key)
  on nds_fg6
, constraint fk_product_product_type
  foreign key (product_type_key)
  references product_type(product_type_key)
, constraint fk_product_format
  foreign key (format_key)
  references format(format_key)
, constraint fk_product_product_status
  foreign key (product_status_key)
  references product_status(product_status_key)
) on [primary]
go

-- Insert Unknown Record:

set identity_insert product on

insert into product
( product_key, product_code, [name]
, description, title, artist_key
, product_type_key, format_key
, unit_price, unit_cost
, product_status_key, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 'Unknown'
, 'Unknown', 'Unknown', 0
, 0, 0
, 0, 0
, 0, 0
, '1900-01-01', '1900-01-01' )

set identity_insert product off
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'order_item')
alter table order_item
  add constraint fk_order_item_product
  foreign key (product_key)
  references product(product_key)
go

-- Create indexes:

if exists
  (select * from sys.indexes 
   where name = 'product_code' 
   and object_id = object_id('product'))
drop index product.product_code
go

create unique index product_code
  on product(source_system_code, product_code)
  on nds_fg6
go

if exists
  (select * from sys.indexes 
   where name = 'title' 
   and object_id = object_id('product'))
drop index product.title
go

create index title
  on product(title)
  on nds_fg6
go

if exists
  (select * from sys.indexes 
   where name = 'artist_key' 
   and object_id = object_id('product'))
drop index product.artist_key
go

create index artist_key
  on product(artist_key)
  on nds_fg6
go

