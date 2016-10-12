use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_product_product_status'
   and parent_object_id = object_id('product'))
alter table product
  drop constraint fk_product_product_status
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'product_status')
drop table product_status
go

-- Create the table:

create table product_status
( product_status_key      int not null identity(1,1)
, product_status_code     char(2) not null
, product_status          varchar(15) not null
, source_system_code      tinyint not null
, create_timestamp        datetime not null
, update_timestamp        datetime not null
, constraint pk_product_status
  primary key clustered (product_status_key)
  on nds_fg6
) on nds_fg5
go

-- Populate data:

insert into product_status
( product_status_code, product_status
, source_system_code, create_timestamp, update_timestamp )
values ( 'AC', 'Active', 3, getdate(), getdate())
insert into product_status
( product_status_code, product_status
, source_system_code, create_timestamp, update_timestamp )
values ( 'IN', 'Inactive', 3, getdate(), getdate())
insert into product_status
( product_status_code, product_status
, source_system_code, create_timestamp, update_timestamp )
values ( 'QC', 'Quality Control', 3, getdate(), getdate())
insert into product_status
( product_status_code, product_status
, source_system_code, create_timestamp, update_timestamp )
values ( 'WD', 'Withdrawn', 3, getdate(), getdate())
go

-- Insert unknown record:

set identity_insert product_status on
insert into product_status
( product_status_key, product_status_code, product_status
, source_system_code, create_timestamp, update_timestamp )
values ( 0, 'UN', 'Unknown', 0, getdate(), getdate())
set identity_insert product_status off
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'product')
alter table product
  add constraint fk_product_product_status
  foreign key (product_status_key)
  references product_status(product_status_key)
go

-- There is no point creating index as this is a tiny table
