use NDS
go

-- Remove FK before dropping table:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_region_division'
   and parent_object_id = object_id('region'))
alter table region
  drop constraint fk_region_division

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'division')
drop table division
go

create table division
( division_key        int not null identity(1,1)
, division_code       varchar(5)
, division_name       varchar(50)
, source_system_code  tinyint not null
, create_timestamp    datetime not null
, update_timestamp    datetime not null
, constraint pk_division
  primary key clustered (division_key)
  on nds_fg6
) on nds_fg3
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'region')
alter table region
  add constraint fk_region_division
  foreign key (division_key)
  references division(division_key)
go

-- there is no point creating index as this is a tiny table