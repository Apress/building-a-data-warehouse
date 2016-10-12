use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_product_product_type'
   and parent_object_id = object_id('product'))
alter table product
  drop constraint fk_product_product_type
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'product_type')
drop table product_type
go

-- Create the table:

create table product_type
( product_type_key      int not null identity(1,1)
, product_type_code     char(2) not null
, product_type          varchar(15) not null
, product_category_key  int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_product_type
  primary key clustered (product_type_key)
  on nds_fg6
, constraint fk_product_type_product_category
  foreign key (product_category_key)
  references product_category(product_category_key)
) on nds_fg5
go

-- Insert Unknown Record:

set identity_insert product_type on

insert into product_type
( product_type_key, product_type_code, product_type
, product_category_key, source_system_code
, create_timestamp, update_timestamp )
values
( 0, '', 'Unknown'
, 0, 0
, '1900-01-01', '1900-01-01' )

set identity_insert product_type off

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'product')
alter table product
  add constraint fk_product_product_type
  foreign key (product_type_key)
  references product_type(product_type_key)
go

-- Create indexes:

if exists
  (select * from sys.indexes
   where name = 'product_type_code'
   and object_id = object_id('product_type'))
drop index product_type.product_type_code
go

create unique index product_type_code
  on product_type(product_type_code)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'product_type'
   and object_id = object_id('product_type'))
drop index product_type.product_type
go

create unique index product_type
  on product_type(product_type)
  on nds_fg6
go