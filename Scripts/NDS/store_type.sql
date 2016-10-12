use NDS
go

-- Remove FK before dropping table:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_store_store_type'
   and parent_object_id = object_id('store'))
alter table store
  drop constraint fk_store_store_type
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'store_type')
drop table store_type
go

-- Create the table:

create table store_type
( store_type_key      int not null identity(1,1)
, store_type_code     char(2)
, store_type          varchar(10)
, description         varchar(30)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_store_type
  primary key clustered (store_type_key)
  on nds_fg6
) on nds_fg3
go

-- Create the FK:

if exists
  (select * from sys.tables
   where name = 'store')
alter table store
  add constraint fk_store_store_type
  foreign key (store_type_key)
  references store_type(store_type_key)
go

-- There is no point creating index as this is a tiny table