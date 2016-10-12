use Jade
go

if exists
  (select * from sys.tables 
   where name = 'product')
drop table product
go

create table product
( product_code         varchar(10) not null primary key
, name                 varchar(50) 
, description          varchar(100)
, title                varchar(100)
, artist_code          varchar(10)
, product_type_code    varchar(2)
, format               varchar(30)
, unit_price           smallmoney
, unit_cost            smallmoney
, status               varchar(15)
, created              datetime
, last_updated         datetime
) 
go
