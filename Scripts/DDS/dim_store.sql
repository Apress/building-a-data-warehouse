use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_product_sales_dim_store'
   and parent_object_id = object_id('fact_product_sales'))
alter table fact_product_sales
  drop constraint fk_fact_product_sales_dim_store
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_store'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_store
go

-- Drop and create table:

if exists 
  (select * from sys.tables 
   where name = 'dim_store')
drop table dim_store
go

create table dim_store
( store_key            int not null
, store_number         smallint
, store_name           varchar(50)
, store_type           varchar(30)
, store_address1       varchar(50)
, store_address2       varchar(50)
, store_address3       varchar(50)
, store_address4       varchar(50)
, city                 varchar(50)
, state                varchar(50)
, zipcode              varchar(10)
, country              varchar(50)
, phone_number         varchar(20)
, web_site             varchar(100)
, region               varchar(50)
, prior_region         varchar(50)
, prior_region_date    datetime
, division             varchar(50)
, prior_division       varchar(50)
, prior_division_date  datetime
, source_system_code   tinyint
, create_timestamp     datetime
, update_timestamp     datetime
, constraint pk_dim_store
  primary key clustered (store_key)
  on dds_fg6
) on dds_fg6
go

-- Insert Unknown Record
insert into dim_store
( store_key, store_number, store_name, store_type
, store_address1, store_address2
, store_address3, store_address4
, city, state, zipcode, country
, phone_number, web_site, region
, prior_region, prior_region_date
, division, prior_division
, prior_division_date, source_system_code
, create_timestamp, update_timestamp )
values
( 0, 0, 'Unknown', 'Unknown'
, 'Unknown', 'Unknown'
, 'Unknown', 'Unknown'
, 'Unknown', 'Unknown', 'Unknown', 'Unknown'
, '', 'Unknown', 'Unknown'
, 'Unknown', '1900-01-01'
, 'Unknown', 'Unknown'
, '1900-01-01', 0
, getdate(), getdate())
go

-- Create FK:
if exists 
  (select * from sys.tables
   where name = 'fact_product_sales')
alter table fact_product_sales
  add constraint fk_fact_product_sales_dim_store
  foreign key (store_key)
  references dim_store(store_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_store
  foreign key (store_key)
  references dim_store(store_key)
go

