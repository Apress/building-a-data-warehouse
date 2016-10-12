use NDS
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'subscription_sales')
drop table subscription_sales
go

-- Create the table:

create table subscription_sales
( snapshot_date             datetime
, customer_key              int      not null
, package_key               int      not null
, format_key                int      not null
, store_key                 int      not null
, subscription_start_date   datetime
, subscription_end_date     datetime
, lead_key                  int      not null
, subscription_id           int      not null
, subscription_revenue      money
, single_titles_revenue     money    
, monthly_revenue           money
, music_quantity            int
, music_unit_cost           money
, monthly_music_cost        money
, film_quantity             int
, film_unit_cost            money
, monthly_film_cost         money
, book_quantity             int
, book_unit_cost            money
, monthly_book_cost         money
, monthly_indirect_cost     money
, monthly_cost              money
, monthly_margin            money
, annual_revenue            money
, annual_cost               money
, annual_profit             money
, subscriber_profitability  decimal(9,2)
, subscribe_timestamp       datetime
, unsubscribe_timestamp     datetime
, source_system_code        tinyint not null
, create_timestamp          datetime not null
, update_timestamp          datetime not null
, constraint pk_subscription_sales
  primary key clustered (snapshot_date, customer_key, package_key)
  on nds_fg6
, constraint fk_subscription_sales_customer
  foreign key (customer_key)
  references customer(customer_key)
, constraint fk_subscription_sales_package
  foreign key (package_key)
  references package(package_key)
, constraint fk_subscription_sales_format
  foreign key (format_key)
  references format(format_key)
, constraint fk_subscription_sales_store
  foreign key (store_key)
  references store(store_key)
, constraint fk_subscription_sales_lead
  foreign key (lead_key)
  references lead(lead_key)
) on [primary]
go

-- Build indexes

if exists
  (select * from sys.indexes
   where name = 'customer_key'
   and object_id = object_id('subscription_sales'))
drop index subscription_sales.customer_key
go

create unique index customer_key
  on subscription_sales(customer_key)
  on nds_fg6
go

if exists
  (select * from sys.indexes
   where name = 'package_key'
   and object_id = object_id('subscription_sales'))
drop index subscription_sales.package_key
go

create unique index package_key
  on subscription_sales(package_key)
  on nds_fg6
go
