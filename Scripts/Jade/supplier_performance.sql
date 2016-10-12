use Jade
go

if exists 
  (select * from sys.tables 
   where name = 'supplier_performance')
drop table supplier_performance
go

create table supplier_performance
( supplier_id               int      not null
, product_id                int      not null
, start_date                datetime 
, ordered_quantity          int
, unit_cost                 money
, ordered_value             money
, returns_quantity          int
, returns_value             money
, rejects_quantity          int
, rejects_value             money
, total_spend               money
, title_availability        decimal (9,2)
, format_availability       decimal (9,2)
, stock_outage              decimal (9,2)
, average_lead_time         smallint
, constraint pk_supplier_performance
  primary key clustered (supplier_id, product_id)
) 
go

