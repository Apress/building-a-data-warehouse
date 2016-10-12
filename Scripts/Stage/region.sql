use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'region')
drop table region
go

create table region
( region_code         varchar(5)   not null primary key
, region_name         varchar(50)
, division_code       varchar(5)
, source_system_code  int
, date_loaded         datetime default getdate()
)
go
