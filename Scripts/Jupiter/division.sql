use Jupiter
go

if exists 
  (select * from sys.tables 
   where name = 'division')
drop table division
go

create table division
( division_code       varchar(5) not null primary key
, division_name       varchar(50)
)
go

