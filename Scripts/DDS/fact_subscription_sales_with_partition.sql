use dds
go

if exists 
  (select * from sys.tables 
   where name = 'fact_subscription_sales')
drop table fact_subscription_sales
go

if exists
  (select * from sys.partition_schemes
   where name = 'ps_subscription_sales')
drop partition scheme ps_subscription_sales
go

if exists
  (select * from sys.partition_functions
   where name = 'pf_subscription_sales')
drop partition function pf_subscription_sales
go

create partition function pf_subscription_sales (int)
as range left for values 
(10365, 10396, 10425, 10456, 10486, 10517
, 10547, 10578, 10609, 10639, 10670, 10700, 10731)
go

create partition scheme ps_subscription_sales
as partition pf_subscription_sales to 
(dds_fg2, dds_fg3, dds_fg5, dds_fg2, dds_fg3, dds_fg5
, dds_fg2, dds_fg3, dds_fg5, dds_fg2, dds_fg3, dds_fg5
, dds_fg2, dds_fg3)
go

create table fact_subscription_sales
( fact_key                  int   not null identity(1,1)
, date_key                  int   not null
, customer_key              int   not null
, package_key               int   not null
, format_key                int   not null
, store_key                 int   not null
, start_date_key            int   not null
, end_date_key              int   not null
, lead_key                  int   not null
, subscription_id           int   not null
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
, source_system_code        tinyint
, create_timestamp          datetime
, update_timestamp          datetime
, constraint pk_fact_subscription_sales 
  primary key clustered (fact_key) 
  on ps_subscription_sales(fact_key)
, constraint fk_fact_subscription_sales_dim_date1
  foreign key (date_key)
  references dim_date(date_key)
, constraint fk_fact_subscription_sales_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
, constraint fk_fact_subscription_sales_dim_package
  foreign key (package_key)
  references dim_package(package_key)
, constraint fk_fact_subscription_sales_dim_store
  foreign key (store_key)
  references dim_store(store_key)
, constraint fk_fact_subscription_sales_dim_date2
  foreign key (start_date_key)
  references dim_date(date_key)
, constraint fk_fact_subscription_sales_dim_date3
  foreign key (end_date_key)
  references dim_date(date_key)
, constraint fk_fact_subscription_sales_dim_lead
  foreign key (lead_key)
  references dim_lead(lead_key)
) on ps_subscription_sales(date_key)
go

create index date_key
on fact_subscription_sales(date_key)
on ps_subscription_sales(date_key)
go

create index package_key
on fact_subscription_sales(package_key)
on ps_subscription_sales(package_key)
go

create index customer_key
on fact_subscription_sales(customer_key)
on ps_subscription_sales(customer_key)
go
