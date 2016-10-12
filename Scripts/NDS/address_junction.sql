use NDS
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'address_junction')
drop table address_junction
go

-- Create the table:

create table address_junction
( address_junction_key  int not null identity(1,1)
, customer_key          int not null
, address_key           int not null
, address_type_key      int
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_address_junction
  primary key clustered (address_junction_key)
  on nds_fg3
, constraint fk_address_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_address_junction_address
  foreign key (address_key)
  references address(address_key)
, constraint fk_address_junction_address_type
  foreign key (address_type_key)
  references address_type(address_type_key)
) on nds_fg3
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'address_junction_customer_key_address_key'
   and object_id = object_id('address_junction'))
drop index address_junction.address_junction_customer_key_address_key
go

create unique index address_junction_customer_key_address_key
  on address_junction(customer_key, address_key)
  on nds_fg6
go