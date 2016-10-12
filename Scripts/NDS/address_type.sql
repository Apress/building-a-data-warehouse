use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_junction_address_type'
   and parent_object_id = object_id('address_junction'))
alter table address_junction
  drop constraint fk_address_junction_address_type
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'address_type')
drop table address_type
go

-- Create the table:

create table address_type
( address_type_key    int not null identity(1,1)
, address_type_code   char(2)
, address_type        varchar(10)
, description         varchar(30)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_address_type
  primary key clustered (address_type_key)
  on nds_fg6
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'address_junction')
alter table address_junction
  add constraint fk_address_junction_address_type
  foreign key (address_type_key)
  references address_type(address_type_key)
go

-- There is no point creating index as this is a tiny table