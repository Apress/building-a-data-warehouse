use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_communication_category'
   and parent_object_id = object_id('communication'))
alter table communication
  drop constraint fk_communication_communication_category
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'communication_category')
drop table communication_category
go

-- Create the table:

create table communication_category
( communication_category_key       int not null identity(1,1)
, communication_category_code      char(3) not null
, communication_category_name      varchar(20) not null
, source_system_code               tinyint not null
, create_timestamp                 datetime not null
, update_timestamp                 datetime not null
, constraint pk_communication_category
  primary key clustered (communication_category_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication')
alter table communication
  add constraint fk_communication_communication_category
  foreign key (category_key)
  references communication_category(communication_category_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'communication_category_code' 
   and object_id = object_id('communication_category'))
drop index communication_category.communication_category_code
go

create unique index communication_category_code
  on communication_category(communication_category_code)
  on nds_fg6
go
