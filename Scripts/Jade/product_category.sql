use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'product_category')
drop table product_category
go

create table product_category
( product_category      varchar(20) not null primary key
, description           varchar(50)
)
go
