use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'address_type')
drop table address_type
go

create table address_type
( address_type_code   char(2)
, address_type        varchar(10)
, description         varchar(30)
)
go
