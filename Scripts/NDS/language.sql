use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_language'
   and parent_object_id = object_id('communication'))
alter table communication
  drop constraint fk_communication_language
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'language')
drop table language
go

-- Create the table:

create table language
( language_key          int not null identity(1,1)
, language_code         char(3) not null
, language_name         varchar(50) not null
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_language
  primary key clustered (language_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication')
alter table communication
  add constraint fk_communication_language
  foreign key (language_key)
  references language(language_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'language_code' 
   and object_id = object_id('language'))
drop index language.language_code
go

create unique index language_code
  on language(language_code)
  on nds_fg6
go
