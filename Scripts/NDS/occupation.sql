use NDS
go

-- Remove FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_occupation'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_occupation
go

-- Drop and create table:

if exists 
  (select * from sys.tables 
   where name = 'occupation')
drop table occupation
go

create table occupation
( occupation_key       int not null identity(1,1)
, occupation_code      varchar(10) not null
, occupation           varchar(30)
, description          varchar(50)
, category             varchar(30)
, source_system_code   tinyint  not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_occupation 
  primary key clustered (occupation_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_occupation
  foreign key (occupation_key)
  references occupation(occupation_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'occupation_code'
   and object_id = object_id('occupation'))
drop index occupation.occupation_code
go

create unique index occupation_code
  on occupation(occupation_code)
  on nds_fg6
go