use Jade
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

insert into address_type
values ( 'H', 'Home', 'Home Email Address' )

insert into address_type
values ( 'W', 'Work', 'Work Email Address' )
go
