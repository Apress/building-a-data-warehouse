use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_contact'
   and parent_object_id = object_id('supplier'))
alter table supplier
  drop constraint fk_supplier_contact
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'contact')
drop table contact
go

-- Create the table:

create table contact
( contact_key              int not null identity(1,1)
, contact_code             char(10) not null
, contact_name             varchar(100) not null
, title                    varchar(35)
, source_system_code       tinyint not null
, create_timestamp         datetime not null
, update_timestamp         datetime not null
, constraint pk_contact
  primary key clustered (contact_key)
  on nds_fg6
) on nds_fg5
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'supplier')
alter table supplier
  add constraint pk_supplier_contact
  foreign key (contact_key)
  references contact(contact_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'contact_code'
   and object_id = object_id('contact'))
drop index contact.contact_code
go

create unique index contact_code
  on contact(contact_code)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'contact_name'
   and object_id = object_id('contact'))
drop index contact.contact_name
go

create unique index contact_name
  on contact(contact_name)
  on nds_fg6
go
