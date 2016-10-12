use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_delivery_status_delivery_status_category'
   and parent_object_id = object_id('delivery_status'))
alter table delivery_status
  drop constraint fk_delivery_status_delivery_status_category
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'delivery_status_category')
drop table delivery_status_category
go

-- Create the table:

create table delivery_status_category
( delivery_status_category_key   int not null identity(1,1)
, delivery_status_category_code  int
, category                       varchar(20)
, source_system_code             tinyint not null
, create_timestamp               datetime not null
, update_timestamp               datetime not null
, constraint pk_delivery_status_category
  primary key clustered (delivery_status_category_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:
if exists
  (select * from sys.tables
   where name = 'delivery_status')
alter table delivery_status
  add constraint fk_delivery_status_delivery_status_category
  foreign key (category_key)
  references delivery_status_category(delivery_status_category_key)
go

-- There is no point creating indexes as this is a small table