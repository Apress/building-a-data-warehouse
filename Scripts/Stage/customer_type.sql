use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'customer_type')
drop table customer_type
go

create table customer_type
( customer_type_code     char(3) not null unique
, description            varchar(30)
)
go

