use NDS
go

-- Drop FK from other tables:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_address_junction_customer'
   and parent_object_id = object_id('address_junction'))
alter table address_junction
  drop constraint fk_address_junction_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_phone_number_junction_customer'
   and parent_object_id = object_id('phone_number_junction'))
alter table phone_number_junction
  drop constraint fk_phone_number_junction_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_email_address_junction_customer'
   and parent_object_id = object_id('email_address_junction'))
alter table email_address_junction
  drop constraint fk_email_address_junction_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_interest_junction_customer'
   and parent_object_id = object_id('interest_junction'))
alter table interest_junction
  drop constraint fk_interest_junction_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_subscription_sales_customer'
   and parent_object_id = object_id('subscription_sales'))
alter table subscription_sales
  drop constraint fk_subscription_sales_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_subscription_customer'
   and parent_object_id = object_id('communication_subscription'))
alter table communication_subscription
  drop constraint fk_communication_subscription_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_campaign_result_customer'
   and parent_object_id = object_id('campaign_result'))
alter table campaign_result
  drop constraint fk_campaign_result_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_channel_junction_customer'
   and parent_object_id = object_id('channel_junction'))
alter table channel_junction
  drop constraint fk_channel_junction_customer
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_order_header_customer'
   and parent_object_id = object_id('order_header'))
alter table order_header
  drop constraint fk_order_header_customer
go

-- Drop table if exists:

if exists 
  (select * from sys.tables 
   where name = 'customer')
drop table customer
go

-- Create customer table:

create table customer
( customer_key           int not null identity(1,1)
, customer_id            varchar(10) not null
, account_number         int
, customer_type_key      int
, name                   varchar(100) not null
, gender                 char(1)
, date_of_birth          datetime
, occupation_key         int
, household_income_key   int
, date_registered        datetime
, customer_status_key    int
, subscriber_class_key   int
, subscriber_band_key    int
, permission_key         int
, source_system_code     tinyint not null
, create_timestamp       datetime not null
, update_timestamp       datetime not null
, constraint pk_customer 
  primary key clustered (customer_key)
  on nds_fg6
, constraint fk_customer_occupation
  foreign key (occupation_key)
  references occupation(occupation_key)
, constraint fk_customer_household_income
  foreign key (household_income_key)
  references household_income(household_income_key)
, constraint fk_customer_customer_status
  foreign key (customer_status_key)
  references customer_status(customer_status_key)
, constraint fk_customer_subscriber_class
  foreign key (subscriber_class_key)
  references subscriber_class(subscriber_class_key)
, constraint fk_customer_subscriber_band
  foreign key (subscriber_band_key)
  references subscriber_band(subscriber_band_key)
, constraint fk_customer_permission
  foreign key (permission_key)
  references permission(permission_key)
) on nds_fg2
go

-- Establish FK from other tables:

if exists
  (select * from sys.tables
   where name = 'address_junction')
alter table address_junction
  add constraint fk_address_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'phone_number_junction')
alter table phone_number_junction
  add constraint fk_phone_number_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'email_address_junction')
alter table email_address_junction
  add constraint fk_email_address_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'interest_junction')
alter table interest_junction
  add constraint fk_interest_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'subscription_sales')
alter table subscription_sales
  add constraint fk_subscription_sales_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'communication_subscription')
alter table communication_subscription
  add constraint fk_communication_subscription_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'campaign_result')
alter table campaign_result
  add constraint fk_campaign_result_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'channel_junction')
alter table channel_junction
  add constraint fk_channel_junction_customer
  foreign key (customer_key)
  references customer(customer_key)
go

if exists
  (select * from sys.tables
   where name = 'order_header')
alter table order_header
  add constraint fk_order_header_customer
  foreign key (customer_key)
  references customer(customer_key)
go

-- Build indexes:

if exists
  (select * from sys.indexes 
   where name = 'customer_customer_id' 
   and object_id = object_id('customer'))
drop index customer.customer_customer_id
go

create unique index customer_customer_id
  on customer(customer_id)
  on nds_fg6
go

