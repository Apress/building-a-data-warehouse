use NDS
go

-- Drop FK from other table if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_performance_supplier'
   and parent_object_id = object_id('supplier_performance'))
alter table supplier_performance
  drop constraint fk_supplier_performance_supplier
go

-- Drop table if exists:

if exists 
  (select * from sys.tables 
   where name = 'supplier')
drop table supplier
go

-- Create supplier table:

create table supplier
( supplier_key           int not null identity(1,1)
, supplier_code          varchar(12) not null
, account_number         int
, short_name             varchar(30)
, full_name              varchar(50)
, address_key            int
, phone_number_key       int
, supplier_status_key    int
, email_address_key      int
, website                varchar(100)
, contact_key            int
, effective_timestamp    datetime not null
, expiry_timestamp       datetime not null
, is_current             tinyint not null
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_supplier 
  primary key clustered (supplier_key)
  on nds_fg6
, constraint fk_supplier_address
  foreign key (address_key)
  references address(address_key)
, constraint fk_supplier_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
, constraint fk_supplier_supplier_status
  foreign key (supplier_status_key)
  references supplier_status(supplier_status_key)
, constraint fk_supplier_email_address
  foreign key (email_address_key)
  references email_address(email_address_key)
, constraint fk_supplier_contact
  foreign key (contact_key)
  references contact(contact_key)
) on nds_fg5
go

-- Establish FK from other tables:

if exists
  (select * from sys.tables
   where name = 'supplier_performance')
alter table supplier_performance
  add constraint fk_supplier_performance_supplier
  foreign key (supplier_key)
  references supplier(supplier_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'supplier_code' 
   and object_id = object_id('supplier'))
drop index supplier.supplier_code
go

create unique index supplier_code
  on supplier(supplier_code)
  on nds_fg6
go

