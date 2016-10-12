use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_state'
   and parent_object_id = object_id('address'))
alter table address
  drop constraint fk_address_state
go

if exists 
  (select * from sys.tables 
   where name = 'state')
drop table state
go

create table state
( state_key                int not null identity(1,1)
, state_code               varchar(2)
, state_name               varchar(50)
, formal_name              varchar(100)
, admission_to_statehood   datetime
, population               int
, capital                  varchar(50)
, largest_city             varchar(50)
, source_system_code       tinyint not null
, create_timestamp         datetime not null
, update_timestamp         datetime not null
, constraint pk_state 
  primary key clustered (state_key)
  on nds_fg6
) on nds_fg3
go

if exists
  (select * from sys.tables
   where name = 'address')
alter table address
  add constraint fk_address_state
  foreign key (state_key)
  references state(state_key)
go

if exists
  (select * from sys.indexes
   where name = 'state_name'
   and object_id = object_id('state'))
drop index state.state_name
go

create unique index state_name
  on state(state_name)
  on nds_fg6
go