use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'currency')
drop table currency
go

create table currency
( currency_code       char(3) 
, currency_name       varchar(30)
)
go
