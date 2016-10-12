use NDS
go

-- Drop the table if exists:

if exists 
  (select * from sys.tables 
   where name = 'email_address_junction')
drop table email_address_junction
go

-- Create the table:

create table email_address_junction
( email_address_junction_key  int not null identity(1,1)
, customer_key                int not null
, email_address_key           int not null
, email_address_type_key      int
, source_system_code          tinyint not null
, create_timestamp            datetime not null
, update_timestamp            datetime not null
, constraint pk_email_address_junction
  primary key clustered (email_address_junction_key)
  on nds_fg6
, constraint fk_email_address_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_email_address_junction_email_address
  foreign key (email_address_key)
  references email_address(email_address_key)
, constraint fk_email_address_junction_email_address_type
  foreign key (email_address_type_key)
  references email_address_type(email_address_type_key)
) on nds_fg2
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'email_address_junction_customer_key_email_address_key'
   and object_id = object_id('email_address_junction'))
drop index email_address_junction.email_address_junction_customer_key_email_address_key
go

create unique index email_address_junction_customer_key_email_address_key
  on email_address_junction(customer_key, email_address_key)
  on nds_fg6
go

