use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_store_phone_number'
   and parent_object_id = object_id('store'))
alter table store
  drop constraint fk_store_phone_number
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_phone_number_junction_phone_number'
   and parent_object_id = object_id('phone_number_junction'))
alter table phone_number_junction
  drop constraint fk_phone_number_junction_phone_number
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_phone_number'
   and parent_object_id = object_id('supplier'))
alter table supplier
  drop constraint fk_supplier_phone_number
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'phone_number')
drop table phone_number
go

-- Create the table:

create table phone_number
( phone_number_key        int not null identity(1,1)
, phone_number            varchar(20)
, source_system_code      tinyint not null
, create_timestamp        datetime not null
, update_timestamp        datetime not null
, constraint pk_phone_number
  primary key clustered (phone_number_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'store')
alter table store
  add constraint fk_store_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
go

if exists
  (select * from sys.tables
   where name = 'phone_number_junction')
alter table phone_number_junction
  add constraint fk_phone_number_junction_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
go

if exists
  (select * from sys.tables
   where name = 'supplier')
alter table supplier
  add constraint fk_supplier_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'phone_number'
   and object_id = object_id('phone_number'))
drop index phone_number.phone_number
go

create unique index phone_number
  on phone_number(phone_number)
  on nds_fg6
go
