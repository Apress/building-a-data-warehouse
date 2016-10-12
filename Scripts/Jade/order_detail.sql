use Jade
go

if exists (select * from sys.tables where name = 'order_detail')
drop table order_detail
go

create table order_detail
( order_id              int not null
, line_no               int not null
, product_code          varchar(10)
, qty                   decimal (9,2)
, price                 smallmoney
, unit_cost             smallmoney
, primary key (order_id, line_no)
)
go