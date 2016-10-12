use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_email_address_junction_email_address_type'
   and parent_object_id = object_id('email_address_junction'))
alter table email_address_junction
  drop constraint fk_email_address_junction_email_address_type
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'email_address_type')
drop table email_address_type
go

-- Create the table:

create table email_address_type
( email_address_type_key    int not null identity(1,1)
, email_address_type_code   char(2)
, email_address_type        varchar(10)
, description               varchar(30)
, source_system_code        tinyint not null
, create_timestamp          datetime not null
, update_timestamp          datetime not null
, constraint pk_email_address_type
  primary key clustered (email_address_type_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'email_address_junction')
alter table email_address_junction
  add constraint fk_email_address_junction_email_address_type
  foreign key (email_address_type_key)
  references email_address_type(email_address_type_key)
go

-- There is no point creating index as this is a tiny table