use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'package')
drop table package
go

create table package
( name                  varchar(30) 
, description           varchar(100)
, package_type          varchar(5)
, package_price         money
, source_system_code    int
, date_loaded           datetime default getdate()
)
go
