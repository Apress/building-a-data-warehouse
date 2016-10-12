use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'product_category')
drop table product_category
go

create table product_category
( product_category      varchar(20) 
, description           varchar(50)
)
go
