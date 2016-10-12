use Jupiter
go

if exists 
  (select * from sys.tables 
   where name = 'currency')
drop table currency
go

create table currency
( currency_code       char(3) not null primary key
, currency_name       varchar(30)
)
go
