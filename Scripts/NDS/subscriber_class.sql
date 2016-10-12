use NDS
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_customer_subscriber_class'
   and parent_object_id = object_id('customer'))
alter table customer
  drop constraint fk_customer_subscriber_class
go

if exists 
  (select * from sys.tables 
   where name = 'subscriber_class' and type = 'U')
drop table subscriber_class
go

create table subscriber_class
( subscriber_class_key   int not null identity(1,1)
, class_code             varchar(2) not null unique
, lower_limit            money
, upper_limit            money
, description            varchar(30)
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_subscriber_class 
  primary key clustered (subscriber_class_key)
  on nds_fg6
) on nds_fg2
go

if exists
  (select * from sys.tables
   where name = 'customer')
alter table customer 
  add constraint fk_customer_subscriber_class
  foreign key (subscriber_class_key)
  references subscriber_class(subscriber_class_key)
go

-- there is no point creating index as this is a tiny table