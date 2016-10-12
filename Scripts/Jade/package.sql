use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'package')
drop table package
go

create table package
( name                  varchar(30) not null primary key
, description           varchar(50)
, package_type_code     char(5)
, package_price         money
)
go
