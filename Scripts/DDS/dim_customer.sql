use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_customer'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_customer'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_subscription_sales_dim_customer'
   and parent_object_id = object_id('fact_subscription_sales'))
alter table fact_subscription_sales
  drop constraint fk_fact_subscription_sales_dim_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_product_sales_dim_customer'
   and parent_object_id = object_id('fact_product_sales'))
alter table fact_product_sales
  drop constraint fk_fact_product_sales_dim_customer
go

-- Drop and create the table:

if exists 
  (select * from sys.tables 
   where name = 'dim_customer')
drop table dim_customer
go

create table dim_customer
( customer_key         int not null
, customer_id          varchar(10) not null
, account_number       int
, customer_type        char(3)
, name                 varchar(100)
, gender               char(1)
, email_address        varchar(200)
, date_of_birth        datetime
, address1             varchar(50)
, address2             varchar(50)
, address3             varchar(50)
, address4             varchar(50)
, city                 varchar(50)
, state                varchar(50)
, zipcode              varchar(10)
, country              varchar(50)
, phone_number         varchar(20)
, occupation           varchar(50)
, household_income     varchar(30)
, date_registered      datetime
, status               varchar(10)
, subscriber_class     varchar(30)
, subscriber_band      varchar(30)
, permission           varchar(2)
, preferred_channel1   varchar(20)
, preferred_channel2   varchar(20)
, interest1            varchar(30)
, interest2            varchar(30)
, interest3            varchar(30)
, effective_timestamp  datetime
, expiry_timestamp     datetime
, is_current           tinyint
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_customer 
  primary key clustered (customer_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_subscription_sales')
alter table fact_subscription_sales
  add constraint fk_fact_subscription_sales_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_product_sales')
alter table fact_product_sales
  add constraint fk_fact_product_sales_dim_customer
  foreign key (customer_key)
  references dim_customer(customer_key)
go

-- Build indexes

if exists 
  (select * from sys.indexes 
   where name = 'dim_customer_customer_id'
   and object_id = object_id('dim_customer'))
drop index dim_customer.dim_customer_customer_id
go

create unique index dim_customer_customer_id
  on dim_customer(customer_id)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_customer_email_address'
   and object_id = object_id('dim_customer'))
drop index dim_customer.dim_customer_email_address
go

create index dim_customer_email_address
  on dim_customer(email_address)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_customer_city'
   and object_id = object_id('dim_customer'))
drop index dim_customer.dim_customer_city
go

create index dim_customer_city
  on dim_customer(city)
  on dds_fg6
go

if exists 
  (select * from sys.indexes 
   where name = 'dim_customer_occupation'
   and object_id = object_id('dim_customer'))
drop index dim_customer.dim_customer_occupation
go

create index dim_customer_occupation
  on dim_customer(occupation)
  on dds_fg6
go

