use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_customer_type'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_customer_type
go

if exists 
  (select * from sys.tables 
   where name = 'customer_type')
drop table customer_type
go

create table customer_type
( customer_type_key      int not null identity(1,1)
, customer_type_code     char(3) not null unique
, description            varchar(30)
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_customer_type 
  primary key clustered (customer_type_key)
  on nds_fg6
) on nds_fg2
go

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_customer_type
  foreign key (customer_type_key)
  references customer_type(customer_type_key)
go

-- there is no point creating index as this is a tiny table