use Stage
go

if exists 
  (select * from sys.tables 
   where name = 'interest')
drop table interest
go

create table interest
( interest                 varchar(30) 
, description              varchar(50)
, interest_group           varchar(30)
, associated_product_type  varchar(15)
, related_interest         varchar(30)
)
go
