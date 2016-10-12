use NDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_store_address'
   and parent_object_id = object_id('store'))
alter table store
  drop constraint fk_store_address
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_junction_address'
   and parent_object_id = object_id('address_junction'))
alter table address_junction
  drop constraint fk_address_junction_address
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_address'
   and parent_object_id = object_id('supplier'))
alter table supplier
  drop constraint fk_supplier_address
go

-- Drop and create table:

if exists 
  (select * from sys.tables 
   where name = 'address')
drop table address
go

create table address
( address_key         int not null identity(1,1)
, address1            varchar(50)
, address2            varchar(50)
, address3            varchar(50)
, address4            varchar(50)
, city_key            int
, post_code           varchar(10)
, state_key           int
, country_key         int
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_address 
  primary key clustered (address_key)
  on nds_fg6
, constraint fk_address_city
  foreign key (city_key)
  references city(city_key)
, constraint fk_address_state
  foreign key (state_key)
  references state(state_key)
, constraint fk_address_country
  foreign key (country_key)
  references country(country_key)
) on nds_fg3
go

-- Create FKs:

if exists
  (select * from sys.tables
   where name = 'store')
alter table store
  add constraint fk_store_address
  foreign key (address_key)
  references address(address_key)
go

if exists
  (select * from sys.tables
   where name = 'address_junction')
alter table address_junction
  add constraint fk_address_junction_address
  foreign key (address_key)
  references address(address_key)
go

if exists
  (select * from sys.tables
   where name = 'supplier')
alter table supplier
  add constraint fk_supplier_address
  foreign key (address_key)
  references address(address_key)
go

-- there is no point creating a cover index as it would contain almost every column