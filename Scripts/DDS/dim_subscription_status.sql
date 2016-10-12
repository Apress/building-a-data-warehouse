use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_subscription_status'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_subscription_status
go

-- Drop and create table:

if exists 
  (select * from sys.tables
   where name = 'dim_subscription_status')
drop table dim_subscription_status
go

create table dim_subscription_status
( subscription_status_key    int not null
, subscription_status_code   char(2)
, description                varchar(50)
, source_system_code         tinyint
, create_timestamp           datetime
, update_timestamp           datetime
, constraint pk_dim_subscription_status
  primary key clustered (subscription_status_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_subscription_status
  foreign key (subscription_status_key)
  references dim_subscription_status(subscription_status_key)
go
