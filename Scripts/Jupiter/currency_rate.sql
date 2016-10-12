use Jupiter
go

if exists 
  (select * from sys.tables 
   where name = 'currency_rate')
drop table currency_rate
go

create table currency_rate
( effective_date      datetime not null
, currency_code       char(3)  not null
, currency_rate       decimal(18, 10)
, created             datetime
, last_updated        datetime
, constraint pk_currency_rate
  primary key clustered (currency_code, effective_date)
)
go
