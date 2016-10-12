use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'currency_rate')
drop table currency_rate
go

create table currency_rate
( effective_date      datetime 
, currency_code       char(3)  
, currency_rate       decimal(18, 10)
, created             datetime
, last_updated        datetime
)
go
