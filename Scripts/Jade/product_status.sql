use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'product_status')
drop table product_status
go

create table product_status
( product_status_code     char(2) not null primary key
, product_status          varchar(15) 
)
go
