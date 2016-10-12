use DDS
go

-- Drop FK if exists:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_campaign_result_dim_channel'
   and parent_object_id = object_id('fact_campaign_result'))
alter table fact_campaign_result
  drop constraint fk_fact_campaign_result_dim_channel
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_fact_communication_subscription_dim_channel'
   and parent_object_id = object_id('fact_communication_subscription'))
alter table fact_communication_subscription
  drop constraint fk_fact_communication_subscription_dim_channel
go

-- Drop and create the table:

if exists 
  (select * from sys.tables
   where name = 'dim_channel')
drop table dim_channel
go

create table dim_channel
( channel_key          int not null
, name                 varchar(20)
, description          varchar(50)
, start_date           smalldatetime
, end_date             smalldatetime
, status               varchar(10)
, source_system_code   tinyint   not null
, create_timestamp     datetime  not null
, update_timestamp     datetime  not null
, constraint pk_dim_channel
  primary key clustered (channel_key)
  on dds_fg6
) on dds_fg6
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'fact_campaign_result')
alter table fact_campaign_result
  add constraint fk_fact_campaign_result_dim_channel
  foreign key (channel_key)
  references dim_channel(channel_key)
go

if exists
  (select * from sys.tables
   where name = 'fact_communication_subscription')
alter table fact_communication_subscription
  add constraint fk_fact_communication_subscription_dim_channel
  foreign key (channel_key)
  references dim_channel(channel_key)
go