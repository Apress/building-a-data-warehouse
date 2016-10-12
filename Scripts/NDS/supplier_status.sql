use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_supplier_supplier_status'
   and parent_object_id = object_id('supplier'))
alter table supplier
  drop constraint fk_supplier_supplier_status
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'supplier_status')
drop table supplier_status
go

-- Create the table:

create table supplier_status
( supplier_status_key      int not null identity(1,1)
, supplier_status_code     char(2) not null
, supplier_status          varchar(15) not null
, source_system_code       tinyint not null
, create_timestamp         datetime not null
, update_timestamp         datetime not null
, constraint pk_supplier_status
  primary key clustered (supplier_status_key)
  on nds_fg6
) on nds_fg5
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'supplier')
alter table supplier
  add constraint pk_supplier_supplier_status
  foreign key (supplier_status_key)
  references supplier_status(supplier_status_key)
go

-- There is no point creating index as this is a tiny table