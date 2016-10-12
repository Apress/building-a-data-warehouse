use WebTower
go

if exists 
  (select * from sys.tables 
   where name = 'package_type')
drop table package_type
go

create table package_type
( package_type_code     char(5) not null primary key
, package_type          varchar(15) 
)
go
