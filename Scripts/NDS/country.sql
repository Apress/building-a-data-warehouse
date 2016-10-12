use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_country'
   and parent_object_id = object_id('address'))
alter table address
  drop constraint fk_address_country
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'country')
drop table country
go

-- Create the table:

create table country
( country_key         int not null identity(1,1)
, country_code        char(2)
, country_name        varchar(50)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_country 
  primary key clustered (country_key)
  on nds_fg6
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'address')
alter table address
  add constraint fk_address_country
  foreign key (country_key)
  references country(country_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'country_name'
   and object_id = object_id('country_name'))
drop index country.country_name
go

create unique index country_name
  on country(country_name)
  on nds_fg6
go
