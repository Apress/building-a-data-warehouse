use NDS
go

if exists 
  (select * from sys.tables 
   where name = 'interest_junction')
drop table interest_junction
go

create table interest_junction
( interest_junction_key int not null identity(1,1)
, customer_key          int not null
, interest_key          int not null
, interest_type_key     int 
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_interest_junction 
  primary key clustered (interest_junction_key)
  on nds_fg6
, constraint fk_interest_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_interest_junction_interest
  foreign key (interest_key)
  references interest(interest_key)
) on nds_fg2
go
