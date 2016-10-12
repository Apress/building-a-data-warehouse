use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_package_package_type'
   and parent_object_id = object_id('package'))
alter table package
  drop constraint fk_package_package_type
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'package_type')
drop table package_type
go

-- Create the table:

create table package_type
( package_type_key      int not null identity(1,1)
, package_type_code     char(5) not null
, package_type          varchar(15) not null
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_package_type
  primary key clustered (package_type_key)
  on nds_fg6
) on [primary]
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'package')
alter table package
  add constraint fk_package_package_type
  foreign key (package_type_key)
  references package_type(package_type_key)
go

-- There is no point creating indexes as this is a small table