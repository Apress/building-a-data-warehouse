use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'customer_status')
drop table customer_status
go

create table customer_status
( customer_status_code   varchar(3)
, description            varchar(10)
)
go

