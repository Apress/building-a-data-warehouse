use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_product_type_product_category'
   and parent_object_id = object_id('product_type'))
alter table product_type
  drop constraint fk_product_type_product_category
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'product_category')
drop table product_category
go

-- Create the table:

create table product_category
( product_category_key  int not null identity(1,1)
, product_category      varchar(20) 
, description           varchar(50)
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_product_category
  primary key clustered (product_category_key)
  on nds_fg6
) on nds_fg5
go

-- Insert Unknown Record

set identity_insert product_category on

insert into product_category
( product_category_key, product_category
, description, source_system_code
, create_timestamp, update_timestamp )
values 
( 0, 'Unknown'
, 'Unknown', 0
, '1900-01-01', '1900-01-01' )

set identity_insert product_category off

go

-- Create FK:
if exists
  (select * from sys.tables
   where name = 'product_type')
alter table product_type
add constraint fk_product_type_product_category
  foreign key (product_category_key)
  references product_category(product_category_key)
go

