use NDS
go

-- Remove FK

if exists
  (select * from sys.foreign_keys
   where name = 'fk_interest_junction_interest'
   and parent_object_id = object_id('interest_junction'))
alter table interest_junction
  drop constraint fk_interest_junction_interest
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'interest')
drop table interest
go

-- Create the table:

create table interest
( interest_key             int not null identity(1,1)
, interest                 varchar(30)
, description              varchar(50)
, interest_group           varchar(30)
, associated_product_type  varchar(15)
, related_interest_key     int
, source_system_code       tinyint not null
, create_timestamp         datetime not null
, update_timestamp         datetime not null
, constraint pk_interest 
  primary key clustered (interest_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'interest_junction')
alter table interest_junction
  add constraint fk_interest_junction_interest
  foreign key (interest_key)
  references interest(interest_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'interest_code'
   and object_id = object_id('interest'))
drop index interest.interest_code
go

create unique index interest
  on interest(interest)
  on nds_fg6
go
