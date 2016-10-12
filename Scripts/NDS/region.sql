use NDS
go

-- Remove FK before dropping table:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_store_region'
   and parent_object_id = object_id('store'))
alter table store
  drop constraint fk_store_region
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'region')
drop table region
go

-- Create the table:

create table region
( region_key          int not null identity(1,1)
, region_code         varchar(5)
, region_name         varchar(50)
, division_key        int
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_region
  primary key clustered (region_key)
  on nds_fg6
, constraint fk_region_division
  foreign key (division_key)
  references division(division_key)
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'store')
alter table store
  add constraint fk_store_region
  foreign key (region_key)
  references region(region_key)
go

-- There is no point creating index as this is a small table