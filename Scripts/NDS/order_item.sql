use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'order_item')
drop table order_item
go

-- Create the table:

create table order_item
( order_key             int not null
, line_number           int not null
, product_key           int not null
, quantity              decimal (9,2)
, unit_price            smallmoney
, unit_cost             smallmoney
, sales_value           money
, sales_cost            money
, margin                money
, currency_key          int
, currency_rate         smallmoney
, unit_price_usd        smallmoney
, unit_cost_usd         smallmoney
, sales_value_usd       money
, sales_cost_usd        money
, margin_usd            money
, source_system_code    tinyint not null
, create_timestamp      datetime not null
, update_timestamp      datetime not null
, constraint pk_order_item
  primary key clustered (order_key, line_number)
  on nds_fg6
, constraint fk_order_item_order_header
  foreign key (order_key)
  references order_header(order_key)
, constraint fk_order_item_product
  foreign key (product_key)
  references product(product_key)
) on [primary]
go

