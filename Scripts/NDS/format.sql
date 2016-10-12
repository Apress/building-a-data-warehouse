use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_product_format'
   and parent_object_id = object_id('product'))
alter table product
  drop constraint fk_product_format
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_subscription_sales_format'
   and parent_object_id = object_id('subscription_sales'))
alter table subscription_sales
  drop constraint fk_subscription_sales_format
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'format')
drop table format
go

-- Create the table:

create table format
( format_key              int not null identity(1,1)
, format_name             varchar(30) not null
, description             varchar(50)
, media_key               int
, source_system_code      tinyint not null
, create_timestamp        datetime not null
, update_timestamp        datetime not null
, constraint pk_format
  primary key clustered (format_key)
  on nds_fg6
, constraint fk_format_media
  foreign key (media_key)
  references media(media_key)
) on nds_fg5
go

-- Insert Unknown Record

set identity_insert format on

insert into format
( format_key, format_name
, description, media_key, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown'
, 'Unknown', 0, 0
, '1900-01-01', '1900-01-01' )

set identity_insert format off
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'product')
alter table product
  add constraint fk_product_format
  foreign key (format_key)
  references format(format_key)
go

if exists
  (select * from sys.tables
   where name = 'subscription_sales')
alter table subscription_sales
  add constraint fk_subscription_sales_format
  foreign key (format_key)
  references format(format_key)
go
-- There is no point creating index as this is a tiny table