use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_product_artist'
   and parent_object_id = object_id('product'))
alter table product
  drop constraint fk_product_artist
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'artist')
drop table artist
go

-- Create the table:

create table artist
( artist_key           int not null identity(1,1)
, artist_code          char(10) not null
, artist_name          varchar(100) not null
, genre                varchar(30)
, country_key          int
, city_key             int
, source_system_code   tinyint not null
, create_timestamp     datetime not null
, update_timestamp     datetime not null
, constraint pk_artist
  primary key clustered (artist_key)
  on nds_fg6
) on nds_fg5
go

-- Insert Unknown Record:
set identity_insert artist on

insert into artist
( artist_key, artist_code, artist_name
, genre, country_key, city_key
, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 'Unknown', 'Unknown'
, 'Unknown', 0, 0
, 0
, '1900-01-01', '1900-01-01' )

set identity_insert artist off
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'product')
alter table product
  add constraint pk_product_artist
  foreign key (artist_key)
  references artist(artist_key)
go

