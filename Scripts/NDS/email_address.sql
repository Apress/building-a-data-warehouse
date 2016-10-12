use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_email_address_junction_email_address'
   and parent_object_id = object_id('email_address_junction'))
alter table email_address_junction
  drop constraint fk_email_address_junction_email_address
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_email_address'
   and parent_object_id = object_id('supplier'))
alter table supplier
  drop constraint fk_supplier_email_address
go

-- Drop and create table:

if exists 
  (select * from sys.tables 
   where name = 'email_address')
drop table email_address
go

create table email_address
( email_address_key   int not null identity(1,1)
, email_address       varchar(200)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_email_address 
  primary key clustered (email_address_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'email_address_junction')
alter table email_address_junction
  add constraint fk_email_address_junction_email_address
  foreign key (email_address_key)
  references email_address(email_address_key)
go

if exists
  (select * from sys.tables
   where name = 'supplier')
alter table supplier
  add constraint fk_supplier_email_address
  foreign key (email_address_key)
  references email_address(email_address_key)
go

-- Insert Unknown Record:
set identity_insert email_address on

insert into email_address
( email_address_key, email_address, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 0
, '1900-01-01', '1900-01-01' )

set identity_insert email_address off
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'email_address_email_address'
   and object_id = object_id('email_address'))
drop index email_address.email_address_email_address
go

create unique index email_address_email_address
  on email_address(email_address)
  on nds_fg6
go