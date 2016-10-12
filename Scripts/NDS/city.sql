use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_city'
   and parent_object_id = object_id('address'))
alter table address
  drop constraint fk_address_city
go

-- Drop and create table:

if exists 
  (select * from sys.tables 
   where name = 'city')
drop table city
go

create table city
( city_key            int not null identity(1,1)
, city_name           varchar(50)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_city 
  primary key clustered (city_key)
  on nds_fg6
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'address')
alter table address
  add constraint fk_address_city
  foreign key (city_key)
  references city(city_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'city_name'
   and object_id = object_id('city_name'))
drop index city.city_name
go

create unique index city_name
  on city(city_name)
  on nds_fg6
go