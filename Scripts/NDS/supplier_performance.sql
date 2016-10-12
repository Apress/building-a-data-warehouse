use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'supplier_performance')
drop table supplier_performance
go

-- Create the table:

create table supplier_performance
( week_number               int      not null
, supplier_key              int      not null
, product_key               int      not null
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
, source_system_code        tinyint not null
, create_timestamp          datetime not null
, update_timestamp          datetime not null
, constraint pk_supplier_performance
  primary key clustered (week_number, supplier_key, product_key)
  on nds_fg6
) on nds_fg5
go

-- Build indexes:

if exists
  (select * from sys.indexes
   where name = 'supplier_key'
   and object_id = object_id('supplier_performance'))
drop index supplier_performance.supplier_key
go

create unique index supplier_key
  on supplier_performance(supplier_key)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'product_key'
   and object_id = object_id('supplier_performance'))
drop index supplier_performance.product_key
go

create unique index product_key
  on supplier_performance(product_key)
  on nds_fg6
go
