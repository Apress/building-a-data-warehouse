use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_phone_number_junction_phone_number_type'
   and parent_object_id = object_id('phone_number_junction'))
alter table phone_number_junction
  drop constraint fk_phone_number_junction_phone_number_type
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'phone_number_type')
drop table phone_number_type
go

-- Create the table:

create table phone_number_type
( phone_number_type_key    int not null identity(1,1)
, phone_number_type_code   char(2)
, phone_number_type        varchar(10)
, description               varchar(30)
, source_system_code        tinyint not null
, create_timestamp          datetime not null
, update_timestamp          datetime not null
, constraint pk_phone_number_type
  primary key clustered (phone_number_type_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'phone_number_junction')
alter table phone_number_junction
  add constraint fk_phone_number_junction_phone_number_type
  foreign key (phone_number_type_key)
  references phone_number_type(phone_number_type_key)
go

-- There is no point creating index as this is a tiny table