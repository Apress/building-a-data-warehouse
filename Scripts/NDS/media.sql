use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_format_media'
   and parent_object_id = object_id('format'))
alter table format
  drop constraint fk_format_media
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'media')
drop table media
go

-- Create the table:

create table media
( media_key               int not null identity(1,1)
, media_code              char(10) not null
, media                   varchar(15) not null
, source_system_code      tinyint not null
, create_timestamp        datetime not null
, update_timestamp        datetime not null
, constraint pk_media
  primary key clustered (media_key)
  on nds_fg6
) on nds_fg5
go

-- Insert Unknown Record

set identity_insert media on
insert into media
( media_key, media_code, media
, source_system_code
, create_timestamp, update_timestamp )
values ( 0, 'Unknown', 'Unknown'
, 0, getdate(), getdate())
set identity_insert media off
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'format')
alter table format
  add constraint pk_format_media
  foreign key (media_key)
  references media(media_key)
go

-- There is no point creating index as this is a tiny table