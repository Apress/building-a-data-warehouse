use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_permission'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_permission
go

if exists 
  (select * from sys.tables 
   where name = 'permission')
drop table permission
go

create table permission
( permission_key        int not null identity(1,1)
, permission_code       varchar(2) not null unique
, description           varchar(30)
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_permission 
  primary key clustered (permission_key)
  on nds_fg6
) on nds_fg2
go

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_permission
  foreign key (permission_key)
  references permission(permission_key)
go

-- There is no point creating index as this is a tiny table