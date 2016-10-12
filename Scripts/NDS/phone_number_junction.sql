use NDS
go

if exists 
  (select * from sys.tables 
   where name = 'phone_number_junction')
drop table phone_number_junction
go

create table phone_number_junction
( phone_number_junction_key  int not null identity(1,1)
, customer_key               int not null
, phone_number_key           int not null
, phone_number_type_key      int
, source_system_code         tinyint not null
, create_timestamp           datetime not null
, update_timestamp           datetime not null
, constraint pk_phone_number_junction
  primary key clustered (phone_number_junction_key)
  on nds_fg6
, constraint fk_phone_number_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_phone_number_junction_phone_number
  foreign key (phone_number_key)
  references phone_number(phone_number_key)
, constraint fk_phone_number_junction_phone_number_type
  foreign key (phone_number_type_key)
  references phone_number_type(phone_number_type_key)
) on nds_fg2
go

if exists
  (select * from sys.indexes
   where name = 'customer_phone_number'
   and object_id = object_id('phone_number_junction'))
drop index phone_number_junction.customer_phone_number
go

create unique index customer_phone_number
  on phone_number_junction(customer_key, phone_number_key)
  on nds_fg6
go