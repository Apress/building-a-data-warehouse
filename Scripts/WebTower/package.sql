use WebTower
go

if exists 
  (select * from sys.tables 
   where name = 'package')
drop table package
go

create table package
( name                  varchar(30) not null primary key
, description           varchar(100)
, package_type          varchar(5)
, package_price         money
)
go
