use NDS
go

-- Remove FK:

if exists
  (select * from sys.foreign_keys
   where name = 'fk_communication_subscription_channel'
   and parent_object_id = object_id('communication_subscription'))
alter table communication_subscription
  drop constraint fk_communication_subscription_channel
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_campaign_result_channel'
   and parent_object_id = object_id('campaign_result'))
alter table campaign_result
  drop constraint fk_campaign_result_channel
go

if exists
  (select * from sys.foreign_keys
   where name = 'fk_channel_junction_channel'
   and parent_object_id = object_id('channel_junction'))
alter table channel_junction
  drop constraint fk_channel_junction_channel
go

-- Drop the table:

if exists 
  (select * from sys.tables 
   where name = 'channel')
drop table channel
go

-- Create the table:

create table channel
( channel_key          int not null identity(1,1)
, name                 varchar(20) not null
, description          varchar(50)
, start_date           datetime
, end_date             datetime
, status               varchar(10)
, source_system_code   tinyint not null
, create_timestamp     datetime not null
, update_timestamp     datetime not null
, constraint pk_channel
  primary key clustered (channel_key)
  on nds_fg6
) on nds_fg4
go

-- Create FK:

if exists
  (select * from sys.tables
   where name = 'communication_subscription')
alter table communication_subscription
  add constraint fk_communication_channel
  foreign key (channel_key)
  references channel(channel_key)
go

if exists
  (select * from sys.tables
   where name = 'campaign_result')
alter table campaign_result
  add constraint fk_campaign_result_channel
  foreign key (channel_key)
  references channel(channel_key)
go

if exists
  (select * from sys.tables
   where name = 'channel_junction')
alter table channel_junction
  add constraint fk_channel_junction_channel
  foreign key (channel_key)
  references channel(channel_key)
go

-- There is no point creating indexes as this is a small table