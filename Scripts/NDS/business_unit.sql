use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_business_unit'
   and parent_object_id = object_id('communication'))
alter table communication
  drop constraint fk_communication_business_unit
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'business_unit')
drop table business_unit
go

-- Create the table:

create table business_unit
( business_unit_key     int not null identity(1,1)
, business_unit_code    char(3) not null
, business_unit_name    varchar(30) not null
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_business_unit
  primary key clustered (business_unit_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication')
alter table communication
  add constraint fk_communication_business_unit
  foreign key (issuing_unit_key)
  references business_unit(business_unit_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'business_unit_code' 
   and object_id = object_id('business_unit'))
drop index business_unit.business_unit_code
go

create unique index business_unit_code
  on business_unit(business_unit_code)
  on nds_fg6
go
