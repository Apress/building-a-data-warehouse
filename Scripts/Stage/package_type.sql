use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'package_type')
drop table package_type
go

create table package_type
( package_type_code     char(5) 
, package_type          varchar(15) 
, source_system_code    int
, date_loaded           datetime default getdate()
)
go
