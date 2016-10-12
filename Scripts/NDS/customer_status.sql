use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_customer_status'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_customer_status
go

if exists 
  (select * from sys.tables 
   where name = 'customer_status')
drop table customer_status
go

create table customer_status
( customer_status_key    int not null identity(1,1)
, customer_status_code   varchar(3) not null unique
, description            varchar(10)
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_customer_status 
  primary key clustered (customer_status_key)
  on nds_fg6
) on nds_fg2
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_customer_status
  foreign key (customer_status_key)
  references customer_status(customer_status_key)
go
