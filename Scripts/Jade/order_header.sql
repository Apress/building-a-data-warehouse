use Jade
go

if exists (select * from sys.tables where name = 'order_header')
drop table order_header
go

create table order_header
( order_id          int not null primary key
, order_date        datetime
, customer_number   int
, store_number      int
, currency          char(3)
, created           datetime
, last_updated      datetime
)
go

