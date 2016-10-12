use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'product_type')
drop table product_type
go

create table product_type
( product_type_code     char(2) not null primary key
, product_type          varchar(15) not null
, product_category      varchar(20)
)
go
